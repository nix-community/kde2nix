#!/usr/bin/env python3
import base64
import binascii
import json
import pathlib

import bs4
import click
import httpx
import jinja2

import utils


LEAF_TEMPLATE = jinja2.Template('''
{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "{{ pname }}";

  meta.license = [ ];
}
'''.strip())

ROOT_TEMPLATE = jinja2.Template('''
{callPackage}: {
  {%- for p in packages %}
  {{ p }} = callPackage ./{{ p }} {};
  {%- endfor %}
}
'''.strip());

def to_sri(hash):
    raw = binascii.unhexlify(hash)
    b64 = base64.b64encode(raw).decode()
    return f"sha256-{b64}"


@click.command
@click.option(
    "--nixpkgs",
    type=click.Path(
        exists=True,
        file_okay=False,
        resolve_path=True,
        writable=True,
        path_type=pathlib.Path,
    ),
)
@click.argument(
    "set",
    type=click.Choice(["frameworks", "gear", "plasma"]),
    required=True
)
@click.argument(
    "version",
    type=str,
    required=True
)
def main(nixpkgs: pathlib.Path, set: str, version: str):
    root_dir = nixpkgs / "pkgs/kde"
    set_dir = root_dir / set
    generated_dir = root_dir / "generated"
    metadata = utils.KDERepoMetadata.from_json(generated_dir)

    set_url = {
        "frameworks": "kf",
        "gear": "releases",
        "plasma": "plasma",
    }[set]

    sources = httpx.get(f"https://www-staging.kde.org/info/sources/source-{set_url}-{version}.html")
    bs = bs4.BeautifulSoup(sources.text, features="html.parser")

    results = {}
    for item in bs.select("tr")[1:]:
        link = item.select_one("td:nth-child(1) a")
        assert link

        hash = item.select_one("td:nth-child(3) tt")
        assert hash

        project_name, version = link.text.rsplit("-", maxsplit=1)
        if project_name not in metadata.projects_by_name:
            print(f"Warning: unknown tarball: {project_name}")

        results[project_name] = {
            "version": version,
            "url": link.attrs["href"],
            "hash": to_sri(hash.text)
        }

        pkg_dir = set_dir / project_name
        pkg_file = pkg_dir / "default.nix"
        if not pkg_file.exists():
            print(f"Generated new package: {set}/{project_name}")
            pkg_dir.mkdir(parents=True, exist_ok=True)
            with pkg_file.open("w") as fd:
                fd.write(LEAF_TEMPLATE.render(pname=project_name) + "\n")

    set_dir.mkdir(parents=True, exist_ok=True)
    with (set_dir / "default.nix").open("w") as fd:
        fd.write(ROOT_TEMPLATE.render(packages=results.keys()) + "\n")

    sources_dir = generated_dir / "sources"
    sources_dir.mkdir(parents=True, exist_ok=True)
    with (sources_dir / f"{set}.json").open("w") as fd:
        json.dump(results, fd, indent=2)


if __name__ == "__main__":
    main()  # type: ignore

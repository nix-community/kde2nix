#!/usr/bin/env python3
import json
import pathlib

import click

import utils

@click.command
@click.argument(
    "repo-metadata",
    type=click.Path(
        exists=True,
        file_okay=False,
        resolve_path=True,
        path_type=pathlib.Path,
    ),
)
@click.argument(
    "nixpkgs",
    type=click.Path(
        exists=True,
        file_okay=False,
        resolve_path=True,
        writable=True,
        path_type=pathlib.Path,
    ),
)
def main(repo_metadata: pathlib.Path, nixpkgs: pathlib.Path):
    metadata = utils.KDERepoMetadata.from_repo_metadata_checkout(repo_metadata)
    out_dir = nixpkgs / "pkgs/kde/generated"
    metadata.write_json(out_dir)

if __name__ == "__main__":
    main()  # type: ignore

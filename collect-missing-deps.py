#!/usr/bin/env python3
import pathlib

OK_MISSING = {
    # we don't use precompiled QML
    'Qt6QuickCompiler',
    'Qt6QmlCompilerPlusPrivate',
    # usually used for version numbers
    'Git',
    # useless by itself, will warn if something else is not found
    'PkgConfig',
    # license verification
    'ReuseTool',
    # map generation
    'OsmTools',
    'Protobuf',
    'PolyClipping',
    # dev only
    'ClangFormat',
    # doesn't exist
    'Qt6X11Extras',
}

def main():
    here = pathlib.Path(__file__).parent
    logs = (here / "logs").glob("*.log")

    for log in sorted(logs):
        missing = []
        is_in_block = False
        try:
            with log.open() as fd:
                for line in fd:
                    line = line.strip()
                    if line == "-- The following OPTIONAL packages have not been found:" or line == "-- The following RECOMMENDED packages have not been found:":
                        is_in_block = True
                    elif line.startswith("--") and is_in_block:
                        is_in_block = False
                    elif line.startswith("*") and is_in_block:
                        package = line.removeprefix("* ")
                        if not any(package.startswith(i) for i in OK_MISSING):
                            missing.append(package)

            if missing:
                print(log.name, "missing deps")
                for line in missing:
                    print("-", line)
        except UnicodeDecodeError:
            print("Failed to parse", log.name)

if __name__ == '__main__':
    main()

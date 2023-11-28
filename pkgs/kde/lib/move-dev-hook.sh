# shellcheck shell=bash
# shellcheck disable=SC2154

moveKF6DevTools() {
    moveToOutput share/kdevappwizard "${!outputDev}"
    moveToOutput "${qtPluginPrefix}/designer" "${!outputDev}"
}

postInstallHooks+=('moveKF6DevTools')

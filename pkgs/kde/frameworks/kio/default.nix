{
  mkKdeDerivation,
  fetchpatch,
  qt5compat,
  qttools,
  acl,
  attr,
}:
mkKdeDerivation {
  pname = "kio";

  patches = [
    # Remove hardcoded smbd search path
    # FIXME(later): discuss with upstream?
    ./0001-Remove-impure-smbd-search-path.patch
    (fetchpatch {
      url = "https://invent.kde.org/frameworks/kio/-/commit/146db4f79413b3a904e5ff252ca61bb09e17be2c.diff";
      hash = "sha256-6tDHmGbRweauJJY8bNQMmRZKHQplhvyMN6On1SstXgM=";
    })
  ];

  extraBuildInputs = [qt5compat qttools acl attr];
}

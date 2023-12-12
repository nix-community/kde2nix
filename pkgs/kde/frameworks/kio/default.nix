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

    # backports
    (fetchpatch {
      url = "https://invent.kde.org/frameworks/kio/-/commit/146db4f79413b3a904e5ff252ca61bb09e17be2c.diff";
      hash = "sha256-6tDHmGbRweauJJY8bNQMmRZKHQplhvyMN6On1SstXgM=";
    })
    (fetchpatch {
      url = "https://invent.kde.org/frameworks/kio/-/commit/cbafb685bce8a7a09543d5fa3df286955cd6d5af.diff";
      hash = "sha256-HkGgWEJFTj5flsZDEBxqzgo5c2tp8rj8BxA1kAqOhkc=";
    })
  ];

  extraBuildInputs = [qt5compat qttools acl attr];
}

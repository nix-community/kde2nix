{
  lib,
  mkKdeDerivation,
  fetchpatch,
}:
mkKdeDerivation {
  pname = "dolphin";

  # drop kmoretools
  patches = [
    (fetchpatch {
      url = "https://invent.kde.org/system/dolphin/-/commit/2cd3d58eec5695899c26ca66a631fb79867b6584.patch";
      hash = "sha256-z8WHV9y2+vpeCma+e+d+r6ahToY++k/8i2VkciQLwrw=";
    })
  ];

  meta.license = null;
}

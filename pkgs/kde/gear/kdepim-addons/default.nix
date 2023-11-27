{
  lib,
  mkKdeDerivation,
}:
# FIXME: Rust stuff doesn't build, needs Cargo.lock
mkKdeDerivation {
  pname = "kdepim-addons";

  meta.license = null;
}

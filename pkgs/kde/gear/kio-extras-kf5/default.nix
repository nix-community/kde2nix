# FIXME: figure out how to handle this
{mkKdeDerivation}:
mkKdeDerivation {
  pname = "kio-extras-kf5";
  outputs = ["out"];
  buildCommand = "mkdir -p $out";
  separateDebugInfo = false;
  meta.description = "STUB";
}

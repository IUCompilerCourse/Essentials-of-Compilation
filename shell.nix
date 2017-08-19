
# By default (irreproducibly) use whatever nixpkgs is in path:
with (import <nixpkgs> {});

# Probably a lower-footprint way of doing this:
stdenv.mkDerivation {
  name = "docsEnv";
  buildInputs = [
                  texlive.combined.scheme-full
                ];
}

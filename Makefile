
.PHONY: all cont continuous clean publish

LATEXMK= latexmk -pdf

all:
	$(LATEXMK) book

cont: continuous
continuous:
	$(LATEXMK) -pvc book

clean:
	$(LATEXMK) -C book
	rm -f book.pdf *.log *.aux *.bbl \
	      *.lof *.out *.toc *.blg *.ilg *.ind *.idx \
	      *.lot *.run.xml *.bcf *.fls *.fdb_latexmk

# Build with a fixed snapshot of NixPkgs 17.03.  Known-to-work.
# For a very clean version, run git clean -fxd followed by this:
#
# This may take a long time and build a complete version of texlive.
# Since it is fixed-in-time it may not have binary caches available and
# may need to build from source.
nix:
	NIX_PATH=nixpkgs=https://github.com/NixOS/nixpkgs-channels/archive/51a83266d164195698f04468d90d2c6238ed3491.tar.gz $(MAKE) nix-head

# This is a compromise.  Build faster by using a binary cache, but
# still allow minor version patches by pointing at the head of a
# (dynamic) channel.
nix-fast:
	NIX_PATH=nixpkgs=https://github.com/NixOS/nixpkgs-channels/archive/nixos-17.03.tar.gz $(MAKE) nix-head

# Build with whatever version of nixpkgs is in the users environment:
nix-head:
	nix-shell --pure --run make


# Specific to Fall16:
publish:
	scp build/book.pdf tank.soic.indiana.edu:p523-web/book.pdf

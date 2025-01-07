#! /usr/bin/env nix-shell
#! nix-shell -i bash -p bash nix-update

for i in $(ls pkgs/ce-programs | grep -v "tiboyceTestROM" | grep -v "crossbunTestPack"); do
	nix-update legacyPackages.x86_64-linux.CEPrograms.$i --version=branch --flake || exit 1
done

for i in ce-toolchain llvm-ez80 gcc4ti; do
	nix-update legacyPackages.x86_64-linux.$i --version=branch --flake || exit 1
done
nix-update legacyPackages.x86_64-linux.ce-toolchain-stable --flake || exit 1

NIXPKGS_ALLOW_UNFREE=1 nix build .#checks.x86_64-linux.default --extra-experimental-features "nix-command flakes" --impure

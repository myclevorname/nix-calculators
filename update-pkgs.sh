#! /usr/bin/env nix-shell
#! nix-shell -i bash -p bash nix-update

set -e

for i in $(ls pkgs/ce-programs | grep -v "tiboyceTestROM" | grep -v "crossbunTestPack"); do
	nix-update legacyPackages.x86_64-linux.CEPrograms.$i --version=branch --flake
done

for i in ce-toolchain llvm-ez80 gcc4ti cemu-ti tilibs.libticonv tilp2 binutils-z80; do
	nix-update legacyPackages.x86_64-linux.$i --version=branch --flake
done
nix-update legacyPackages.x86_64-linux.ce-toolchain-stable --flake

wait -f

nix flake check --extra-experimental-features "nix-command flakes"
nix build .#checks.x86_64-linux.default --extra-experimental-features "nix-command flakes"

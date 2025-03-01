#! /usr/bin/env nix-shell
#! nix-shell -i bash -p bash nix-update

set -e

for i in $(ls pkgs/ce-programs | grep -v "tiboyceTestROM" | grep -v "crossbunTestPack"); do
	nix-update legacyPackages.x86_64-linux.CEPrograms.$i --version=branch --flake &
done

for i in ce-toolchain gcc4ti; do
	nix-update legacyPackages.x86_64-linux.$i --version=branch --flake &
done
nix-update legacyPackages.x86_64-linux.ce-toolchain-stable --flake &
nix-update legacyPackages.x86_64-linux.llvm-ez80 --version=rebase-v19 --flake &

wait -f

nix build .#checks.x86_64-linux.default --extra-experimental-features "nix-command flakes"

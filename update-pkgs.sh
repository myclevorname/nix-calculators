#! /usr/bin/env bash

set -e

nix run github:NixOS/nixpkgs/c8cd81426f45942bb2906d5ed2fe21d2f19d95b7#nix-update -- \
	legacyPackages.x86_64-linux.ce-toolchain --version=branch --flake

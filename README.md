# Calculator Programs Repo

This is a new and improved version of [my original calculator-focused repo](https://github.com/myclevorname/flake), which only provided a program builder.
The older repo still exists and is catered towards flakes, but this Nix repo is meant to be a collection of calculator programs.

DISCLAIMER: Only x86\_64-linux is supported because I don't have access to a Mac and don't want to use a Hackintosh.
I will support x86\_64-darwin if I buy one.

## Contributing

If you want to see a program added to the repo or would want a program to be updated, feel free to open a GitHub issue.
See `pkgs/ce-programs/oiram/default.nix` for a template.
If you aren't a Nixpkgs maintainer, omit the `meta.maintainers` attribute.

## Licenses

This repo is licensed under the MIT license, with the `templates` directory consisting of code under the LGPL-3.0 license located at https://github.com/CE-Programming/toolchain/blob/master/examples/hello_world.

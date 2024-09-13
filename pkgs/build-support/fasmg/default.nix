{ fasmg, fetchzip }:
fasmg.overrideAttrs (final: old: {
  version = "kd3c";
  src = fetchzip {
    url = "https://flatassembler.net/fasmg.${final.version}.zip";
    sha256 = "sha256-duxune/UjXppKf/yWp7y85rpBn4EIC6JcZPNDhScsEA=";
    stripRoot = false;
  };
})

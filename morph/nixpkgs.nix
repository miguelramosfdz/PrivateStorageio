# Pin the deployment package-set to a specific version of nixpkgs.  This is
# NixOS 19.03 as of Aug 28 2019.  There's nothing special about it.  It's
# just recent at the time of development.  It can be upgraded when there is
# value in doing so.  Meanwhile, our platform doesn't shift around beneath
# us in surprising ways as time passes.
(builtins.fetchTarball {
  url = "https://github.com/NixOS/nixpkgs/archive/3c83ad6ac13b67101cc3e2e07781963a010c1624.tar.gz";
  sha256 = "0cdq342wrkvkyccygpp1gvwp7hhqg68hljjwld4vjixm901ayy14";
})
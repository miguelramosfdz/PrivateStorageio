# Load the helper function and call it with arguments tailored for the testing
# grid.  It will make the morph configuration for us.  We share this function
# with the production grid and have one fewer possible point of divergence.
import ./make-grid.nix {
  name = "Testing";
  config = ./testing-grid.config.json;
  nodes = cfg: {
    "payments.privatestorage-staging.com" = import ./issuer.nix ({
      hardware = ./issuer-aws.nix;
      stateVersion = "19.03";
    } // cfg);

    "3.120.26.190" = import ./make-testing.nix (cfg // {
      publicIPv4 = "3.120.26.190";
      hardware = ./testing001-hardware.nix;
      stateVersion = "19.03";
    });
  };
}

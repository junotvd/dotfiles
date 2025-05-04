{ pkgs, ... }:

let
  pythonEnv = pkgs.python311.withPackages (ps:
    with ps;
    [
      (ps.buildPythonPackage rec {
        pname = "mllint";
        version = "0.12.2";

        src = pkgs.fetchFromGitHub {
          owner = "amaranth-lang";
          repo = "mllint";
          rev = "v${version}";
          # sha256 = "sha256-REPLACE-ME"; # you'll fix this
        };

        nativeBuildInputs = with ps; [ setuptools wheel ];

        doCheck = false;
      })
    ]);
in { home.packages = [ pythonEnv ]; }

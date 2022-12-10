{
  description = "A very basic flake";

  outputs = { self, nixpkgs }:
    let
      pkgs = import nixpkgs { system = "x86_64-linux"; };
    in
    {

      packages.x86_64-linux.ipcalc = pkgs.writeShellScriptBin
        "ipcalc" "${pkgs.perl}/bin/perl ${./ipcalc} $@";

      packages.x86_64-linux.default = self.packages.x86_64-linux.ipcalc;

    };
}

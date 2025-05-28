{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    neovim-nightly-overlay.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {nixpkgs, ...} @ inputs: let
    pkgs = import nixpkgs {system = "x86_64-linux";};
  in {
    packages.${pkgs.system}.default = pkgs.wrapNeovimUnstable inputs.neovim-nightly-overlay.packages.${pkgs.system}.default (pkgs.neovimUtils.makeNeovimConfig {
      customRC = ''
        set runtimepath^=${./.}
        let g:sqlite_clib_path = '${pkgs.sqlite.out}/lib/libsqlite3.so'
        source ${./.}/init.lua
      '';

      wrapperArgs = [
        "--prefix"
        "PATH"
        ":"
        "${pkgs.lib.makeBinPath (with pkgs; [
          # for treesitter and prob others idk
          gcc

          # for telescope
          ripgrep
          fd

          # treesitter
          tree-sitter
          nodejs

          # hex.nvim
          xxd

          # smart-open.nvim
          sqlite
          ripgrep

          # misc
          git

          # mayb required for neorg??
          lua51Packages.lua
          lua51Packages.luarocks
          unzip
        ])}"
      ];
    });
  };
}

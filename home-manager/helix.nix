{ pkgs, ... }: {

  programs.helix = {
    enable = true;

    # 1. Install LSPs and Formatters exclusively for Helix
    extraPackages = with pkgs; [
      # C / C++
      clang-tools          # Provides clangd LSP + clang-format
      
      # Rust
      rust-analyzer        # Rust LSP
      rustfmt              # Rust Formatter
      
      # JSON & TOML
      vscode-langservers-extracted # Provides vscode-json-language-server
      taplo                # TOML LSP & Formatter
      
      # Nix
      nixd                 # High-performance Nix LSP
      alejandra            # Opinionated Nix Formatter
      
      # Lua
      lua-language-server  # Lua LSP
      stylua               # Lua Formatter
    ];

    # 2. Map languages to their respective formatters and settings
    languages = {
      language = [
        {
          name = "nix";
          auto-format = true;
          formatter = { command = "alejandra"; };
        }
        {
          name = "rust";
          auto-format = true;
          formatter = { command = "rustfmt"; };
        }
        {
          name = "cpp";
          auto-format = true;
          formatter = { command = "clang-format"; };
        }
        {
          name = "json";
          auto-format = true;
          formatter = { command = "vscode-json-language-server"; args = [ "--stdio" ]; };
        }
        {
          name = "toml";
          auto-format = true;
          formatter = { command = "taplo"; args = [ "fmt" "-" ]; };
        }
        {
          name = "lua";
          auto-format = true;
          formatter = { command = "stylua"; args = [ "-" ]; };
        }
      ];

      # 3. Optional: Fine-tune specific Language Server Behaviors
      language-server = {
        # Configure rust-analyzer to use clippy on save
        rust-analyzer.config.check = {
          command = "clippy";
        };
        
        # Configure nixd to resolve target system configurations
        nixd.settings.nixpkgs.expr = "import <nixpkgs> { }";
      };
    };

    # Core Editor Adjustments
    settings = {
      theme = "onedark";
      editor = {
        line-number = "relative";
        lsp.display-messages = true;
      };
    };
  };
}

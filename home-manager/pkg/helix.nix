# ============================================================================
# Helix
# ============================================================================

{ pkgs, ... }: {

  programs.helix = 
  {
    enable = true;

    # 1. Install LSPs and Formatters exclusively for Helix
    extraPackages = with pkgs; 
    [
    ];

    # 2. Map languages to their respective formatters and settings
    languages = 
    {
      language = 
      [
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
      language-server = 
        {
        # Configure rust-analyzer to use clippy on save
        rust-analyzer.config.check = {
          command = "clippy";
        };
        
        # Configure nixd to resolve target system configurations
        nixd.settings.nixpkgs.expr = "import <nixpkgs> { }";
      };
    };

    # Core Editor Adjustments
    settings = 
    {
      theme = "astrodark";
      editor = 
      {
        line-number = "relative";
        lsp.display-messages = true;
      };
    };

    # Custom Themes
    themes = {
      astrodark = {
        # --- Base16 Palette Definition ---
        "palette" = {
          base00 = "#1A1D23"; # Default background
          base01 = "#16181D"; # Lighter/darker background
          base02 = "#1E222A"; # Selection / Line background
          base03 = "#696C76"; # Comments / Non-text
          base04 = "#797D87"; # Dark foreground 
          base05 = "#9B9FA9"; # Default foreground
          base06 = "#ADB0BB"; # Bright foreground
          base07 = "#E0E0EE"; # Brightest foreground
          base08 = "#FF838B"; # Red (Variables, tags)
          base09 = "#F5983A"; # Orange (Integers, constants)
          base0A = "#DFAB25"; # Yellow (Classes, types)
          base0B = "#87C05F"; # Green (Strings)
          base0C = "#4AC2B8"; # Cyan (Regex, escape chars)
          base0D = "#5EB7FF"; # Blue (Functions, headings)
          base0E = "#DD97F1"; # Purple (Keywords, imports)
          base0F = "#EB8332"; # Deprecated / Alternate
        };

        # --- Standard Base16 to Helix Scopes Mapping ---
        "ui.background" = { bg = "base00"; };
        "ui.text" = { fg = "base05"; };
        "ui.cursor" = { fg = "base00"; bg = "base05"; };
        "ui.cursor.match" = { fg = "base0A"; modifiers = ["bold"]; };
        "ui.selection" = { bg = "base02"; };
        "ui.linenr" = { fg = "base03"; };
        "ui.linenr.selected" = { fg = "base0D"; modifiers = ["bold"]; };
        "ui.statusline" = { fg = "base04"; bg = "base01"; };
        "ui.statusline.inactive" = { fg = "base03"; bg = "base01"; };
        "ui.menu" = { fg = "base05"; bg = "base01"; };
        "ui.menu.selected" = { fg = "base01"; bg = "base0D"; };
        "ui.window" = { fg = "base02"; };
        "ui.help" = { bg = "base01"; fg = "base06"; };

        # --- Base16 Syntax Highlighting ---
        "comment" = { fg = "base03"; modifiers = ["italic"]; };
        "constant" = { fg = "base09"; };
        "constant.character.escape" = { fg = "base0C"; };
        "constructor" = { fg = "base0D"; };
        "function" = { fg = "base0D"; };
        "function.macro" = { fg = "base0C"; };
        "keyword" = { fg = "base0E"; };
        "label" = { fg = "base0C"; };
        "operator" = { fg = "base05"; };
        "string" = { fg = "base0B"; };
        "type" = { fg = "base0A"; };
        "variable" = { fg = "base05"; };
        "variable.builtin" = { fg = "base08"; };
        "variable.parameter" = { fg = "base08"; modifiers = ["italic"]; };

        # --- Markup ---
        "markup.heading" = { fg = "base0D"; modifiers = ["bold"]; };
        "markup.list" = { fg = "base08"; };
        "markup.bold" = { modifiers = ["bold"]; };
        "markup.italic" = { modifiers = ["italic"]; };
        "markup.link.url" = { fg = "base09"; underline = { style = "line"; }; };
        "markup.link.text" = { fg = "base0E"; };
        "markup.quote" = { fg = "base03"; };

        # --- Diagnostics ---
        "diagnostic.error" = { underline = { color = "base08"; style = "curl"; }; };
        "diagnostic.warning" = { underline = { color = "base09"; style = "curl"; }; };
        "diagnostic.info" = { underline = { color = "base0D"; style = "curl"; }; };
        "diagnostic.hint" = { underline = { color = "base0C"; style = "curl"; }; };
        "warning" = "base09";
        "error" = "base08";
        "info" = "base0D";
        "hint" = "base0C";
      };
    };
  };
}

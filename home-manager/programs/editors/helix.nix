# ============================================================================
# Helix
# ============================================================================
{pkgs, ...}: {
  programs.helix = {
    enable = true;

    extraPackages = with pkgs; [
      rustfmt
    ];

    languages = {
      language = [
        {
          name = "nix";
          auto-format = true;
          formatter = {command = "alejandra";};
        }
        {
          name = "rust";
          auto-format = true;
          formatter = {command = "rustfmt";};
        }
        {
          name = "cpp";
          auto-format = true;
          formatter = {command = "clang-format";};
        }
        {
          name = "json";
          auto-format = true;
          formatter = {
            command = "vscode-json-language-server";
            args = ["--stdio"];
          };
        }
        {
          name = "toml";
          auto-format = true;
          formatter = {
            command = "taplo";
            args = ["fmt" "-"];
          };
        }
        {
          name = "lua";
          auto-format = true;
          formatter = {
            command = "stylua";
            args = ["-"];
          };
        }
      ];

      language-server = {
        rust-analyzer.config.check = {
          command = "clippy";
        };

        nixd.settings.nixpkgs.expr = "import <nixpkgs> { }";
      };
    };

    settings = {
      theme = "astrodark";
      editor = {
        line-number = "relative";
        lsp.display-messages = true;
      };
    };

    themes = {
      astrodark = {
        palette = {
          base00 = "#1A1D23";
          base01 = "#16181D";
          base02 = "#1E222A";
          base03 = "#696C76";
          base04 = "#797D87";
          base05 = "#9B9FA9";
          base06 = "#ADB0BB";
          base07 = "#E0E0EE";
          base08 = "#FF838B";
          base09 = "#F5983A";
          base0A = "#DFAB25";
          base0B = "#87C05F";
          base0C = "#4AC2B8";
          base0D = "#5EB7FF";
          base0E = "#DD97F1";
          base0F = "#EB8332";
        };

        "ui.background" = {bg = "base00";};
        "ui.text" = {fg = "base05";};
        "ui.cursor" = {
          fg = "base00";
          bg = "base05";
        };
        "ui.cursor.match" = {
          fg = "base0A";
          modifiers = ["bold"];
        };
        "ui.selection" = {bg = "base02";};
        "ui.linenr" = {fg = "base03";};
        "ui.linenr.selected" = {
          fg = "base0D";
          modifiers = ["bold"];
        };
        "ui.statusline" = {
          fg = "base04";
          bg = "base01";
        };
        "ui.statusline.inactive" = {
          fg = "base03";
          bg = "base01";
        };
        "ui.menu" = {
          fg = "base05";
          bg = "base01";
        };
        "ui.menu.selected" = {
          fg = "base01";
          bg = "base0D";
        };
        "ui.window" = {fg = "base02";};
        "ui.help" = {
          bg = "base01";
          fg = "base06";
        };
        "comment" = {
          fg = "base03";
          modifiers = ["italic"];
        };
        "constant" = {fg = "base09";};
        "constant.character.escape" = {fg = "base0C";};
        "constructor" = {fg = "base0D";};
        "function" = {fg = "base0D";};
        "function.macro" = {fg = "base0C";};
        "keyword" = {fg = "base0E";};
        "label" = {fg = "base0C";};
        "operator" = {fg = "base05";};
        "string" = {fg = "base0B";};
        "type" = {fg = "base0A";};
        "variable" = {fg = "base05";};
        "variable.builtin" = {fg = "base08";};
        "variable.parameter" = {
          fg = "base08";
          modifiers = ["italic"];
        };
        "markup.heading" = {
          fg = "base0D";
          modifiers = ["bold"];
        };
        "markup.list" = {fg = "base08";};
        "markup.bold" = {modifiers = ["bold"];};
        "markup.italic" = {modifiers = ["italic"];};
        "markup.link.url" = {
          fg = "base09";
          underline = {style = "line";};
        };
        "markup.link.text" = {fg = "base0E";};
        "markup.quote" = {fg = "base03";};
        "diagnostic.error" = {
          underline = {
            color = "base08";
            style = "curl";
          };
        };
        "diagnostic.warning" = {
          underline = {
            color = "base09";
            style = "curl";
          };
        };
        "diagnostic.info" = {
          underline = {
            color = "base0D";
            style = "curl";
          };
        };
        "diagnostic.hint" = {
          underline = {
            color = "base0C";
            style = "curl";
          };
        };
        warning = "base09";
        error = "base08";
        info = "base0D";
        hint = "base0C";
      };
    };
  };
}

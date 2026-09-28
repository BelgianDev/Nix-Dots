{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.home.shell.fish;
in {
  options.home.shell.fish = {
    enable = mkEnableOption "Enable Fish shell.";
  };

  config = mkIf cfg.enable {
    programs.fish = {
      enable = true;

      interactiveShellInit = ''
        set fish_greeting

        pfetch

        starship init fish | source
        zoxide init fish | source
        atuin init fish | source
      '';

      functions = {
        bake = {
          description = "Destroy video and audio using FFmpeg";
          body = ''
            if test (count $argv) -lt 2
                echo "Usage: bake <input_file> <output_file>"
                return 1
            end

            ${pkgs.ffmpeg}/bin/ffmpeg -i $argv[1] -vf "scale=320:-2,fps=12,eq=contrast=1.6:saturation=3.0" -c:v libx264 -crf 44 -preset fast -g 240 -bf 0 -error_rate 0.08 -pix_fmt yuv420p -af "volume=10dB,aresample=4000,volume=-3dB" -c:a aac -b:a 8k $argv[2]
          '';
        };
      };

      shellAliases = {
        ls = "eza -a";
        cat = mkIf (config.home.cli.bat.enable) "bat";
        disk = "dust";
        search = "fzf";

        notes = "nano ~/notes.txt";
        fdupl = "find . ! -empty -type f -exec md5sum {} + | sort | uniq -w32 -dD";

        pipes = "pipes-rs";
        say = "cowsay -r";
        matrix = "cmatrix";
        bonsai = "cbonsai";
        ascii = "figlet";
      };
    };

    home.packages = with pkgs; [
      starship
    ];

    programs.starship = {
      enable = true;

      settings = {
        add_newline = true;

        format = ''
          [](#051923)$os$username[](bg:#003554 fg:#051923)$directory[](fg:#003554 bg:#006494)$git_branch$git_status[](fg:#006494 bg:#0582CA)$c$elixir$elm$golang$gradle$haskell$java$julia$nodejs$nim$rust$scala[](fg:#0582CA bg:#00A6FB)$docker_context[](fg:#00A6FB bg:#33658A)$time[ ](fg:#33658A)$line_break$character
        '';

        os = {
          disabled = false;
          style = "bg:#051923";
          symbols = {
            Arch = "󰣇 ";
            NixOS = " ";
          };
        };

        username = {
          disabled = false;
          show_always = true;
          style_user = "bg:#051923";
          style_root = "bg:#051923";
          format = ''[$user ]($style)'';
        };

        directory = {
          disabled = false;
          style = "bg:#003554";
          format = "[ $path ]($style)";
          truncation_length = 3;
          truncation_symbol = "…/";
        };

        git_branch = {
          disabled = false;
          symbol = "";
          style = "bg:#006494";
          format = ''[ $symbol $branch ]($style)'';
        };

        git_status = {
          disabled = false;
          style = "bg:#006494";
          format = ''[$all_status$ahead_behind ]($style)'';
        };

        time = {
          disabled = false;
          time_format = "%R"; # Hour:Minute Format
          style = "bg:#33658A";
          format = ''[ $time ]($style)'';
        };

        c = {
          disabled = false;
          symbol = " ";
          style = "bg:#0582CA";
          format = ''[ $symbol ($version) ]($style)'';
        };
        
        docker_context = {
          disabled = false;
          symbol = " ";
          style = "bg:#06969A";
          format = ''[ $symbol $context ]($style)'';
        };

        elixir = {
          disabled = false;
          symbol = " ";
          style = "bg:#0582CA";
          format = ''[ $symbol ($version) ]($style)'';
        };

        elm = {
          disabled = false;
          symbol = " ";
          style = "bg:#0582CA";
          format = ''[ $symbol ($version) ]($style)'';
        };

        golang = {
          disabled = false;
          symbol = " ";
          style = "bg:#0582CA";
          format = ''[ $symbol ($version) ]($style)'';
        };

        gradle = {
          disabled = false;
          symbol = " ";
          style = "bg:#0582CA";
          format = ''[ $symbol ($version) ]($style)'';
        };

        haskell = {
          disabled = false;
          symbol = " ";
          style = "bg:#0582CA";
          format = ''[ $symbol ($version) ]($style)'';
        };

        java = {
          disabled = false;
          symbol = " ";
          style = "bg:#0582CA";
          format = ''[ $symbol ($version) ]($style)'';
        };

        julia = {
          disabled = false;
          symbol = " ";
          style = "bg:#0582CA";
          format = ''[ $symbol ($version) ]($style)'';
        };

        nodejs = {
          disabled = false;
          symbol = "";
          style = "bg:#0582CA";
          format = ''[ $symbol ($version) ]($style)'';
        };

        nim = {
          disabled = false;
          symbol = "󰆥 ";
          style = "bg:#0582CA";
          format = ''[ $symbol ($version) ]($style)'';
        };

        rust = {
          disabled = false;
          symbol = "";
          style = "bg:#0582CA";
          format = ''[ $symbol ($version) ]($style)'';
        };

        scala = {
          disabled = false;
          symbol = " ";
          style = "bg:#0582CA";
          format = ''[ $symbol ($version) ]($style)'';
        };
      };
    };
  };
}

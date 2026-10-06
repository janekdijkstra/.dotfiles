{ pkgs, lib, ...}:

let
  lua = lib.generators.mkLuaInline;

  bind = key: dispatcher: flags: {
    _args = [ key (lua dispatcher) ] ++ lib.optional (flags != null) flags;
  };
in
{
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    hyprpaper
    fira-code
    fira-code-symbols
    font-awesome
    liberation_ttf
    mplus-outline-fonts.githubRelease
    pkgs.nerd-fonts._0xproto
    pkgs.nerd-fonts.droid-sans-mono
    noto-fonts
    noto-fonts-color-emoji
    proggyfonts
    quickshell
  ];

  programs.bash = {
    enable = true;
    profileExtra = ''
      if [ -z "$WAYLAND_DISPLAY"] && [ "$XDG_VTNR" = 1 ]; then
        exec start-hyprland
      fi
    '';
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;

      wallpaper = [
        {
          monitor = "";
          path = "~/.dotfiles/theme/forrest.jpg";
        }
      ];
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";
    settings = {
      # Variables
      mainMod = { _var = "ALT"; };
      terminal = { _var = "kitty"; };
      fileManager = { _var = "dolphin"; };
      menu = { _var = "pkill wofi || wofi"; };

      # Monitors
      monitor = [
        {
          output = "";
          mode = "preferred";
          position = "auto";
          scale = "auto";
        }
      ];

      # Environment variables
      env = [
        { _args = [ "XCURSOR_SIZE" "24" ]; }
        { _args = [ "HYPRCURSOR_SIZE" "24" ]; }
      ];

      # General
      config = {
        general = {
          gaps_in = 5;
          gaps_out = 20;
          border_size = 2;
          col = {
            active_border = {
              colors = [ "rgba(33ccffee)" "rgba(00ff99ee)" ];
              angle = 45;
            };
            inactive_border = "rgba(595959aa)";
          };
          resize_on_border = false;
          allow_tearing = false;
          layout = "dwindle";
        };

        decoration = {
          rounding = 10;
          rounding_power = 2;
          active_opacity = 1.0;
          inactive_opacity = 1.0;
          shadow = {
            enabled = true;
            range = 4;
            render_power = 3;
            color = "rgba(1a1a1aee)";
          };
          blur = {
            enabled = true;
            size = 3;
            passes = 1;
            vibrancy = 0.1696;
          };
        };

        animations = {
          enabled = false;
        };

        dwindle = {
          preserve_split = true;
        };

        master = {
          new_status = "master";
        };

        misc = {
          force_default_wallpaper = 2;
          disable_hyprland_logo = false;
        };

        input = {
          kb_layout = "de";
          kb_variant = "";
          kb_model = "";
          kb_options = "";
          kb_rules = "";
          follow_mouse = 1;
          sensitivity = 0;
          natural_scroll = true;
          touchpad = {
            natural_scroll = true;
          };
        };

        ecosystem = {
          no_update_news = true;
        };
      };

      device = [
        {
          name = "epic-mouse-v1";
          sensitivity = -0.5;
        }
      ];

      # Window rules
      window_rule = {
        name = "no-kitty-fullscreen";
        match = { class = "^kitty$"; };
        fullscreen_state = 0;
      };

      # Keybinds
      bind = [
        (bind (lua ''mainMod .. " + RETURN"'') "hl.dsp.exec_cmd(terminal)" null)
        (bind (lua ''mainMod .. " + W"'') "hl.dsp.window.close()" null)
        (bind (lua ''mainMod .. " + M"'') "hl.dsp.exit()" null)
        (bind (lua ''mainMod .. " + V"'') ''hl.dsp.window.float({ action = "toggle" })'' null)
        (bind (lua ''mainMod .. " + D"'') "hl.dsp.exec_cmd(menu)" null)
        (bind (lua ''mainMod .. " + P"'') "hl.dsp.window.pseudo()" null)
        (bind (lua ''mainMod .. " + E"'') ''hl.dsp.layout("togglesplit")'' null)
        (bind (lua ''mainMod .. " + H"'') ''hl.dsp.focus({ direction = "left" })'' null)
        (bind (lua ''mainMod .. " + L"'') ''hl.dsp.focus({ direction = "right" })'' null)
        (bind (lua ''mainMod .. " + K"'') ''hl.dsp.focus({ direction = "up" })'' null)
        (bind (lua ''mainMod .. " + J"'') ''hl.dsp.focus({ direction = "down" })'' null)
        (bind (lua ''mainMod .. " + 1"'') ''hl.dsp.focus({ workspace = 1 })'' null)
        (bind (lua ''mainMod .. " + 2"'') ''hl.dsp.focus({ workspace = 2 })'' null)
        (bind (lua ''mainMod .. " + 3"'') ''hl.dsp.focus({ workspace = 3 })'' null)
        (bind (lua ''mainMod .. " + 4"'') ''hl.dsp.focus({ workspace = 4 })'' null)
        (bind (lua ''mainMod .. " + 5"'') ''hl.dsp.focus({ workspace = 5 })'' null)
        (bind (lua ''mainMod .. " + 6"'') ''hl.dsp.focus({ workspace = 6 })'' null)
        (bind (lua ''mainMod .. " + 7"'') ''hl.dsp.focus({ workspace = 7 })'' null)
        (bind (lua ''mainMod .. " + 8"'') ''hl.dsp.focus({ workspace = 8 })'' null)
        (bind (lua ''mainMod .. " + 9"'') ''hl.dsp.focus({ workspace = 9 })'' null)
        (bind (lua ''mainMod .. " + 0"'') ''hl.dsp.focus({ workspace = 10 })'' null)
        (bind (lua ''mainMod .. " + SHIFT + 1"'') ''hl.dsp.window.move({ workspace = 1 })'' null)
        (bind (lua ''mainMod .. " + SHIFT + 2"'') ''hl.dsp.window.move({ workspace = 2 })'' null)
        (bind (lua ''mainMod .. " + SHIFT + 3"'') ''hl.dsp.window.move({ workspace = 3 })'' null)
        (bind (lua ''mainMod .. " + SHIFT + 4"'') ''hl.dsp.window.move({ workspace = 4 })'' null)
        (bind (lua ''mainMod .. " + SHIFT + 5"'') ''hl.dsp.window.move({ workspace = 5 })'' null)
        (bind (lua ''mainMod .. " + SHIFT + 6"'') ''hl.dsp.window.move({ workspace = 6 })'' null)
        (bind (lua ''mainMod .. " + SHIFT + 7"'') ''hl.dsp.window.move({ workspace = 7 })'' null)
        (bind (lua ''mainMod .. " + SHIFT + 8"'') ''hl.dsp.window.move({ workspace = 8 })'' null)
        (bind (lua ''mainMod .. " + SHIFT + 9"'') ''hl.dsp.window.move({ workspace = 9 })'' null)
        (bind (lua ''mainMod .. " + SHIFT + 0"'') ''hl.dsp.window.move({ workspace = 10 })'' null)
        (bind (lua ''mainMod .. " + S"'') ''hl.dsp.workspace.toggle_special("magic")'' null)
        (bind (lua ''mainMod .. " + SHIFT + S"'') ''hl.dsp.window.move({ workspace = "special:magic" })'' null)
        (bind (lua ''mainMod .. " + mouse_down"'') ''hl.dsp.focus({ workspace = "e+1" })'' null)
        (bind (lua ''mainMod .. " + mouse_up"'') ''hl.dsp.focus({ workspace = "e-1" })'' null)
        (bind (lua ''mainMod .. " + mouse:272"'') "hl.dsp.window.drag()" { mouse = true; })
        (bind (lua ''mainMod .. " + mouse:273"'') "hl.dsp.window.resize()" { mouse = true; })
        (bind "XF86AudioRaiseVolume" ''hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+")'' { locked = true; repeating = true; })
        (bind "XF86AudioLowerVolume" ''hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-")'' { locked = true; repeating = true; })
        (bind "XF86AudioMute" ''hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle")'' { locked = true; repeating = true; })
        (bind "XF86AudioMicMute" ''hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle")'' { locked = true; repeating = true; })
        (bind "XF86MonBrightnessUp" ''hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+")'' { locked = true; repeating = true; })
        (bind "XF86MonBrightnessDown" ''hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-")'' { locked = true; repeating = true; })
        (bind "XF86AudioNext" ''hl.dsp.exec_cmd("playerctl next")'' { locked = true; })
        (bind "XF86AudioPause" ''hl.dsp.exec_cmd("playerctl play-pause")'' { locked = true; })
        (bind "XF86AudioPlay" ''hl.dsp.exec_cmd("playerctl play-pause")'' { locked = true; })
        (bind "XF86AudioPrev" ''hl.dsp.exec_cmd("playerctl previous")'' { locked = true; })
      ];

      # Autostart
      on = {
        _args = [
          "hyprland.start"
          (lua ''
            function()
              hl.exec_cmd("1password --silent")
              hl.exec_cmd("/home/janek/.dotfiles/theme/start.sh")
            end
          '')
        ];
      };
    };
  };
}

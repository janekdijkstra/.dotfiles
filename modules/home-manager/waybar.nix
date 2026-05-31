{ pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 34;
        margin-top = 8;
        margin-bottom = 0;
        margin-left = 200;
        margin-right = 200;

        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "pulseaudio" "network" "battery" "tray" ];

        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
          format = "{name}";
          on-click = "activate";
        };

        clock = {
          interval = 60;
          format = "{:%H:%M  %d/%m}";
          tooltip = false;
        };

        pulseaudio = {
          format = "{icon} {volume}%";
          format-muted = " muted";
          on-click = "pavucontrol";
          tooltip = false;
        };

        network = {
          format-wifi = "{essid}";
          format-ethernet = "";
          format-disconnected = "";
          tooltip = false;
        };

        battery = {
          format = "{icon} {capacity}%";
          format-charging = " {capacity}%";
          format-icons = [ "" "" "" "" "" ];
          tooltip = false;
        };
      };
    };
    style = ''
      * {
        font-family: "Fira Code", "Font Awesome 6 Free", sans-serif;
        font-size: 12px;
        min-height: 0;
      }

      window#waybar {
        background: rgba(20, 20, 20, 0.85);
        border-radius: 12px;
        border: 1px solid rgba(255, 255, 255, 0.06);
      }

      #workspaces button {
        padding: 0 5px;
        margin: 2px 1px;
        background: transparent;
        color: #666666;
        border-radius: 6px;
      }

      #workspaces button.active {
        background: rgba(255, 255, 255, 0.08);
        color: #cccccc;
      }

      #workspaces button:hover {
        background: rgba(255, 255, 255, 0.05);
        color: #aaaaaa;
      }

      #clock {
        color: #aaaaaa;
        padding: 0 10px;
      }

      #pulseaudio {
        color: #999999;
        padding: 0 6px;
      }

      #network {
        color: #777777;
        padding: 0 6px;
      }

      #battery {
        color: #888888;
        padding: 0 6px;
      }

      #tray {
        padding: 0 6px;
      }

      #tray > .passive {
        -gtk-icon-effect: dim;
      }

      tooltip {
        background: rgba(20, 20, 20, 0.95);
        border: 1px solid rgba(255, 255, 255, 0.08);
        border-radius: 8px;
      }
    '';
  };
}

{ pkgs, config, ... }:
let inherit (config.lib.cosmic) Actions mapBinds;
in {
  programs.cosmic = {
    enable = true;
    input.asDefaults = true;
    input.binds = mapBinds {
      # Navigation
      Super."h" = Actions.Focus "Left";
      Super."l" = Actions.Focus "Right";
      Super."j" = Actions.Focus "Down";
      Super."k" = Actions.Focus "Up";
      Super."u" = Actions.Focus "Out";
      Super."i" = Actions.Focus "In";
      Super.Shift."h" = Actions.Move "Left";
      Super.Shift."l" = Actions.Move "Right";
      Super.Shift."j" = Actions.Move "Down";
      Super.Shift."k" = Actions.Move "Up";
      Super."1" = Actions.Workspace 1;
      Super."2" = Actions.Workspace 2;
      Super."3" = Actions.Workspace 3;
      Super."4" = Actions.Workspace 4;
      Super."5" = Actions.Workspace 5;
      Super.Shift."1" = Actions.MoveToWorkspace 1;
      Super.Shift."2" = Actions.MoveToWorkspace 2;
      Super.Shift."3" = Actions.MoveToWorkspace 3;
      Super.Shift."4" = Actions.MoveToWorkspace 4;
      Super.Shift."5" = Actions.MoveToWorkspace 5;
      Super."Space" = Actions.ToggleWindowFloating;
      Super."f" = Actions.Maximize;
      Super."m" = Actions.Minimize;
      Super.Shift."x" = Actions.Close;
      Super.Shift."v" = Actions.ToggleStacking;
      Super.Shift."y" = Actions.ToggleSticky;
      # System
      Super."Return" = Actions.Spawn pkgs.alacritty;
      Super."o" = Actions.System "HomeFolder";
      Super.Shift."s" = Actions.System "Screenshot";
    };
    background = { displays = { all = { source = "/example/img.png"; }; }; };
    panels = {
      "Bar" = {
        applets = {
          start = [ "com.system76.CosmicAppletWorkspaces" ];
          center = [ "com.system76.CosmicAppletMinimize" ];
          end = [
            "com.system76.CosmicAppletTime"
            "com.system76.CosmicAppletTiling"
            "com.system76.CosmicAppletAudio"
            "com.system76.CosmicAppletNetwork"
            "com.system76.CosmicAppletNotifications"
            "com.system76.CosmicAppletStatusArea"
            "com.system76.CosmicAppletPower"
          ];
        };
        options = {
          size = "XS";
          border_radius = 0;
        };
      };
    };
    comp.settings = {
      autotile = true;
      active_hint = true;
      focus_follows_cursor = true;
      focus_follows_cursor_delay = 0;
      cursor_follows_focus = true;
    };
  };
}

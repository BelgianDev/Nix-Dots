{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.home.cli.btop;
in {
  options.home.cli.btop = {
    enable = mkEnableOption "Enable Btop Configuration.";
  };

  config = mkIf cfg.enable {
    programs.btop = {
      enable = true;
      
      settings = {
        theme_background = false;
        truecolor = true;
        presets = "cpu:1:default,proc:0:default cpu:0:default,mem:0:default,net:0:default cpu:0:block,net:0:tty";
        vim_keys = false;
        rounded_corners = true;
        graph_symbol = "braille";
        shown_boxes = "cpu mem net proc";
        update_ms = 100;

        show_uptime = true;
        check_temp = true;
    

        # Processes Box
        proc_left = false;

        proc_sorting = "memory";
        proc_reversed = false;
        proc_colors = true;
        proc_gradient = true;
        proc_per_core = false;
        proc_mem_bytes = true;
        proc_cpu_graphs = true;
        proc_info_smaps = false;
        proc_filter_kernel = true;
        proc_aggregate = true;

        # CPU & GPU Box
        cpu_bottom = false;

        show_coretemp = true;
        
        cpu_graph_upper = "Auto";
        cpu_graph_lower = "Auto";
        cpu_invert_lower = true;
        cpu_single_graph = false;
        cpu_sensor = "Auto";
        cpu_core_map = "";

        show_gpu_info = "On";
      };
    };
  };
}

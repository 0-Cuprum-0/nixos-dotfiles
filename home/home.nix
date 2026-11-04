{ config, pkgs, ... }:

{
  home.username = "cuprum";
  home.homeDirectory = "/home/cuprum";
  programs.git.enable = true;
  programs.home-manager.enable = true;
  home.stateVersion = "25.11";
  fonts.fontconfig.enable = true;
  #	home.sessionVariables = {
  #		EDITOR = "nvim";
  #};

  imports = [
    ./home_pkgs.nix
  ];

  programs = {
    bash = {
      enable = true;

      initExtra = ''
        		if [ -f ~/.cache/wal/sequences ]; then
        		  cat ~/.cache/wal/sequences
        	      fi
        	    '';
    };
    #TODO: - find a plugin to show hotkeys
    #	- create a menu(quickshell) to connect to the cisco vpn of the faculty
    # 	- find a plugin to set up inline correction
    neovim =
      let
        toLua = str: "lua << EOF\n${str}\nEOF\n"; # convert one line config into lua
        toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n"; # convert file path to lua conf file path
      in
      {

        enable = true;
        viAlias = true;
        vimAlias = true;
        vimdiffAlias = true;
        #extraLuaConfig = ''
        #  local config_dir = vim.fn.stdpath("config")
        #  package.path = package.path .. ";" .. config_dir .. "/lua/?.lua;" .. config_dir .. "/lua/?/init.lua"

        #  ${builtins.readFile ./programs/nvim/init.lua}
        #'';
        extraPackages = with pkgs; [
          gnumake
          ripgrep
          fd
          texlab
          xclip
          #LANGUAGE SERVERS
          #basedpyright
          emmylua-ls
          pyright
          luajit
          nil
          jdt-language-server
          kotlin-language-server

          #jdt-language-server
          #gcc
          texliveMedium # smth for tex files
        ];
        plugins = with pkgs.vimPlugins; [
          nvim-web-devicons
          {

            plugin = iron-nvim;
            config = toLuaFile ./programs/nvim/lua/plugins/iron-nvim.lua;

          }
          {
            plugin = nvim-lspconfig;
            config = toLuaFile ./programs/nvim/lua/plugins/lsp.lua;
          }
          nvim-tree-lua
          {
            plugin = fzf-lua;
            config = toLuaFile ./programs/nvim/lua/plugins/fzf-lua.lua;

          }
          plenary-nvim
          {
            plugin = oxocarbon-nvim;
            config = toLuaFile ./programs/nvim/lua/plugins/oxocarbon.lua;
          }
          {
            plugin = vimtex;
            config = toLuaFile ./programs/nvim/lua/plugins/vimtex.lua;
          }
          project-nvim
          oil-nvim
          #	quicker-nvim
          render-markdown-nvim

          undotree
          #	scope-nvim
          #	#snacks-nvim

          #	fzf-lua
          #	lsp
          lualine-nvim
          #	luatab
          #	mason
          #	yazi
          #	mini.nvim
          {

            plugin = alpha-nvim;
            config = toLuaFile ./programs/nvim/lua/plugins/alpha-nvim.lua;
          }
          {
            plugin = nvim-java;
            config = toLuaFile ./programs/nvim/lua/plugins/nvim-java.lua;
          }
	  {
	  plugin = undotree;
	  config = toLuaFile ./programs/nvim/lua/plugins/undotree.lua;
	  }

          nvim-autopairs

        ];
      };
    direnv = {
      enable = true;
      enableBashIntegration = true; # see note on other shells below
      nix-direnv.enable = true;
    };

    kitty = {
      enable = true;
    };
    keepassxc = {
      enable = true;
      settings.Browser.UpdateBinaryPath = false;

    };

  };
  xdg.configFile."nvim" = {
    source = ./programs/nvim;
    recursive = true;
  };

  xsession.enable = true;
  services.polybar.config = ./dotfiles/polybar/config.ini;
  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "adwaita";
    style = {
      name = "adwaita-dark";
      package = pkgs.adwaita-qt;
    };
  };
  systemd.user.services.polkit-gnome-authentication-agent-1 = {
    Unit = {
      Description = "polkit-gnome-authentication-agent-1";
      Wants = [ "graphical-session.target" ];
      After = [ "graphical-session.target" ];
      BindsTo = [ "graphical-session.target" ];
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
    Service = {
      Type = "simple";
      ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      Restart = "on-failure";
      RestartSec = 2;
      TimeoutStopSec = 10;
    };
  };

  # Optional: If you encounter amdgpu issues with newer kernels (e.g., 6.10+ reported issues),
  # you might consider using the LTS kernel or a known stable version.
  # boot.kernelPackages = pkgs.linuxPackages; # Example for LTS`
  programs.lutris.enable = true;
  #home.file.".config/nvim".source = ./programs/nvim;
  home.file.".config/polybar/config.ini".source = ../dotfiles/polybar/config.ini;
}

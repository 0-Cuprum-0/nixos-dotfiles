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

	neovim =                                                                                 
		let 
			toLua = str: "lua << EOF\n${str}\nEOF\n"; # convert one line config into lua 
			toLuaFile = filr : "lua << EOF\n${builtins.readFile file}\nEOF\n" # convert file path to lua conf file path
		in
		{

		enable = true;                                                                                   
		viAlias = true;
		vimAlias = true;
		vimdiffAlias = true;
		extraPackages = with pkgs; [                                                                     
			gcc# C compiler                                                                      
			gnumake #make 
			ripgrep    # Для працы Telescope (пошук тэксту)                                                
			fd         # Для працы Telescope (пошук файлаў)                                               
			texlab
			jdt-language-server
		 	xclip
		       ];                                                                                               
		       plugins = with pkgs.VimPlugins;[
				{
					plugin = nvim-lspconfig;
					config = toLuaFile ./programs/nvim/lua/plugins/lsp.lua;
				}
			   	nvim-tree
				project
				quicker
				render-markdown
				scope
				snacks
				vimtex
				fzf-lua
				lsp
				lualine
				luatab
				mason
				yazi
				mini.nvim
				alpha-nvim
				nvim-autopairs
		       ]
	     }; 
	direnv = {
		enable = true;
		enableBashIntegration = true; # see note on other shells below
		nix-direnv.enable = true;
	};

	kitty = {
		enable = true;
		};



}
xsession.enable = true;
programs. services.polybar.config = ./dotfiles/polybar/config.ini;
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

home.file.".config/polybar/config.ini".source = ../dotfiles/polybar/config.ini;
}

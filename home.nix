{ config, pkgs, ... }:

{
  home.username = "cuprum";
  home.homeDirectory = "/home/cuprum";
  programs.git.enable = true;
  programs.home-manager.enable = true;
  home.stateVersion = "25.11";

  programs.bash = {
    enable = true;
  
	initExtra = ''
	if [ -f ~/.cache/wal/sequences ]; then
          cat ~/.cache/wal/sequences
      fi
    '';
};
  home.packages = [
    	pkgs.polybar
    	pkgs.nemo
	pkgs.sxhkd
	pkgs.pywal
	pkgs.waypaper
	pkgs.cmd-polkit
	pkgs.feh
	pkgs.jq 
	pkgs.rofi
	pkgs.xev
	pkgs.file-roller
];      
  xsession.enable = true;
  programs.kitty.enable = true;
services.polybar.config = ./dotfiles/polybar/config.ini;
#programs.i3lock.enable = true;
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


home.file.".config/polybar/config.ini".source = ./dotfiles/polybar/config.ini;
}

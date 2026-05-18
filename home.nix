{ config, pkgs, ... }:

{
  home.username = "cuprum";
  home.homeDirectory = "/home/cuprum";
  programs.git.enable = true;
  programs.home-manager.enable = true;
  home.stateVersion = "25.11";
  fonts.fontconfig.enable = true;

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
	pkgs.brightnessctl
	pkgs.yazi
	pkgs.taskwarrior2
	pkgs.appflowy
	pkgs.gcc
	pkgs.gnumake
	pkgs.fd
	pkgs.ripgrep
        pkgs.zathura
#	pkgs.texliveBasic
#	pkgs.texliveMedium
#	pkgs.texlive.combined.scheme-medium
	pkgs.nerd-fonts.arimo
	pkgs.nerd-fonts.iosevka
(	pkgs.texlive.withPackages (ps: [ 
          ps.scheme-medium 
	  ps.collection-latexextra
        ]))
];      
  xsession.enable = true;
  programs.neovim = {                                                                                  
       enable = true;                                                                                   
      extraPackages = with pkgs; [                                                                     
         gcc        # Кампілятар З                                                                      
         gnumake    # Утыліта make                                                                      
         ripgrep    # Для працы Telescope (пошук тэксту)                                                
         fd         # Для працы Telescope (пошук файлаў)                                                
	 texlab
	 jdt-language-server
       ];                                                                                               
     }; 
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

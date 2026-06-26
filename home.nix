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
	pkgs.nicotine-plus
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
	pkgs.fzf
	pkgs.xournalpp
	pkgs.postman
	pkgs.pywalfox-native
	pkgs.teams-for-linux
	pkgs.heroic
	pkgs.asusctl
	pkgs.telegram-desktop
	pkgs.baobab
	pkgs.google-chrome
	pkgs.rsync

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
	 xclip
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

home.file.".config/polybar/config.ini".source = ./dotfiles/polybar/config.ini;
}

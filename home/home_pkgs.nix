
{pkgs, ...}: 
{
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
	pkgs.freecad
	pkgs.kicad
	pkgs.obsidian
	pkgs.rpi-imager
	pkgs.remmina
	pkgs.nmap
	#LANGUAGE SERVERS
	#basedpyright
	#  emmylua-ls
	pkgs.luajit

        pkgs.jdt-language-server
        pkgs.gcc 
	#pkgs.thonny
	pkgs.faugus-launcher #lutris alternative
	pkgs.waydroid
	pkgs.dpkg
	pkgs.shutter
	pkgs.vlc
	pkgs.libreoffice
	#pkgs.avahi
	pkgs.cheese
	pkgs.net-tools
	pkgs.yt-dlp
	pkgs.qmk
	#pkgs.rPackages.Anaconda DOESNT WORK ON NIXOS
	pkgs.jupyter

#	pkgs.virtualbox
	pkgs.openconnect
	pkgs.krita
	pkgs.android-studio
#	pkgs.visualvm
	pkgs.netbeans
	pkgs.python313Packages.numpy
	pkgs.python313Packages.pandas
	   	
];      

}

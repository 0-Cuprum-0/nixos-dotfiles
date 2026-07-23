#in this config there are my basic conf for the system and config for anime launchers MIXED
#https://github.com/ezKEa/aagl-gtk-on-nix
{
	description = "Cuprum's flake.nix";
	inputs = {
	 aagl.url = "github:ezKEa/aagl-gtk-on-nix";
    # Or, if you follow Nixkgs release 26.05:
    # aagl.url = "github:ezKEa/aagl-gtk-on-nix/release-26.05";
	  aagl.inputs.nixpkgs.follows = "nixpkgs"; # Name of nixpkgs input you want to use
		nixpkgs.url = "nixpkgs/nixos-25.11";
		home-manager = {
			url = "github:nix-community/home-manager/release-25.11";
			inputs.nixpkgs.follows = "nixpkgs";
		
};		
};
	outputs = {self,nixpkgs, home-manager, aagl,  ...}: { #
		nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [
				{
				  imports = [ aagl.nixosModules.default ];
				  nix.settings = aagl.nixConfig; # Set up Cachix
				  programs.anime-game-launcher.enable = true; # Adds launcher and /etc/hosts rules
				  programs.anime-games-launcher.enable = true;
				  programs.honkers-railway-launcher.enable = true;
				  programs.honkers-launcher.enable = true;
				  programs.wavey-launcher.enable = true;
				  programs.sleepy-launcher.enable = true;
				}
			./configuration.nix
			home-manager.nixosModules.home-manager
			{
				home-manager  = {
					useGlobalPkgs = true;
					useUserPackages = true;
					users.cuprum = import ./home/home.nix;
					backupFileExtension = "backup";
					
};
			

}
];		
};
};
}

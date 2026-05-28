{ config, pkgs, ... }:

{
    home.username = "mason";
    home.homeDirectory = "/home/mason";
    home.shell.enableFishIntegration = true;

    programs = {
        home-manager.enable = true;
        fish = {
            enable = true;
        };
        kakoune.enable = true;
        git = {
            enable = true;
            lfs.enable = true;
            settings = {
                user = {
                    name = "Mason Davy";
                    email = "mason.davy@etegent.com";
                    signingKey = "CECCD220F85C545A";
                };
                commit = {
                    gpgsign = true;
                };
                tag = {
                    gpgsign = true;
                };
                credential = {
                    credentialStore = "gpg";
                    helper = "/mnt/c/Program Files/Git/mingw64/bin/git-credential-manager.exe";
                };
                core = {
                    editor = "kak";
                };
            };
        };
        gpg.enable = true;
    };

    home.packages = with pkgs; [
        pass-wayland
        tig
    ];

    services = {
        gpg-agent = {
            enable = true;
            pinentry = {
                package = pkgs.pinentry-all;
                program = "pinentry-curses";
            };
        };
    };

    home.stateVersion = "26.05";
}

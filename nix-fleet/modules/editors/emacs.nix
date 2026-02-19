{ pkgs, config, ... }:

let
  myEmacs = (pkgs.emacs30.override {
    withTreeSitter = true;
    withNativeCompilation = true;
  });
in {
  programs.emacs = {
    enable = true;
    package = myEmacs;
    extraPackages = epkgs: with epkgs; [
      evil evil-collection which-key general
      doom-themes doom-modeline magit
      nix-mode markdown-mode
    ];
  };

  # This is the "Bypass" - Writing the file directly to the config path
  xdg.configFile."emacs/init.el".text = ''
    ;; --- THE TOWER CORE ---
    (setq inhibit-startup-screen t
          inhibit-startup-message t
          initial-scratch-message nil
          initial-major-mode 'fundamental-mode)

    (scroll-bar-mode -1)
    (tool-bar-mode -1)
    (menu-bar-mode -1)
    (blink-cursor-mode 0)

    (require 'evil)
    (setq evil-want-keybinding nil)
    (evil-mode 1)

    (require 'doom-themes)
    (load-theme 'doom-ir-black t)

    (require 'which-key)
    (which-key-mode)

    (require 'general)
    (general-define-key
      :states '(normal insert visual emacs)
      :prefix ","
      "ff" 'find-file
      "bb" 'switch-to-buffer)

    (message "--- THE TOWER IS FINALLY ONLINE ---")
  '';

  services.emacs = {
    enable = true;
    package = myEmacs;
  };

  home.shellAliases = {
    emacs = "emacsclient -c -a ''";
  };
}

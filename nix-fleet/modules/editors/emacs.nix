{ pkgs, config, ... }:

let
  isMobile = pkgs.stdenv.hostPlatform.isAarch64;
  syncPath = if isMobile
             then "/storage/emulated/0/SyncThing"
             else "${config.home.homeDirectory}/SyncThing";

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
      ivy counsel doom-themes doom-modeline magit
      markdown-mode clojure-mode cider lua-mode nix-mode
      treesit-grammars.with-all-grammars
    ];

    extraConfig = ''
      ;; 1. THE TOP-LEVEL LOCKS (Must be first)
      (setq inhibit-startup-screen t)
      (setq inhibit-startup-message t)
      (setq inhibit-flash-screen t)
      (setq initial-scratch-message nil)
      (setq initial-major-mode 'fundamental-mode)
      (setq inhibit-startup-echo-area-message "bluelegend")

      ;; 2. THE ENGINE
      (setq evil-want-keybinding nil)
      (require 'evil)
      (evil-mode 1)
      (require 'evil-collection)
      (evil-collection-init)
      (require 'which-key)
      (which-key-mode)

      ;; 3. THEME & KEYBINDINGS
      (require 'doom-themes)
      (load-theme 'doom-ir-black t)

      (require 'general)
      (general-define-key
        :states '(normal insert visual emacs)
        :prefix ","
        :global-prefix "C-,"
        "f"  '(:ignore t :which-key "files")
        "ff" 'find-file
        "bb" 'switch-to-buffer
        "gs" 'magit-status
        "t"  '(:ignore t :which-key "themes")
        "tn" (lambda () (interactive) 
               (let* ((current (car custom-enabled-themes))
                      (next (if (eq current 'doom-ir-black) 'doom-one 'doom-ir-black)))
                 (mapc #'disable-theme custom-enabled-themes)
                 (load-theme next t)))
        "s"  '(:ignore t :which-key "sync")
        "sd" (lambda () (interactive) (dired "${syncPath}")))

      ;; 4. THE DAEMON FIX (The only hook we need)
      (add-hook 'focus-in-hook (lambda () (load-theme 'doom-ir-black t)))
    '';
  };

  # Make sure the service is NOT fighting for the same binary
  services.emacs = {
    enable = true;
    package = myEmacs;
  };

  home.shellAliases = {
    emacs = "emacsclient -c -a ''";
  };
}

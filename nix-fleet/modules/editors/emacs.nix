{ pkgs, config, lib, ... }:

let
  # Detect presence of ARM-based mobile-device
  isMobile = pkgs.stdenv.hostPlatform.isAarch64;
  # The "Universal Path" logic
  syncPath = if isMobile
             then "/storage/emulated/0/SyncThing"
             else "${config.home.homeDirectory}/SyncThing";

  # Merge your specific performance overrides here
  myEmacs = (pkgs.emacs30-pgtk.override {
    withTreeSitter = true;
    withNativeCompilation = true;
  });
in {
  # This starts the Emacs server in the background
  # services.emacs = {
  programs.emacs = {
    enable = true;
    package = myEmacs;

    extraPackages = epkgs: with epkgs; [
      # The Vim Expat Trifecta
      evil
      evil-collection
      which-key
      general

      # Core Navigation & Aesthetics
      ivy
      counsel
      doom-themes
      doom-modeline
      magit

      # "Smart Syntax" (Highlighting only; No binaries)
      markdown-mode
      # lilypond
      clojure-mode
      cider
      lua-mode
      nix-mode

      treesit-grammars.with-all-grammars
    ];

    extraConfig = ''
      ;; --- 1. CORE UI ---
      (setq inhibit-startup-message t)
      (setq inhibit-splash-screen t)
      (setq initial-scratch-message nil) ; or ""

      (setq initial-major-mode 'fundamental-mode) ; For a quick startup
      (scroll-bar-mode -1)
      (tool-bar-mode -1)
      (blink-cursor-mode 0)

      ;; --- 2. VIM EXPAT TRIFECTA ---
      (setq evil-want-keybinding nil)
      (require 'evil)
      (evil-mode 1)

      (require 'evil-collection)
      (evil-collection-init)

      (require 'which-key)
      (which-key-mode)

      ;; --- 3. THEME & CYCLER ---
      (require 'doom-themes)
      (load-theme 'doom-ir-black t)

      (defvar my/themes '(doom-ir-black doom-one doom-vibrant doom-molokai))
      (defun my/cycle-theme ()
        (interactive)
        (let* ((current (car custom-enabled-themes))
               (next (or (cadr (member current my/themes)) (car my/themes))))
          (mapc #'disable-theme custom-enabled-themes)
          (load-theme next t)
          (message "Switched to theme: %s" next)))

      ;; --- 4. GENERAL KEYBINDINGS (Leader: ,) ---
      (require 'general)
      (general-create-definer my-leader-def
        :keymaps '(normal insert visual emacs)
        :prefix ","
        :global-prefix "C-,")
      
      (my-leader-def
        "f"  '(:ignore t :which-key "files")
        "ff" '(find-file :which-key "find file")
        "bb" '(switch-to-buffer :which-key "switch buffer")
        "gs" '(magit-status :which-key "git status")
        "t"  '(:ignore t :which-key "themes")
        "tn" '(my/cycle-theme :which-key "next theme")
        "s"  '(:ignore t :which-key "sync")
        "sd" `(lambda () (interactive) (dired "${syncPath}")))
    '';
  };

  # External helper binaries
  home.packages = with pkgs; [
    ripgrep
    fd
  ];

  # xdg.configFile."emacs/init.el".source = ./init.el;

  services.emacs = {
    enable = true;
    # Use the same high-perf package for the deamon
    package = myEmacs;
  };
}

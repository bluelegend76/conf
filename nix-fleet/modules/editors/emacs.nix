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
      slime
      nix-mode markdown-mode
      # New syntax support
      php-mode
      d-mode
      typescript-mode
      web-mode
      # pdf-tools
      # vimish folds
      # ivy
      # swiper
      # counsel
      # dired-subtree
      # org-roam
      # org-drill
      # Aesthetics ----
      # org-modern
      # org-appear
      # org-superstar  # Alternative to org-modern for pretty bullets
      # Literate Programming ----
      # ob-restclient  # Great for API work
      # ob-go          # If you ever touch Go
      # Knowledge Management ----
      # org-roam-ui
      # gptel          # (Optional) If you want to use LLMs inside Org buffers
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

    (use-package slime
      :ensure t
      :config
      (setq inferior-lisp-program "sbcl")
      (slime-setup '(slime-fancy slime-quicklisp slime-asdf)))

    ;; --- LANGUAGE MAPPINGS ---
    (add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
    (add-to-list 'auto-mode-alist '("\\.di?\\'" . d-mode))
    (add-to-list 'auto-mode-alist '("\\.mdx\\'" . web-mode))

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

  # TODO Not in last variant, but may
  # want to reactive in next iteration
  # home.shellAliases = {
  #   emacs = "emacsclient -c -a ''";
  # };
}

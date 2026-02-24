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
      use-package
      envrc
      evil evil-collection which-key general
      doom-themes doom-modeline magit
      slime
      dired-subtree magit projectile
      vertico marginalia orderless consult
      pdf-tools
      # TODO - Logseq: logseq-mode
      # ORG-ROAM
      # ORG-DRILL
      # vimish folds
      # ivy swiper counsel

      # Aesthetics ----
      org-modern  # TODO: Add hiding of start/end tag for fenced code-blocks
      org-appear
      # org-superstar  # Alternative to org-modern for pretty bullets
      # Literate Programming ----
      # ob-restclient  # Great for API work
      # ob-go          # If you ever touch Go
      # Knowledge Management ----
      # org-roam-ui
      # gptel          # (Optional) If you want to use LLMs inside Org buffers

      # New syntax support
      nix-mode markdown-mode
      php-mode
      d-mode
      typescript-mode
      web-mode
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

    (use-package pdf-tools
      :mode ("\\.pdf\\'" . pdf-view-mode)
      :config
      ;; This "installs" the epdfinfo server logic
      (pdf-tools-install :no-query)
      ;; Optional: Nice QoL for PDFs
      (setq-default pdf-view-display-size 'fit-page)
      (define-key pdf-view-mode-map (kbd "j") 'pdf-view-next-line-or-next-page)
      (define-key pdf-view-mode-map (kbd "k") 'pdf-view-previous-line-or-previous-page))

      (use-package org-modern
        :hook (org-mode . org-modern-mode)
        :config
        (setq 
         ;; Use elegant bars for the vertical lines in blocks
         org-modern-block-fringe 2
         ;; Customize your "High-End" bullets
         org-modern-star '("◉" "○" "◈" "◇" "✳")
         ;; Make checkboxes look like modern UI elements
         org-modern-checkbox 
         '((?X . "󰄲")
           (?- . "󰡖")
           (?\  . "󰄱")))
        (global-org-modern-mode))

      (use-package org-appear
        :hook (org-mode . org-appear-mode)
        :config
        ;; Only show the "clutter" when the cursor is literally on the word
        (setq org-appear-autoemphasis t
              org-appear-autolinks t
              org-appear-autosubmarkers t))

    ;; UI QoL
    (use-package consult
      :bind (;; This is your "Swiper" replacement
             ("C-s" . consult-line)
             ;; High-end buffer switching with previews
             ("C-x b" . consult-buffer)
             ;; Search for headings in your MDX/Docusaurus files
             ("M-g o" . consult-outline))
      :config
      ;; Enable live previews (The "Black Tower" visual check)
      (setq consult-preview-key 'any))

    (use-package orderless
      :custom
      (completion-styles '(orderless basic))
      (completion-category-overrides '((file (styles basic partial-completion)))))

    (use-package vertico
      :init (vertico-mode))

    (use-package marginalia
      :init (marginalia-mode))

    (use-package dired-subtree
      :after dired
      :bind (:map dired-mode-map
                  ("<tab>" . dired-subtree-toggle)
                  ("<backtab>" . dired-subtree-remove)))

    (use-package magit
      :bind ("C-x g" . magit-status)
      :config
      ;; This ensures Magit doesn't hang if a process takes a while
      (setq magit-refresh-status-buffer nil))

    (use-package projectile
      :init
      (projectile-mode +1)
      :bind-keymap
      ("C-c p" . projectile-command-map)
      :config
      ;; Automatically find projects in your processdir
      (setq projectile-project-search-path '("~/processdir"))
      ;; Sort projects by "recently opened"
      (setq projectile-sort-order 'recentf))

    (use-package slime
      :ensure t
      :config
      (setq inferior-lisp-program "sbcl")
      (slime-setup '(slime-fancy slime-quicklisp slime-asdf)))

    (use-package envrc
      ; :ensure t
      :hook (after-init . envrc-global-mode))

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

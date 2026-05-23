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
      evil evil-collection which-key
      general  # newer replacement for evil-leader
      evil-org  # adds evil-bindings for Org-Mode
      # evil-surround (e.g. cs")
      # evil-commentary (gc, gcc)
      # evil-numbers (i.e. c-a, c-x)
        # evil-goggles
      doom-themes doom-modeline magit
      slime
      dired-subtree magit projectile
      vertico marginalia orderless consult
      cape
      embark embark-consult
      pdf-tools
      corfu
      # Aesthetics ----
      org-modern  # TODO: Add hiding of start/end tag for fenced code-blocks
      org-appear
      # org-superstar  # Alternative to org-modern for pretty bullets
      # Knowledge Management ----
      org-roam org-roam-ui
      org-drill
      sqlite3
      # TODO - Logseq: logseq-mode
      # logseq-mode outline-indent-mode origami
      # gptel          # (Optional) If you want to use LLMs inside Org buffers
      # vimish folds
      # avy
      # ivy swiper counsel

      # Literate Programming ----
      # ob-restclient  # Great for API work
      # ob-go          # If you ever touch Go

      # New syntax support
      nix-mode markdown-mode
      php-mode
      d-mode
      typescript-mode
      web-mode
    ];
  };

  # This is the "Bypass" - Writing the file directly to the config path
  xdg.configFile."emacs/init.el" = {
    force = true;
    text = ''
      (require 'use-package)

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

      (use-package org-roam
        :custom
        (org-roam-directory (file-truename "~/org-roam"))
        :bind (("C-c n l" . org-roam-buffer-toggle)
               ("C-c n f" . org-roam-node-find)
               ("C-c n g" . org-roam-graph)
               ("C-c n i" . org-roam-node-insert)
               ("C-c n c" . org-roam-capture)
               ;; Dailies
               ("C-c n j" . org-roam-dailies-capture-today))
        :config
        ;; If you're using the standard emacs-overlay or home-manager, 
        ;; the connector is usually built-in, but this ensures it:
        (org-roam-db-autosync-mode))

      (use-package org-roam-ui
        :after org-roam
        :config
        (setq org-roam-ui-sync-ui t
              org-roam-ui-follow t
              org-roam-ui-update-on-save t
              org-roam-ui-open-on-start nil))

      (use-package org-drill
        :after org)

      ;; --- VTERM (The High-End Terminal) ---
      (use-package vterm
        :commands vterm
        :config
        (setq vterm-max-scrollback 10000))

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

      (use-package embark
        :bind
        (("C-." . embark-act)         ;; pick some comfortable bindings
         ("C-;" . embark-dwim)        ;; Good for 'Do What I Mean'
         ("C-h B" . embark-bindings)) ;; alternative for help-lines
        :init
        ;; Optionally replace the describe-prefix-help with embark-prefix-help-command
        (setq prefix-help-command #'embark-prefix-help-command))

      (use-package embark-consult
        :after (embark consult)
        :demand t
        ;; if you want to have embark-consult to automatically hooks into consult
        :hook
        (embark-collect-mode . consult-preview-at-point-mode))

      ;; --- CORFU (The Completion Engine) ---
      (use-package corfu
        :custom
        (corfu-auto t)                 ;; Enable auto-completion
        (corfu-auto-delay 0.1)         ;; Fast popup
        (corfu-auto-prefix 2)          ;; Start after 2 chars
        :init
        (global-corfu-mode))

      ; (use-package gptel
      ;   :config
      ;   ;; 1. Load your local secrets safely
      ;   (let ((secrets-file (expand-file-name "~/.emacs.secrets")))
      ;     (when (file-exists-p secrets-file)
      ;       (load secrets-file)))

      ;   ;; 2. Configure Anthropic (Claude)
      ;   (setq-default gptel-backend 
      ;     (gptel-make-anthropic "Claude"
      ;       :key (bound-and-true-p my-anthropic-key)
      ;       :stream t))

      ;   ;; 3. Configure Gemini (Google)
      ;   (gptel-make-gemini "Gemini" 
      ;     :key (bound-and-true-p my-gemini-key)
      ;     :stream t)

      ;   ;; 4. Set sensible defaults
      ;   (setq gptel-model 'claude-3-5-sonnet-latest  ;; Use Claude as the primary 'Brain'
      ;         gptel-default-mode 'org-mode)          ;; AI responses formatted as Org
      ;   
      ;   ;; This ensures your 'Vim-style' C-n completion (Cape) 
      ;   ;; works inside the chat buffers too.
      ;   (add-hook 'gptel-mode-hook 'corfu-mode))

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

      ;; --- The Guix Specialist Bridge ---
      (let ((guix-bridge (expand-file-name "~/.config/emacs/guix-clusters.el")))
        (when (file-exists-p guix-bridge)
          (condition-case err
              (load guix-bridge)
            (error (message "Error loading Guix clusters: %s" (error-message-string err))))))

      ;; =====================================================================
      ;; DYNAMIC ENVIRONMENT EXTENSION GATEWAY
      ;; =====================================================================
      ;; Instructs Emacs to read the parent terminal shell's environment.
      ;; If a project-local EMACSLOADPATH exists, parse and prepend it so 
      ;; local Guix-installed language modes are seamlessly inherited.

      (when (getenv "EMACSLOADPATH")
        (setq load-path
              (append (split-string (getenv "EMACSLOADPATH") path-separator)
                      load-path)))

        ;; SPARQL-Association
          (with-eval-after-load 'sparql-mode
            (add-to-list 'auto-mode-alist '("\\.rq\\'" . sparql-mode))
            (add-to-list 'auto-mode-alist '("\\.sparql\\'" . sparql-mode))))

        ;; Cypher Association
          (with-eval-after-load 'cypher-mode
            (add-to-list 'auto-mode-alist '("\\.cyp\\'" . cypher-mode))
            (add-to-list 'auto-mode-alist '("\\.cypher\\'" . cypher-mode))))
      
      (message "--- THE TOWER IS FINALLY ONLINE ---")
    '';
  };

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

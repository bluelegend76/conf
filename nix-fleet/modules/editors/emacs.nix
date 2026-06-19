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
      doom-themes doom-modeline
      magit
      # slime
      # TODO: OR TEST OUT INSTEAD
      # sly: cl-slynk clasp-slynk ecl-slynk
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
      # TODO IMPORTANT: INSTALL 'ORG BABEL {PACKAGE}' TO USE BABEL IN ORG(!)
      # ob-go          # If you ever touch Go

      exec-path-from-shell
      lsp-mode
      # TODO: emacs-guix
      # New syntax support
      nix-mode
      markdown-mode
      web-mode
      rescript-mode
      lfe-mode
      clojure-mode
      cider
      hy-mode
      php-mode
      typescript-mode
      kotlin-mode
      # TODO: java-mode
      tuareg
      d-mode
      # ----
      csound-mode
      # supercollider_scel
      faust-mode

      # This instructs Nix to compile and symlink the shared objects right into Emacs' store path
      treesit-grammars.with-all-grammars
      # treesit-grammars.tree-sitter-go
    ];
  };

  # This is the "Bypass" - Writing the file directly to the config-path
  xdg.configFile."emacs/init.el" = {
    force = true;
    text = ''
      (setq site-run-file nil)
      (put 'eval 'safe-local-variable 'always)

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

      (with-eval-after-load 'evil-org
        (evil-define-key 'normal evil-org-mode-map
          (kbd "SPC")   'org-cycle
          (kbd "C-SPC") 'org-shifttab))

      (require 'doom-themes)
      (load-theme 'doom-ir-black t)

      (use-package pdf-tools
        :mode ("\\.pdf\\'" . pdf-view-mode)
        :config
        (pdf-tools-install :no-query)
        (setq-default pdf-view-display-size 'fit-page)
        (define-key pdf-view-mode-map (kbd "j") 'pdf-view-next-line-or-next-page)
        (define-key pdf-view-mode-map (kbd "k") 'pdf-view-previous-line-or-previous-page))

      (use-package org-modern
        :hook (org-mode . org-modern-mode)
        :config
        (setq 
         org-modern-block-fringe 2
         org-modern-star '("◉" "○" "◈" "◇" "✳")
         org-modern-checkbox 
         '((?X . "󰄲")
           (?- . "󰡖")
           (?\  . "󰄱")))
        (global-org-modern-mode))

      (use-package org-appear
        :hook (org-mode . org-appear-mode)
        :config
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
               ("C-c n j" . org-roam-dailies-capture-today))
      :config
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

      (use-package vterm
        :commands vterm
        :config
        (setq vterm-max-scrollback 10000))

      (use-package consult
        :bind (("C-s" . consult-line)
               ("C-x b" . consult-buffer)
               ("M-g o" . consult-outline))
        :config
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
        (("C-." . embark-act)
         ("C-;" . embark-dwim)
         ("C-h B" . embark-bindings))
        :init
        (setq prefix-help-command #'embark-prefix-help-command))

      (use-package embark-consult
        :after (embark consult)
        :demand t
        :hook
        (embark-collect-mode . consult-preview-at-point-mode))

      (use-package corfu
        :custom
        (corfu-auto t)
        (corfu-auto-delay 0.1)
        (corfu-auto-prefix 2)
        :init
        (global-corfu-mode))

      (use-package dired-subtree
        :after dired
        :bind (:map dired-mode-map
                    ("<tab>" . dired-subtree-toggle)
                    ("<backtab>" . dired-subtree-remove)))

      (use-package magit
        :bind ("C-x g" . magit-status)
        :config
        (setq magit-refresh-status-buffer nil))

      (use-package projectile
        :init
        (projectile-mode +1)
        :bind-keymap
        ("C-c p" . projectile-command-map)
        :config
        (setq projectile-project-search-path '("~/processdir")
              projectile-sort-order 'recentf))

      ; (use-package slime
      ;   :ensure t
      ;   :config
      ;   (setq inferior-lisp-program "sbcl")
      ;   (slime-setup '(slime-fancy slime-quicklisp slime-asdf)))

      (use-package sly
        :ensure t
        :init
        ;; Tell SLY to use your Nix-wrapped SBCL binary as the default engine
        (setq inferior-lisp-program "sbcl"
              sly-lisp-implementations '((sbcl ("sbcl") :coding-system utf-8-unix)))
        :config
        ;; Point SLY to your native, offline Nix HyperSpec documentation
        (setq common-lisp-hyperspec-root 
              "http://www.lispworks.com/documentation/HyperSpec/")

        ;; Force documentation lookups to render purely inside an Emacs window frame
        ;;;; (setq browse-url-browser-function 'eww-browse-url)
        
        ;; Ensure smooth UTF-8 communication over the local network socket
        (setq sly-net-coding-system 'utf-8-unix))


      ;; --- THE HIGH-END ENVIRONMENT HANDSHAKE ---
      (use-package envrc
        :init
        (add-hook 'after-init (lambda () (envrc-global-mode 1))))

      ;; --- LSP & COMPLETION SETUP ---
      (require 'exec-path-from-shell)
      (when (memq window-system '(mac ns x))
        (exec-path-from-shell-initialize))

      ;; Systems C Integration (Tree-sitter + LSP via Eglot)
      (use-package c-ts-mode
        :ensure nil
        ;; :mode ("\\.c\\'" . c-ts-mode)
        :init
        ;; Remap the old C major modes to their modern TS equivalents completely
        (add-to-list 'major-mode-remap-alist '(c-mode . c-ts-mode))
        (add-to-list 'major-mode-remap-alist '(c++-mode . c-ts-mode))
        :config
        ;; Automatically launch Eglot when entering C structural buffers
        (add-hook 'c-ts-mode-hook #'eglot-ensure))

      ;; Go Development Integration (Tree-sitter + LSP via Eglot)
      (use-package go-ts-mode
        :ensure nil
        :mode "\\.go\\'"
        ;; :init
        ;; ;; 1. Register the Tree-sitter grammar location for Go
        ;; (add-to-list 'treesit-language-source-alist
        ;;              '(go "https://github.com/tree-sitter/tree-sitter-go"))
        :config
        ;; 2. Automatically launch the LSP client (Eglot) when entering Go files
        (add-hook 'go-ts-mode-hook #'eglot-ensure)
        
        ;; 3. Optional: Auto-format code and optimize imports on save
        (add-hook 'before-save-hook
                  (lambda ()
                    (when (derived-mode-p 'go-ts-mode)
                      (ignore-errors (eglot-format-buffer))))))

      ;; OCaml Setup
      (use-package tuareg
        :commands tuareg-mode)
        ;; :hook (tuareg-mode . lsp-deferred)) ;; Automatically wake up LSP when a file opens

      ;; TypeScript & TSX Framework Support
      (use-package typescript-ts-mode
        :ensure nil
        :mode (("\\.ts\\'" . typescript-ts-mode)
               ("\\.tsx\\'" . tsx-ts-mode))
        :config
        (add-hook 'typescript-ts-mode-hook #'eglot-ensure)
        (add-hook 'tsx-ts-mode-hook #'eglot-ensure))
      ; ----
      ;; MDX Interactive Markdown Support
      ;; (use-package mdx-mode
      ;;   :ensure t
      ;;   :mode "\\.mdx\\'")
      ; ----
      ;; ReScript / ReasonML Support
      (use-package rescript-mode
        :ensure t
        :mode "\\.res\\'"
        :config
        ;; Optional: hook up rescript-vscode's LSP server if downloaded locally via npm
        (add-hook 'rescript-mode-hook #'eglot-ensure))

      ;; Clojure Integration (Native clojure-lsp Configuration via Eglot)
      (use-package clojure-mode
        :ensure nil
        :mode "\\.clj[sx]?\\'"
      ; ----
        :config
        (with-eval-after-load 'eglot
          ;; Bind Clojure, ClojureScript, and Common files natively to clojure-lsp
          (add-to-list 'eglot-server-programs
                       '((clojure-mode clojurescript-mode clojurec-mode) . ("clojure-lsp"))))
        ; ----
        ;; Automatically invoke Eglot diagnostics when jumping into a Clojure source file
        (add-hook 'clojure-mode-hook #'eglot-ensure))

      ;; Python Integration (The Static Head of the Hy VM Cluster)
      (use-package python
        :ensure nil
        :mode "\\.py\\'"
        :config
        (with-eval-after-load 'eglot
          ;; Ensure Eglot maps Python buffers natively to your flake's Pyright server
          (add-to-list 'eglot-server-programs
                       '(python-mode . ("pyright-langserver" "--stdio"))))
        
        ;; Automatically launch Eglot diagnostics when jumping into a Python file
        (add-hook 'python-mode-hook #'eglot-ensure))
      ; ----
      ;; HyLang Integration (Lisp Syntax mapping to Pyright LSP)
      (use-package hy-mode
        :ensure nil
        :mode "\\.hy\\'"
        :init
        ;; Ensure font-lock hooks run instantly when a Hy-file is loaded
        (add-hook 'hy-mode-hook #'font-lock-mode)
        :config
        ;; Set up classic Lisp indentations and safe structural parameters
        (setq hy-shell-interpreter "hy")
      ; ----
        (add-hook 'hy-mode-hook
                  (lambda ()
                    (setq-local eldoc-documentation-function #'hy-shell-eldoc-function)
                    (add-hook 'completion-at-point-functions #'hy-shell-completion-at-point-function nil t)))
      ; ----
        ;; Ergonomic Hook: Automatically ensure syntax colors refresh on entry
    ;@@ (add-hook 'hy-mode-hook (lambda () (font-lock-update))))
        ;; 2. Drives visual Corfu popups inside the INTERACTIVE REPL buffer itself (M-x run-hy)
        (add-hook 'hy-shell-mode-hook
                  (lambda ()
                    ;; Force the shell parser to use Hy's native completion engine
                    (setq-local completion-at-point-functions '(hy-shell-completion-at-point-function))
                    
                    ;; Turn on Corfu locally for this specific interactive console buffer
                    (when (fboundp 'corfu-mode)
                      (setq-local corfu-auto t) ; Ensure autocomplete pops up automatically as you type
                      (corfu-mode 1)))))

    ;;; ====
    ;;  ; (with-eval-after-load 'eglot
    ;;  ;   ;; Bind Hy buffers to route structural metadata through Pyright
    ;;  ;   (add-to-list 'eglot-server-programs
    ;;  ;                '(hy-mode . ("pyright-langserver" "--stdio"))))
    ;;; ----
    ;;; ;; Ensure Eglot wakes up automatically when a Hy file is loaded
    ;;; (add-hook 'hy-mode-hook #'eglot-ensure))

      ;; Kotlin Setup
      (use-package lsp-mode
        :commands lsp
        :hook (kotlin-mode . lsp-deferred)
        :config
        (setq lsp-kotlin-server-command '("kotlin-language-server")))

      ;; Elixir & Phoenix Integration (Official Unified Expert LSP Setup)
      (use-package elixir-ts-mode
        :ensure nil
        :mode ("\\.ex\\'" "\\.exs\\'")
        :init
        (add-to-list 'major-mode-remap-alist '(elixir-mode . elixir-ts-mode))
        :config
        (with-eval-after-load 'eglot
          ;; Provide the mandatory --stdio transport argument to the binary list
          (add-to-list 'eglot-server-programs
                       '((elixir-mode elixir-ts-mode) . ("expert" "--stdio"))))
        
        (add-hook 'elixir-mode-hook #'eglot-ensure)
        (add-hook 'elixir-ts-mode-hook #'eglot-ensure))
      ; ----
      ;; Lisp Flavoured Erlang Integration
      (use-package lfe-mode
        :ensure nil
        :mode "\\.lfe\\'"
        :config
        (with-eval-after-load 'eglot
          ;; Route LFE to the dedicated Erlang engine instead of Expert
          (add-to-list 'eglot-server-programs
                       '(lfe-mode . ("expert" "--stdio"))))
        
        (add-hook 'lfe-mode-hook #'eglot-ensure))

      ;; Automatically start the LSP engine when entering standard or tree-sitter C++ buffers
      (add-hook 'c++-mode-hook #'lsp-deferred)
      (add-hook 'c++-ts-mode-hook #'lsp-deferred)

      ;; Prolog Configuration (SWI-Prolog Integration)
      (use-package prolog
        :ensure nil ; Built-in core mode
        :mode (("\\.pl\\'" . prolog-mode)
               ("\\.m\\'" . prolog-mode)) ; Route Mercury-files her too
        :config
        (setq prolog-system 'swi))
      ; ----
      ;; Mercury Language Integration
      ; (use-package mercury-mode
      ;   :ensure t
      ;   :mode "\\.m\\'"
      ;   :init
      ;   ;; Ensure Mercury takes precedence over Objective-C/Matlab for .m files
      ;   (add-to-list 'auto-mode-alist '("\\.m\\'" . mercury-mode)))

      ;; --- MUSIC CODING CLUSTER ---
      ;; SuperCollider (scel) configuration
      (use-package sclang
        :defer t
        :config
        (setq sclang-show-workspace-on-startup nil))
      ; ----
      ;; Csound Mode configuration
      (use-package csound-mode
        :mode ("\\.csd\\'" "\\.orc\\'" "\\.sco\\'"))
      ; ----
      ;; Faust Mode configuration
      (use-package faust-mode
        :mode "\\.dsp\\'")

      ;; --- GLOBAL LANGUAGE MAPPINGS ---
      (add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
      (add-to-list 'auto-mode-alist '("\\.di?\\'" . d-mode))
      (add-to-list 'auto-mode-alist '("\\.mdx\\'" . web-mode))
      (add-to-list 'auto-mode-alist '("\\.ml\\'" . tuareg-mode))

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
  };

  services.emacs = {
    enable = true;
    package = myEmacs;
  };
}

{ pkgs, config, ... }:
# ____

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
      fsharp-mode apheleia
      graphql-mode verb
      color-theme-buffer-local
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
      (setq debug-on-error t)

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

      ; TODO: ADD ORG-QL !!  ____

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

      ;; Automatically start the LSP engine when entering standard or tree-sitter C++ buffers
      (add-hook 'c++-mode-hook #'lsp-deferred)
      (add-hook 'c++-ts-mode-hook #'lsp-deferred)

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

      ;; ==========================================
      ;; .NET CLUSTER CONFIGURATION (C# & F#)
      ;; ==========================================
        ; ----
      ;; 1. F# Language Core and REPL Integration
      (use-package fsharp-mode
        :ensure t
        :defer t
        :mode ("\\.fs[ix]?\\'")
        :commands (fsharp-run-process-if-needed fsharp-eval-region fsharp-eval-phrase)
        :config
        ;; Standard F# compilation shortcuts
        (define-key fsharp-mode-map (kbd "C-c C-r") 'fsharp-eval-region)
        (define-key fsharp-mode-map (kbd "C-M-x")   'fsharp-eval-phrase))
        ; ----
      ;; 2. C# Language Core
      (use-package csharp-mode
        :ensure t
        :defer t)
        ; ----
      ;; 3. Modern Language Server Automation (Eglot)
      (use-package eglot
        :ensure t
        :hook ((fsharp-mode . eglot-ensure)
               (csharp-mode . eglot-ensure))
        :config
        ;; A. Register C# cleanly
        (add-to-list 'eglot-server-programs
                     '(csharp-mode . ("Microsoft.CodeAnalysis.LanguageServer" "--stdio")))

        ;; B. Register F# WITHOUT the dead --background-service flag,
        ;; and embed the initialization parameters directly into the launcher array.
        (setf (alist-get 'fsharp-mode eglot-server-programs)
              '("fsautocomplete" 
                :initializationOptions 
                (:automaticWorkspaceInit t 
                 :preloadProjectByFile t 
                 :keywordsAutocomplete t))))
        ; ----
      ;; 4. Automatic Formatting via Fantomas (F#)
      (use-package apheleia
        :ensure t
        :config
        ;; Maps localized or system-wide formatters elegantly on save
        (setf (alist-get 'fsharp-mode apheleia-mode-alist) 'fantomas)
        (apheleia-global-mode +1))
        ; ----
    ; ;; 5. Dynamic Buffer-Local Visual Context Swapping
    ; (use-package load-theme-buffer-local
    ;   :ensure t
    ;   :config
    ;   ;; Define a helper function to change the theme locally via a major-mode hook
    ;   (defun my-set-buffer-theme (theme)
    ;     (load-theme-buffer-local theme (current-buffer)))

    ;   ;; Hook them into your specific language modes
    ;   (add-hook 'fsharp-mode-hook (lambda () (my-set-buffer-theme 'tango-dark)))
    ;   (add-hook 'csharp-mode-hook (lambda () (my-set-buffer-theme 'misterioso))))


      ;@ ;; ============================================================
      ;@ ;; JAVASCRIPT/TYPESCRIPT - tree-sitter modes + Eglot + vtsls
      ;@ ;; ============================================================

      ;@ ;; Install tree-sitter grammars on first load
      ;@ (use-package treesit
      ;@   :ensure nil
      ;@   :config
      ;@   (setq treesit-language-source-alist
      ;@         '((javascript . ("https://github.com/tree-sitter/tree-sitter-javascript"
      ;@                          "master" "src"))
      ;@           (typescript . ("https://github.com/tree-sitter/tree-sitter-typescript"
      ;@                          "master" "typescript/src"))
      ;@           (tsx        . ("https://github.com/tree-sitter/tree-sitter-typescript"
      ;@                          "master" "tsx/src"))
      ;@           (json       . ("https://github.com/tree-sitter/tree-sitter-json"
      ;@                          "master" "src"))
      ;@           (css        . ("https://github.com/tree-sitter/tree-sitter-css"
      ;@                          "master" "src"))
      ;@           (html       . ("https://github.com/tree-sitter/tree-sitter-html"
      ;@                          "master" "src"))))

      ;@   ;; Install any grammars not yet compiled
      ;@   (dolist (lang '(javascript typescript tsx json css html))
      ;@     (unless (treesit-language-available-p lang)
      ;@       (treesit-install-language-grammar lang))))

      ;@ ;; File associations - prefer tree-sitter modes where available
      ;@ (add-to-list 'auto-mode-alist '("\\.js\\'"  . js-ts-mode))
      ;@ (add-to-list 'auto-mode-alist '("\\.jsx\\'" . js-ts-mode))
      ;@ (add-to-list 'auto-mode-alist '("\\.ts\\'"  . typescript-ts-mode))
      ;@ (add-to-list 'auto-mode-alist '("\\.tsx\\'" . tsx-ts-mode))
      ;@ (add-to-list 'auto-mode-alist '("\\.json\\'" . json-ts-mode))
      ;@ (add-to-list 'auto-mode-alist '("\\.css\\'"  . css-ts-mode))

      ;@ ;; ============================================================
      ;@ ;; EGLOT - LSP server registrations
      ;@ ;; ============================================================
      ;@ (with-eval-after-load 'eglot
      ;@   ;; vtsls for JS and TS - faster than typescript-language-server
      ;@   (add-to-list 'eglot-server-programs
      ;@                '((js-ts-mode typescript-ts-mode tsx-ts-mode) .
      ;@                  ("vtsls" "--stdio")))
      ;@   ;; HTML/CSS/JSON via vscode-langservers-extracted
      ;@   (add-to-list 'eglot-server-programs
      ;@                '(html-mode . ("vscode-html-language-server" "--stdio")))
      ;@   (add-to-list 'eglot-server-programs
      ;@                '(css-ts-mode . ("vscode-css-language-server" "--stdio")))
      ;@   (add-to-list 'eglot-server-programs
      ;@                '(json-ts-mode . ("vscode-json-language-server" "--stdio")))
      ;@   ;; ReScript
      ;@   (add-to-list 'eglot-server-programs
      ;@                '(rescript-mode . ("rescript-language-server" "--stdio"))))

      ;@ ;; Auto-start Eglot in all relevant modes
      ;@ (dolist (hook '(js-ts-mode-hook
      ;@                 typescript-ts-mode-hook
      ;@                 tsx-ts-mode-hook
      ;@                 css-ts-mode-hook
      ;@                 json-ts-mode-hook))
      ;@   (add-hook hook #'eglot-ensure))

      ;@ ;; ============================================================
      ;@ ;; RESCRIPT - syntax highlighting and mode
      ;@ ;; ============================================================
      ;@ (use-package rescript-mode
      ;@   :ensure t
      ;@   :hook (rescript-mode . eglot-ensure))

      ;@ ;; ============================================================
      ;@ ;; MDX - treat as a mix of markdown and JSX
      ;@ ;; ============================================================
      ;@ (use-package markdown-mode
      ;@   :ensure t)

      ;@ (add-to-list 'auto-mode-alist '("\\.mdx\\'" . markdown-mode))

      ;@ ;; ============================================================
      ;@ ;; PRETTIER - auto-format on save
      ;@ ;; ============================================================
      ;@ (use-package prettier
      ;@   :ensure t
      ;@   :hook ((js-ts-mode
      ;@           typescript-ts-mode
      ;@           tsx-ts-mode
      ;@           css-ts-mode
      ;@           json-ts-mode
      ;@           rescript-mode) . prettier-mode))

      ;; Clojure Integration (Native clojure-lsp Configuration via Eglot)
      (use-package clojure-mode
        :ensure nil
        :mode (("\\.clj[sx]?\\'" . clojure-mode)
               ("\\.edn\\'"      . clojure-mode))
      ; ----
        :config
        (with-eval-after-load 'eglot
          ;; Bind Clojure, ClojureScript, and Common files natively to clojure-lsp
          (add-to-list 'eglot-server-programs
                       '((clojure-mode clojurescript-mode clojurec-mode) . ("clojure-lsp"))))
        ;; Automatically invoke Eglot diagnostics when jumping into a Clojure source file
        (add-hook 'clojure-mode-hook #'eglot-ensure))

      ;; High-Performance Dynamic REPL Engine
      (use-package cider
        :ensure nil
        :defer t
        :config
        ;; CRITICAL: Tell CIDER not to compete with Eglot/LSP for code intelligence
        (setq cider-eldoc-display-for-symbol-at-point nil) ; Let Eglot handle documentation hovers
        (setq cider-font-lock-dynamically nil)             ;; Let clojure-mode/LSP handle coloring
        (setq cider-completion-tool 'none)                  ;; Force CIDER to hand autocompletion to Eglot
        
        ;; Ergonomic Tweaks for the REPL buffer itself
        (setq cider-repl-pop-to-buffer-on-connect t)       ;; Pop up the REPL window instantly on connect
        (setq cider-repl-display-help nil))                ;; Keep the REPL buffer clean and minimalist


      ;; ============================================================
      ;; PYTHON — Eglot + Pyright
      ;; ============================================================
      (use-package python
        :ensure nil
        :mode "\\.py\\'"
        :hook (python-mode . eglot-ensure)
        :config
        (with-eval-after-load 'eglot
          (add-to-list 'eglot-server-programs
                       '(python-mode . ("pyright-langserver" "--stdio")))))

      ;; ============================================================
      ;; CORFU — completion UI (shared by Python and Hy)
      ;; ============================================================
      (use-package corfu
        :ensure t
        :custom
        (corfu-auto t)
        (corfu-auto-delay 0.2)
        (corfu-auto-prefix 2)
        :hook
        (prog-mode        . corfu-mode)
        (inferior-hy-mode . corfu-mode))

      ;; ============================================================
      ;; EGLOT — register hyuga as the Hy LSP server
      ;; ============================================================
      (with-eval-after-load 'eglot
        (add-to-list 'eglot-server-programs
                     '(hy-mode . ("hyuga"))))

      ;; ============================================================
      ;; HY-MODE — syntax highlighting + REPL
      ;; ============================================================
      (use-package hy-mode
        :ensure nil
        :mode "\\.hy\\'"
        :init
        ;; jedhy is incompatible with Hy 1.x — disable entirely
        (setq hy-jedhy--enable? nil)
        :config
        (setq hy-shell--interpreter "hy")

        ;; Patch the prompt check so the REPL doesn't crash on startup
        (with-eval-after-load 'hy-shell
          (defun hy-shell--redirect-check-prompt-regexp ()
            "Patched: no-op when internal process not yet live."
            (when (and comint-redirect-perform-sanity-check
                       (hy-shell--live-internal?))
              (save-excursion
                (goto-char (point-max))
                (or (re-search-backward comint-prompt-regexp nil t)
                    (error "No prompt found or `comint-prompt-regexp' not set properly"))))))

        (add-hook 'hy-mode-hook #'eglot-ensure))


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

      ; TODO: DATABASES, GRAPHS, SEM. WEB + ONTOL, GraphQL  ____
      (use-package graphql-mode)
      ;
      (use-package lsp-mode
        :commands (lsp lsp-deferred)
        :hook (graphql-mode . lsp-deferred)
        :custom
        (lsp-completion-provider :none))
      ;
      (use-package verb
        :config
        (defun verb-github-auth (rs)
          (verb-headers-set rs "Authorization"
                             (concat "Bearer " (getenv "GITHUB_TOKEN")))
          rs))

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
      (let ((scel-path (expand-file-name ".scel-links"
                         (or (getenv "PRJ_ROOT")
                             (locate-dominating-file default-directory "flake.nix")
                             default-directory))))
        (when (file-directory-p scel-path)
          (add-to-list 'load-path scel-path)
          (require 'sclang)
          (use-package sclang
            :ensure nil
            :config
            (setq sclang-show-workspace-on-startup nil)
            ;; Register file-associations — sclang-mode doesn't do this automatically
            (add-to-list 'auto-mode-alist '("\\.scd\\'" . sclang-mode))
            (add-to-list 'auto-mode-alist '("\\.sc\\'" . sclang-mode))
            (setq sclang-program
                  (or (executable-find "sclang") "sclang")))))
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

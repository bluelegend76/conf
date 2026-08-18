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
      paredit
      mu4e
      # org-msg  # Org2HTML (Step 7+)
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
      org-ql org-drill
      sqlite3
      ## graphviz
      # TODO - Logseq: logseq-mode
      # logseq-mode outline-indent-mode origami
      gptel          # (Optional) If you want to use LLMs inside Org buffers
      ellama
      ## vimish folds
      # avy
      # ivy swiper counsel

      # Literate Programming ----
      # ORG-JUPYTER (+Callysto)
      jupyter
      zmq
      envrc
      # ob-latex
      # ob-restclient  # Great for API work
      # TODO IMPORTANT: INSTALL 'ORG BABEL {PACKAGE}' TO USE BABEL IN ORG(!)
      # ob-go          # If you ever touch Go
      # ob-lisp
      # ob-elixir
      # ob-graphql
      # ob-rust

      # TODO: Bash mode
      exec-path-from-shell
      lsp-mode
      # TODO: emacs-guix
      # New syntax support
      nix-mode
      markdown-mode
      web-mode
      rescript-mode
      lfe-mode
      clojure-mode cider
      rustic
      hy-mode
      php-mode
      typescript-mode
      kotlin-mode
      fsharp-mode apheleia
      graphql-mode verb
      janet-mode # or janet-ts-mode
      # TODO: nushell-mode
      xonsh-mode
      # color-theme-buffer-local
      # TODO: java-mode
      tuareg
      julia-mode julia-vterm
      ess poly-R poly-markdown
      # or adding 'polymode'
      d-mode
      # ----
      csound-mode
      # supercollider_scel
      faust-mode

      # This instructs Nix to compile and symlink the shared objects right into Emacs' store path
      treesit-grammars.with-all-grammars
      # treesit-grammars.tree-sitter-go
    ] ++ [
      (epkgs.trivialBuild {
        pname = "lilypond-mode";
        version = pkgs.lilypond.version;
        src = "${pkgs.lilypond}/share/emacs/site-lisp";
      })
    ];
  };

  home.packages = with pkgs; [
    # sqlite    # Critical back-end binary for Org Roam's database indexer
    graphviz  # Allows Org Roam to visually render local node graphs via Graphviz
  ];

  # This is the "Bypass" - Writing the file directly to the config-path
  xdg.configFile."emacs/init.el" = {
    force = true;
    text = ''
      (setq debug-on-error nil)
      ; (setq debug-on-error t)

      ;; Disable onTypeFormatting entirely — it's what's causing the freeze
      ;; since Eglot waits for a response that vtsls can't provide
      (setq eglot-ignored-server-capabilities
            '(:documentOnTypeFormattingProvider))

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

      (setq evil-want-keybinding nil)
      (require 'evil)
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

      (with-eval-after-load 'org
        ;; Use dvisvgm for LaTeX fragment previews (scalable, generally smaller files)
        (setq org-preview-latex-default-process 'dvisvgm)

        ;; Bump preview scale up from the default so formulas are actually legible
        (setq org-format-latex-options
              (plist-put org-format-latex-options :scale 2))
        ; NOTE/TODO: Only use options below for preview-mode
        (setq org-format-latex-options
              (plist-put org-format-latex-options :foreground "White"))
        (setq org-format-latex-options
              (plist-put org-format-latex-options :background "Transparent")))

      ; TODO: ADD ORG-QL !!  ____
      ;; 4. Org Query Language Core Configuration
      (use-package org-ql
        :ensure nil)

      (use-package org-drill
        :after org)

      (use-package org
        :config
        (org-babel-do-load-languages
         'org-babel-load-languages
         '((emacs-lisp . t) ;; usually on by default, but explicit is fine
           (python . t)
           (jupyter . t)   ;; jupyter loaded last, per emacs-jupyter's own recommendation
           (latex . t)
           (julia . t)
           (lilypond . t)
           (R . t)))

        ;; __ auto-display generated images inline after execution
        (add-hook 'org-babel-after-execute-hook 'org-display-inline-images)

        (setq org-confirm-babel-evaluate nil) ;; skip "Really evaluate?" — see note above
        (setq org-babel-default-header-args:jupyter-python
              '((:async . "yes")
                (:session . "hylang-jupyter")
                (:kernel . "hylang-jupyter"))))

      ;; Native LilyPond major-mode (from LilyPond's own bundled elisp,
      ;; wrapped via emacsPackages.trivialBuild in emacs.nix)
      (use-package lilypond-mode
        :ensure nil
        :mode (("\\.ly\\'"  . LilyPond-mode)
               ("\\.ily\\'" . LilyPond-mode)))

      (use-package ob-lilypond
        :after org
        :config
        ;; --- graphics format for "basic mode" (plain src-block execution) ---
        (setq org-babel-lilypond-gen-png t     ; produce a .png you can inline
              org-babel-lilypond-gen-svg nil
              org-babel-lilypond-gen-pdf nil)

        ;; NOTE: First have arrange-mode activated
        ; = a-x org-babel-lilypond-toggle-arrange-mode
        ;
        ;; --- what to do after arrange-mode compiles (C-c C-c on a block) ---
        (setq org-babel-lilypond-display-pdf-post-tangle t
              org-babel-lilypond-play-midi-post-tangle t)

        ;; --- the actual midi player: fluidsynth + your soundfont ---
        (setq org-babel-lilypond-commands
              '("lilypond"
                ("fluidsynth" "-i" "-a" "pulseaudio" "-g" "1.0"
                 "/nix/store/3mvlz57acvx92d2p6y9l9z9k117g7dl0-Fluid-3/share/soundfonts/FluidR3_GM2-2.sf2" "%s"))))

      (with-eval-after-load 'ob-lilypond
        (setq org-babel-lilypond-arrange-mode t))


      ;; ============================================================
      ;; AI / LLM — gptel + ellama, backed by local Ollama
      ;; ============================================================
      (use-package gptel
        :ensure nil  ;; provided by Nix
        :hook (gptel-mode . (lambda () (evil-collection-init 'gptel)))
        :config
        (setq gptel-backend
              (gptel-make-ollama "Ollama"
                :host "localhost:11434"
                :stream t
                :models '(llama3.2:3b codellama:13b)))
        (setq gptel-model 'llama3.2:3b)
        (setq gptel-default-mode 'org-mode))  ;; matches your Org-heavy workflow

      (use-package ellama
        :ensure nil  ;; provided by Nix
        :init
        (require 'llm-ollama)
        (setopt ellama-language "English")
        (setopt ellama-provider
                (make-llm-ollama
                 :chat-model "llama3.2:3b"
                 :embedding-model "nomic-embed-text")))

      (general-define-key
       :states '(normal visual)
       :prefix ","
       "as" 'gptel-send
       "am" 'gptel-menu
       "ac" 'gptel
       "ar" 'ellama-code-review
       "at" 'ellama-translate
       "aS" 'ellama-summarize)


      ;; ============================================================
      ;; MU4E — Email in Emacs
      ;; ============================================================
      (setq user-mail-address "trulystrange@gmail.com"
            user-full-name    "Daniel Albertsson")

      (use-package mu4e
        :ensure nil  ;; provided by Nix (emacsPackages.mu4e)
        :commands mu4e
        :hook (mu4e-main-mode . (lambda ()
                                  (evil-collection-init 'mu4e)))
        :config
        ;; --- Core paths ---
        (setq mu4e-maildir "~/Maildir"
              mu4e-get-mail-command "mbsync gmail"
              mu4e-update-interval (* 5 60)
              mu4e-change-filenames-when-moving t  ;; required for mbsync
              mu4e-attachment-dir "~/Downloads")

        ;; --- Gmail folder mapping ---
        (setq mu4e-drafts-folder  "/gmail/[Gmail]/Drafts"
              mu4e-sent-folder    "/gmail/[Gmail]/Sent Mail"
              mu4e-trash-folder   "/gmail/[Gmail]/Trash"
              mu4e-refile-folder  "/gmail/[Gmail]/All Mail")

        ;; Gmail saves sent mail server-side already — avoid duplicates
        (setq mu4e-sent-messages-behavior 'delete)

        ;; --- Bookmarks ---
        (setq mu4e-bookmarks
              (list
               (list :name "Inbox"
                     :query "maildir:/gmail/Inbox AND NOT flag:trashed"
                     :key ?i)
               (list :name "Unread"
                     :query "flag:unread AND NOT flag:trashed"
                     :key ?u)
               (list :name "Today"
                     :query "date:today..now AND NOT flag:trashed"
                     :key ?t)
               (list :name "Week"
                     :query "date:7d..now AND NOT flag:trashed"
                     :key ?w)))

        ;; --- Sending mail via msmtp ---
        (with-eval-after-load 'message
          (setq send-mail-function 'message-send-mail-with-sendmail
                message-send-mail-function 'message-send-mail-with-sendmail
                sendmail-program (executable-find "msmtp")
                message-sendmail-f-is-evil t
                message-sendmail-extra-arguments '("--read-envelope-from")))

        ;; --- Headers view columns ---
        (setq mu4e-headers-fields
              '((:human-date   . 12)
                (:flags        .  6)
                (:from         . 22)
                (:subject      . nil))))  ;; nil = take remaining width

      ;; --- General.el leader bindings (comma = your leader) ---
      (general-define-key
        :states '(normal visual emacs)
        :prefix ","
        "mm" 'mu4e
        "mu" '(lambda () (interactive)
                (mu4e-headers-search "flag:unread AND NOT flag:trashed"))
        "mi" '(lambda () (interactive)
                (mu4e-headers-search "maildir:/gmail/Inbox"))
        "mc" 'mu4e-compose-new)

      (require 'gnus-dired)
      (add-hook 'dired-mode-hook 'turn-on-gnus-dired-mode)

      ;;; mu4e-coldstorage.el {{{
      ;;; --- Archive-and-delete workflow for mu4e cold storage

      ;; ---------------------------------------------------------------------
      ;; TWO WAYS TO USE THIS
      ;; ---------------------------------------------------------------------
      ;;
      ;; A) Right now, on one message or a contiguous block:
      ;;    1. Put point on a message, or select a contiguous region
      ;;       (Evil visual state: V then j/k to extend).
      ;;    2. Press ,ma
      ;;    3. Prompted once for the cold-storage folder (defaults to the
      ;;       last one you used -- just press Enter to reuse it).
      ;;    4. Message(s) get a visible pending mark (like D), reviewable
      ;;       and unmarkable with u. Nothing touches disk yet.
      ;;    5. Press x (and later sync) to actually copy + delete.
      ;;
      ;; B) Scattered, non-contiguous messages found while browsing/searching:
      ;;    1. Wherever you spot a message to archive, press * on it
      ;;       (mu4e's built-in "mark for something -- decide later").
      ;;       Repeat anywhere, any number of times, across any searches.
      ;;    2. When done selecting, press ,ma ONE time (not on any particular
      ;;       message -- it detects the pending batch automatically).
      ;;       You're prompted once for the destination, applied to the
      ;;       WHOLE accumulated batch -- no intermediate "which action?"
      ;;       menu, it goes straight to cold-storage archiving.
      ;;    3. Press x (and later sync) to actually copy + delete everything.
      ;;
      ;;    (You can still fall back to mu4e's own generic x/# resolution
      ;;    menu instead of ,ma if you ever want a *different* action for
      ;;    a "something"-marked batch -- e.g. delete or move instead.)
      ;;
      ;; In both cases, nothing is copied or deleted until the mark is
      ;; actually executed (x) -- consistent with how every other mu4e mark
      ;; behaves.

      (defvar my/mu4e-coldstorage-last-target "~/Empire/store/messages/mail/"
        "Default / last-used cold-storage root directory, offered as the default in the destination prompt.")

      ;; Everything below touches mu4e internals (the `mu4e-marks' variable,
      ;; `mu4e-headers-mode-map', etc.) which only exist once mu4e itself has
      ;; actually been loaded. Since mu4e is normally loaded lazily/deferred
      ;; (only when you first open it), wrap all of this in
      ;; `with-eval-after-load' so it runs at the right time instead of
      ;; erroring at Emacs startup.
      (with-eval-after-load 'mu4e

      (defun my/mu4e-coldstorage--ensure-maildir (target)
        "Ensure TARGET is a valid Maildir (cur/new/tmp exist), return TARGET."
        (dolist (d (list target
                          (expand-file-name "cur" target)
                          (expand-file-name "new" target)
                          (expand-file-name "tmp" target)))
          (unless (file-directory-p d) (make-directory d t)))
        target)

      (defun my/mu4e-coldstorage--ask-target ()
        "Prompt once for the cold-storage destination, remembering the choice."
        (let* ((chosen (read-directory-name "Cold storage folder: "
                                             my/mu4e-coldstorage-last-target
                                             my/mu4e-coldstorage-last-target))
               (target (directory-file-name (expand-file-name chosen))))
          (setq my/mu4e-coldstorage-last-target target)
          (my/mu4e-coldstorage--ensure-maildir target)))

      (defun my/mu4e-coldstorage--action (docid msg target)
        "Copy MSG's raw file into TARGET/cur/, then defer to mu4e's own built-in delete action (looked up dynamically from `mu4e-marks', so we never have to guess at or hardcode mu4e's internal flag-setting/proc-call details -- whatever the real \"delete\" mark currently does is exactly what runs here too)."
        (let* ((src (mu4e-message-field msg :path))
               (curdir (expand-file-name "cur" target))
               (dst (expand-file-name (file-name-nondirectory src) curdir)))
          (copy-file src dst t)
          (let ((delete-action (plist-get (cdr (assq 'delete mu4e-marks)) :action)))
            (if delete-action
                (funcall delete-action docid msg target)
              (mu4e-warn "Could not find mu4e's built-in delete action to chain to")))))

      ;; Register the custom mark type. This is the same extension point
      ;; mu4e's own built-in D/d/m marks are implemented through, so it
      ;; participates fully in mu4e's normal mark/review/execute lifecycle,
      ;; AND becomes selectable as a resolution target for '*' (mark for
      ;; something) + '#'/'x' (resolve deferred marks).
      (add-to-list 'mu4e-marks
                   '(coldstorage
                     :char "z"
                     :prompt "zarchive to cold storage"
                     :ask-target my/mu4e-coldstorage--ask-target
                     :show-target (lambda (target) (format "coldstorage:%s" target))
                     :action my/mu4e-coldstorage--action))

      (defun my/mu4e-coldstorage--has-pending-something-p ()
        "Non-nil if the current headers buffer has any pending '*' (something) marks."
        (and (boundp 'mu4e--mark-map) mu4e--mark-map
             (let (found)
               (maphash (lambda (_docid val)
                          (when (eq (car val) 'something) (setq found t)))
                        mu4e--mark-map)
               found)))

      (defun my/mu4e-coldstorage--resolve-something ()
        "Resolve every pending 'something' (*) mark straight to coldstorage. Mirrors mu4e's own `mu4e-mark-resolve-deferred-marks', but skips the \"which mark type?\" prompt entirely -- goes straight to coldstorage, asking for the destination once for the whole batch."
        (mu4e--mark-in-context
         (let (target got-target)
           (maphash
            (lambda (docid val)
              (when (eq (car val) 'something)
                (unless got-target
                  (setq target (my/mu4e-coldstorage--ask-target))
                  (setq got-target t))
                (save-excursion
                  (when (mu4e~headers-goto-docid docid)
                    (mu4e-mark-set 'coldstorage target)))))
            mu4e--mark-map))))

      (defun my/mu4e-archive-and-delete ()
        "If there are pending '*' (something) marks in this buffer, resolve ALL of them straight to cold-storage archiving, prompting once for the whole batch. Otherwise, mark the message at point (or active region) directly for cold-storage archiving."
        (interactive)
        (if (my/mu4e-coldstorage--has-pending-something-p)
            (my/mu4e-coldstorage--resolve-something)
          (mu4e-mark-set 'coldstorage)))

      ;; Evil/general.el-aware bindings, under the existing personal leader
      ;; (matches the existing ,mm binding used to open mu4e) rather than a
      ;; bare letter, since mu4e + evil-collection already claim most single
      ;; letters (including "A", which is evil-collection's own
      ;; mark-for-action binding -- not to be confused with this).
      (general-define-key
       :states '(normal visual)
       :keymaps 'mu4e-headers-mode-map
       :prefix ","
       "ma" #'my/mu4e-archive-and-delete)

      (defun my/mu4e-view-coldstorage-message (path)
        "View an archived cold-storage message file at PATH using mu4e's
      own normal message view -- the same rendering (headers, HTML/plain
      body, attachments) you get opening a regular message -- without
      ever adding PATH to mu4e's index/database.

      Works by asking the `mu' command-line tool to parse the raw file
      into the same s-expression/plist structure mu4e's own viewer
      consumes internally (`mu view --format=sexp'), then handing that
      plist straight to `mu4e-view'."
        (interactive
         (list (read-file-name
                "Archived message file: "
                (file-name-as-directory
                 (expand-file-name "cur" my/mu4e-coldstorage-last-target)))))
        (let* ((path (expand-file-name path))
               (sexp-str (with-temp-buffer
                           (let ((status (call-process "mu" nil t nil
                                                        "view" "--format=sexp" path)))
                             (unless (zerop status)
                               (mu4e-error "mu view failed on %s (exit %s): %s"
                                           path status (buffer-string))))
                           (buffer-string)))
               (msg (car (read-from-string sexp-str))))
          (mu4e-view msg)))

      (general-define-key
       :states '(normal visual)
       :keymaps 'mu4e-headers-mode-map
       :prefix ","
       "mv" #'my/mu4e-view-coldstorage-message)

      ) ;; end of (with-eval-after-load 'mu4e ...)

      (provide 'mu4e-coldstorage)
      ;;; mu4e-coldstorage.el ends here }}}


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
        ; :ensure t
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


      ;; ============================================================
      ;; HASKELL — haskell-mode + HLS via Eglot
      ;; ============================================================
      (use-package haskell-mode
        :ensure t
        :mode (("\\.hs\\'"  . haskell-mode)
               ("\\.lhs\\'" . haskell-literate-mode))
        :hook
        (haskell-mode . haskell-indentation-mode)
        (haskell-mode . eglot-ensure)
        (haskell-mode . haskell-doc-mode)
        :config
        (setq haskell-process-type 'cabal-repl)
        (setq haskell-process-suggest-remove-import-lines t)
        (setq haskell-process-auto-import-loaded-modules t))

      ;; HLS via Eglot
      (with-eval-after-load 'eglot
        (add-to-list 'eglot-server-programs
                     '(haskell-mode . ("haskell-language-server-wrapper" "--lsp"))))

      ;; ============================================================
      ;; RUST — rust-analyzer via Eglot + rustic
      ;; ============================================================
      (use-package rustic
        :ensure nil
        :mode ("\\.rs\\'" . rustic-mode)
        :config
        ;; Use Eglot as the LSP backend (instead of lsp-mode)
        (setq rustic-lsp-client 'eglot)
        ;; Use rustfmt for formatting
        (setq rustic-format-on-save t)
        ;; Don't auto-install rust tools — we manage via Nix/fenix
        (setq rustic-rustfmt-bin "rustfmt")
        (setq rustic-cargo-bin "cargo"))

      (with-eval-after-load 'eglot
        (add-to-list 'eglot-server-programs
                     '(rustic-mode . ("rust-analyzer"))))

      ;; Auto-start Eglot in Rust buffers
      (add-hook 'rustic-mode-hook #'eglot-ensure)

      ;; Tell rust-analyzer where to find the stdlib source
      ;; RUST_SRC_PATH is set by the flake shellHook
      (with-eval-after-load 'eglot
        (when (getenv "RUST_SRC_PATH")
          ; (setq-default eglot-workspace-configuration
          ;               `(:rust-analyzer
          ;                 (:rustcSource ,(getenv "RUST_SRC_PATH"))
          ;                 (:checkOnSave (:command "clippy"))
          ;                 (:cargo (:allFeatures t))))))
          ;; Correct format for rust-analyzer workspace config
          (setq-default eglot-workspace-configuration
                        '(:rust-analyzer
                          (:checkOnSave (:command "clippy")
                           :cargo (:loadOutDirsFromCheck t)
                           :procMacro (:enable t))))))


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

        ;; Janet major mode + minimal REPL-integration (no reliance on
        ;; unmaintained ijanet-mode/inf-janet packages).
        (use-package janet-mode
          :ensure nil                          ;; installed via Nix, not package.el
          :mode "\\.janet\\'"
          :hook (janet-mode . paredit-mode)
          :config
          (defun my/janet-repl ()
            "Start or switch to a Janet REPL."
            (interactive)
            (let ((buf "*janet*"))
              (unless (comint-check-proc buf)
                (make-comint-in-buffer "janet" buf "janet"))
              (pop-to-buffer buf)))

          (defun my/janet-send-region (start end)
            "Send the active region to the Janet REPL."
            (interactive "r")
            (let ((text (buffer-substring-no-properties start end)))
              (my/janet-repl)
              (comint-send-string (get-buffer-process "*janet*")
                                    (concat text "\n"))))

          (defun my/janet-send-buffer ()
            "Send the whole buffer to the Janet REPL."
            (interactive)
            (my/janet-send-region (point-min) (point-max)))

          :bind (:map janet-mode-map
                      ("C-c C-p" . my/janet-repl)
                      ("C-c C-r" . my/janet-send-region)
                      ("C-c C-b" . my/janet-send-buffer)))


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


      ;; ============================================================
      ;; JAVASCRIPT/TYPESCRIPT - tree-sitter modes + Eglot + vtsls
      ;; ============================================================

      ;; Install tree-sitter grammars on first load
      (use-package treesit
        :ensure nil
        :config
        (setq treesit-language-source-alist
              '((javascript . ("https://github.com/tree-sitter/tree-sitter-javascript"
                               "master" "src"))
                (typescript . ("https://github.com/tree-sitter/tree-sitter-typescript"
                               "master" "typescript/src"))
                (tsx        . ("https://github.com/tree-sitter/tree-sitter-typescript"
                               "master" "tsx/src"))
                (json       . ("https://github.com/tree-sitter/tree-sitter-json"
                               "master" "src"))
                (css        . ("https://github.com/tree-sitter/tree-sitter-css"
                               "master" "src"))
                (html       . ("https://github.com/tree-sitter/tree-sitter-html"
                               "master" "src"))))

        ;; Install any grammars not yet compiled
        (dolist (lang '(javascript typescript tsx json css html))
          (unless (treesit-language-available-p lang)
            (treesit-install-language-grammar lang))))

      ;; File associations - prefer tree-sitter modes where available
      (add-to-list 'auto-mode-alist '("\\.js\\'"  . js-ts-mode))
      (add-to-list 'auto-mode-alist '("\\.jsx\\'" . js-ts-mode))
      (add-to-list 'auto-mode-alist '("\\.ts\\'"  . typescript-ts-mode))
      (add-to-list 'auto-mode-alist '("\\.tsx\\'" . tsx-ts-mode))
      (add-to-list 'auto-mode-alist '("\\.json\\'" . json-ts-mode))
      (add-to-list 'auto-mode-alist '("\\.css\\'"  . css-ts-mode))

      ;; ============================================================
      ;; EGLOT - LSP server registrations
      ;; ============================================================
      (with-eval-after-load 'eglot
        (add-to-list 'eglot-server-programs
                     '((js-ts-mode typescript-ts-mode tsx-ts-mode) .
                       ("typescript-language-server" "--stdio")))
        (add-to-list 'eglot-server-programs
                     '(html-mode . ("vscode-html-language-server" "--stdio")))
        (add-to-list 'eglot-server-programs
                     '(css-ts-mode . ("vscode-css-language-server" "--stdio")))
        (add-to-list 'eglot-server-programs
                     '(json-ts-mode . ("vscode-json-language-server" "--stdio"))))

      (dolist (hook '(js-ts-mode-hook
                      typescript-ts-mode-hook
                      tsx-ts-mode-hook
                      css-ts-mode-hook
                      json-ts-mode-hook))
        (add-hook hook #'eglot-ensure))

      ;; ============================================================
      ;; RESCRIPT - syntax highlighting and mode
      ;; ============================================================
      ; TODO: FIX/SET COMPLETION, SYMBOL-INFO, ETC[!]
      (use-package rescript-mode
        :ensure t
        :hook (rescript-mode . eglot-ensure))

      (with-eval-after-load 'eglot
        (add-to-list 'eglot-server-programs
                     '(rescript-mode . ("rescript-language-server" "--stdio"))))

      ;; Add project-local node_modules/.bin to PATH for rescript-mode buffers
      ;; so the language server can find the rescript and bsc compiler binaries
      (add-hook 'rescript-mode-hook
                (lambda ()
                  (let ((local-bin (expand-file-name
                                    "node_modules/.bin"
                                    (or (locate-dominating-file
                                         default-directory
                                         "rescript.json")
                                        default-directory))))
                    (when (file-directory-p local-bin)
                      (setq-local exec-path (cons local-bin exec-path))
                      (setenv "PATH" (concat local-bin ":" (getenv "PATH")))))

        (setq eglot-workspace-configuration
              '(:rescript
                (:settings
                 (:askToStartBuild nil
                  :binaryPath "rescript"))))))


      ;; ============================================================
      ;; MDX - treat as a mix of markdown and JSX
      ;; ============================================================
      (use-package markdown-mode
        :ensure t)

      (add-to-list 'auto-mode-alist '("\\.mdx\\'" . markdown-mode))

      ;; ============================================================
      ;; PRETTIER - auto-format on save
      ;; ============================================================
      ; @ (use-package prettier
      ; @   :ensure nil
      ; @   :if (executable-find "prettier")
      ; @   :hook ((js-ts-mode
      ; @           typescript-ts-mode
      ; @           tsx-ts-mode
      ; @           css-ts-mode
      ; @           json-ts-mode
      ; @           rescript-mode) . prettier-mode))


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
        :mode ("\\.py\\'" . python-mode)
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

      ;; ============================================================
      ;; XONSH-MODE — syntax highlighting, reuses Pyright via Eglot
      ;; ============================================================
      (use-package xonsh-mode
        :ensure t
        :mode "\\.xsh\\'"
        :hook (xonsh-mode . eglot-ensure)
        :config
        (with-eval-after-load 'eglot
          (add-to-list 'eglot-server-programs
                       '(xonsh-mode . ("pyright-langserver" "--stdio")))))


      ;; ============================================================
      ;; JULIA — LSP via Eglot + org-babel integration
      ;; ============================================================
      (use-package julia-mode
        :ensure t
        :mode "\\.jl\\'"
        :hook (julia-mode . eglot-ensure))

      (use-package julia-vterm
        :ensure t
        :hook (julia-mode . julia-vterm-mode)
        :bind (:map julia-vterm-mode-map
                    ("C-c C-c" . julia-vterm-send-region-or-current-line)
                    ("C-c C-b" . julia-vterm-send-buffer)
                    ("C-c C-s" . julia-vterm-switch-to-repl-buffer)))

      (with-eval-after-load 'eglot
        (add-to-list 'eglot-server-programs
                     '(julia-mode . ("julia"
                                     "--startup-file=no"
                                     "--history-file=no"
                                     "-e"
                                     "using LanguageServer; server = LanguageServer.LanguageServerInstance(stdin, stdout); run(server)"))))

      ;; ============================================================
      ;; R — ESS (Emacs Speaks Statistics) + LSP via Eglot
      ;; ============================================================
      (use-package ess
        :ensure t
        :mode (("\\.R\\'"   . R-mode)
               ("\\.Rmd\\'" . poly-markdown+R-mode))
        :hook
        (R-mode . eglot-ensure)
        (R-mode . (lambda ()
                    ;; ESS smart underscore — converts _ to <- in R code
                    (setq ess-smart-S-assign-key "_")))
        :config
        (setq ess-use-eldoc t)
        (setq ess-r-backend 'lsp)
        (setq ess-style 'RStudio)      ;; familiar indentation style
        (setq ess-ask-for-ess-directory nil)
        (setq inferior-R-program-name "R"))

      ;; Polymode for R Markdown files
      (use-package poly-R
        :ensure t
        :after ess)

      (use-package poly-markdown
        :ensure t
        :after ess)

      ;; R LSP via Eglot
      (with-eval-after-load 'eglot
        (add-to-list 'eglot-server-programs
                     '(R-mode . ("R" "--slave" "-e"
                                 "languageserver::run()"))))


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
      ;;
      ;; Gleam
      ; TODO:
      ;@@ (use-package gleam-ts-mode
      ;@@   :ensure t
      ;@@   :mode "\\.gleam\\'"
      ;@@   :hook (gleam-ts-mode . eglot-ensure))

      ;@@ (with-eval-after-load 'eglot
      ;@@   (add-to-list 'eglot-server-programs
      ;@@                '(gleam-ts-mode . ("gleam" "lsp"))))

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
               ("\\.m\\'" . prolog-mode)) ; Route Mercury-files here too
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
        :states '(normal visual emacs)
        :prefix ","

        "ff" 'find-file
        "bb" 'switch-to-buffer)

      (require 'envrc)
      (envrc-global-mode)

      (message "--- THE TOWER IS FINALLY ONLINE ---")
    '';
  };

  services.emacs = {
    enable = true;
    package = myEmacs;
  };
}

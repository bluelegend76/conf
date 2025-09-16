(defun append-to-load-path (dir)
  "Append DIR to the list variable ‘load-path’ only if it exist."
  (if (file-directory-p dir)
      (add-to-list 'load-path (directory-file-name dir) t)
    (message "Load-path %s does not exist" dir)))

(defun elsub (sub-dir)      ;TODO: better name
  (abbreviate-file-name
   (expand-file-name sub-dir user-emacs-directory)))

(server-start)
(defvar package-archives)               ;TODO: set INITVALUE to next line
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")
                         ;; https://github.com/d12frosted/elpa-mirror
                         ("elpy" . "https://jorgenschaefer.github.io/packages/")
                         ("melpa" . "http://melpa.org/packages/") ;MELPA
                         ;; NOTE do not use MELPA stable: https://www.reddit.com/r/emacs/comments/etikbz/speaking_as_a_package_maintainer_please_do_not/
                         ;; ("melpa" . "http://melpa.milkbox.net/packages/") ;MELPA mirror. Was down 2018-11-28
                         ;; ("melpa" . "https://raw.githubusercontent.com/d12frosted/elpa-mirror/master/melpa/")
                         ;; NOTE: disabled broken or very slow
                         ;; ("marmalade" . "https://marmalade-repo.org/packages/")
                         ))


(setq inhibit-startup-message t)

(scroll-bar-mode -1)
(tool-bar-mode -1)
;(tooltip-mode -1)
;(menu-bar-mode -1)
(set-fringe-mode 10)
;(setq visible-bell t)
(blink-cursor-mode 0)

;(load-theme 'wombat)
;; (load-theme 'doom-solarized-dark-high-contrast)
; (load-theme 'deeper-blue)
; (load-theme 'tango-dark)
(load-theme 'doom-ir-black)
;(set-face-attribute 'default nil :font "Fira Code Retina" :height 100)

; c-x c-e  ||  a-x eval-buffer
;----
;; swiper (fuzzy match over lines in buffer)


;; Initialize package sources
(require 'package)

;;  (setq package-archives '(("melpa" . "https://melpa.org/packages/")
;;  						 ("org" . "https://orgmode.org/elpa/")
;;  						 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
 (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
   (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;(use-package command-log-mode)

; (use-package ivy {{{
;   :diminish
;   :bind (("C-s" . swiper)
;          :map ivy-minibuffer-map
;          ("TAB" . ivy-alt-done)
;          ("C-1" . ivy-alt-done)
;          ("C-j" . ivy-next-line)
;          ("C-k" . ivy-previous-line)
;          :map ivy-switch-buffer-map
;          ("C-k" . ivy-previous-line)
;          ("C-l" . ivy-done)
;          ("C-d" . ivy-switch-buffer-kill)
;          :map ivy-reverse-i-search-map
;          ("C-k" . ivy-previous-line)
;          ("C-d" . ivy-reverse-i-search-kill))
;   :config
;   (ivy-mode 1)) }}}

; https://github.com/emacs-evil/evil (+directions for installing)
;; Download Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))

;; Enable Evil
(require 'evil)
(evil-mode 1)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 10)))
(use-package doom-themes)

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 1))

(use-package lsp-mode
  :ensure t
  :hook (prog-mode . lsp-deferred)
  :custom
  (lsp-completion-provider t)
  (lsp-auto-guess-root t)
  (lsp-keep-workspace-alive nil)
  (lsp-warn-no-matched-clients nil) ;silence warning when loading ‘emacs-lisp-mode’.
  :config
  (lsp-dired-mode 1)  ;TODO: currently doesn’t have any visible in dired buffers
  ;; silence warning when loading ‘emacs-lisp-mode’.
  (add-to-list 'lsp-language-id-configuration '(emacs-lisp-mode . "elisp")))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(global-font-lock-mode t)


;;; Slime ----
; (add-to-list 'load-path "/usr/share/quicklisp")
; (load "/usr/share/quicklisp/quicklisp.lisp")
; 
; (setq inferior-lisp-program "sbcl")
(load (expand-file-name "~/.quicklisp/slime-helper.el"))
;; Replace "sbcl" with the path to your implementation
(setq inferior-lisp-program "sbcl")

; ;; Use the system-wide quicklisp from pacman
; (add-to-list 'load-path "/usr/share/quicklisp")
; (load "/usr/share/quicklisp/quicklisp.lisp")
; 
; ;; Configure SLIME
; (require 'quicklisp-slime-helper)
; (quicklisp-slime-setup)
; (setq slime-lisp-implementations
;       '((sbcl ("sbcl"))))
; (setq inferior-lisp-program "sbcl")


;;; ===========================================================================
;;; LilyPond

(when (append-to-load-path (elsub "lilypond"))
  (load-file (file-name-concat (elsub "lilypond") "lilypond-init.el"))
  (require 'lilypond-mode))

(use-package flycheck-lilypond
  :ensure t
  :defer t
  :config
  (add-hook 'LilyPond-mode-hook 'flycheck-mode)
  (eval-after-load 'flycheck '(require 'flycheck-lilypond)))

;(use-package ivy-rich
;  :init

; (autoload 'iimage-mode "iimage" "Support Inline image minor mode." t)
; (autoload 'turn-on-iimage-mode "iimage" "Turn on Inline image minor mode." t)

(global-set-key [(f6)] 'first-error)
(global-set-key [(f7)] 'previous-error)
(global-set-key [(f8)] 'next-error)
(global-set-key [(f11)] 'compile)
(global-set-key [(control f11)] 'recompile)

;;; Eclipse Style bindings
(global-set-key [(control meta ?,)] 'previous-error)
(global-set-key [(control meta ?.)] 'next-error)


; (unless (package-installed-p 'evil)
;   (package-install 'evil))
; 
; ;; Enable Evil
; (require 'evil)


(unless (package-installed-p 'csound-mode)
  (package-install 'csound-mode))

;;; Csound Mode Configuration
(use-package csound-mode
:ensure t
:mode (("\\.orc\\'" . csound-mode)
       ("\\.sco\\'" . csound-mode)
       ("\\.csd\\'" . csound-mode)
       ("\\.udo\\'" . csound-mode))
:config
;; You can add specific configurations for csound-mode here if needed
)


; (unless (package-installed-p 'scel)
;   (package-install 'scel))

; (unless (package-installed-p 'sclang)
;   (package-install 'sclang))
; (require 'sclang)

; ;; Bootstrap straight.el
; (defvar bootstrap-version)
; (let ((bootstrap-file
;        (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
;       (bootstrap-version 5))
;   (unless (file-exists-p bootstrap-file)
;     (with-current-buffer
;         (url-retrieve-synchronously
;          "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el")
;       (goto-char (point-max))
;       (eval-buffer)))
;   (load bootstrap-file nil 'nomessage))
; 
; ;; Now continue with your package configurations
; (straight-use-package 'use-package)
; 
; (use-package scel
;   :straight '(scel :host github :repo "supercollider/scel")
;   :config
;   ;; Adjust these paths to match your system's SuperCollider installation
;   (setq sc-sc-ide-path "/path/to/your/sclang/executable")
;   (setq sc-sclang-program "sclang")
;   (add-hook 'sc-mode-hook #'sclang-mode))

;; Paste path from above, appending "/scel/el"
; (add-to-list 'load-path "/Users/<username>/Library/Application Support/SuperCollider/downloaded-quarks/scel/el")
(add-to-list 'load-path "/home/bluelegend/.local/share/SuperCollider/downloaded-quarks/scel/el")
(require 'sclang)

;; Load and configure the SuperCollider package
(require 'sclang)
(require 'sclang-mode)

;; Add a hook to start sclang whenever you open a SuperCollider file
(add-hook 'sc-mode-hook
          (lambda ()
            (sclang-mode-setup)
            (sclang-mode-hook)))

(setq sc-sclang-program "sclang")

; ;; Optional: Set the path to your sclang executable if it's not in your system's PATH
; (setq sc-sc-ide-path "sclang") ;; or replace with the full path, e.g., "/usr/bin/sclang"

; (use-package scel
;   :ensure t
;   :config
;   ;; Adjust these paths to match your system's SuperCollider installation
;   (setq sc-sc-ide-path "/usr/bin/sclang")
;   (setq sc-sclang-program "sclang")
;   ;; The following hook automatically starts sclang when you open a SuperCollider file
;   (add-hook 'sc-mode-hook #'sclang-mode))

; (unless (package-installed-p 'supercollider)
;   (package-refresh-contents)
;   (package-install 'supercollider))
; 
; (use-package supercollider
;   :ensure t
;   :config
;   (setq sc-sc-ide-path "/usr/bin/sclang")
;   (setq sc-sclang-program "sclang") ; Use "sclang" if it's in your PATH
;   (setq sc-sclang-default-options '("-D" "-u" "64000")) ; Example options
; ; (setq sc-post-path "/path/to/your/sc_post") ; Optional: for post-processing
;   (add-hook 'sc-mode-hook
;             (lambda ()
;               (supercollider-server-autoboot))))

; ;;; SuperCollider Mode Configuration
; (use-package scel
; :ensure t
; :mode "\\.scd\\'"
; :config
; ;; You might need to configure the sclang path or other scel settings here
; ;; Example (adjust the path if necessary):
; ;; (setq scel-sclang-program "/Applications/SuperCollider.app/Contents/Resources/sclang")
; )

;;; Optional: LSP Mode for SuperCollider (if available and desired)
;; (use-package lsp-mode
;;   :ensure t
;;   :hook (supercollider-mode . lsp-deferred)
;;   :config
;;   (setq lsp-ui-sideline-enable t)
;;   (setq lsp-ui-doc-enable t))

;; (use-package supercollider-mode
;;   :ensure t
;;   :mode "\\.scd\\'"
;;   :hook (supercollider-mode . (lambda ()
;;                                 (when (require 'lsp-mode nil t)
;;                                   (lsp-deferred))))
;;   :config
;;   ;; Any supercollider-mode specific configurations
;;   )

;; Add any other general Emacs-configurations below this line


;;; Clojure
;; Load use-package if it's not already loaded
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Clojure mode and its dependencies
(use-package clojure-mode
  :ensure t)

(use-package cider
  :ensure t
  :hook (clojure-mode . cider-mode)
  :bind (:map cider-mode-map
              ("C-c C-c" . cider-eval-last-sexp)
              ("C-c C-e" . cider-eval-last-sexp-and-replace)))

(use-package paredit
  :ensure t
  :init
  (add-hook 'clojure-mode-hook #'paredit-mode)
  (add-hook 'cider-repl-mode-hook #'paredit-mode))

;; LSP support
(use-package lsp-mode
  :ensure t
  :init (add-hook 'clojure-mode-hook 'lsp-deferred))

(use-package lsp-ui
  :ensure t
  :hook (lsp-mode . lsp-ui-mode))

;; Suppress native compiler warnings (optional but recommended)
(setq native-comp-async-report-warnings-errors '((not (comp-warn-missing-vars (not t)))))

;;
(add-to-list 'auto-mode-alist '("\\.clj\\'" . clojure-mode))


(defun next-theme ()
  "Load the next theme from the custom-enabled-themes list."
  (interactive)
  (let* ((themes (custom-available-themes))
         (current-theme (car (custom-enabled-themes)))
         (current-index (cl-position current-theme themes :test 'eq)))
    (if current-theme
        ;; Disable current theme to see changes
        (disable-theme current-theme))
    (let ((next-theme (nth (mod (1+ current-index) (length themes)) themes)))
      (load-theme next-theme t))))

(global-set-key (kbd "<C-f7>") 'next-theme)
; (global-set-key (kbd "C-F8") 'next-theme)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff"
    "#eeeeec"])
 '(custom-safe-themes
   '("7de64ff2bb2f94d7679a7e9019e23c3bf1a6a04ba54341c36e7cf2d2e56e2bcc"
     "02d422e5b99f54bd4516d4157060b874d14552fe613ea7047c4a5cfa1288cf4f"
     "32f22d075269daabc5e661299ca9a08716aa8cda7e85310b9625c434041916af"
     "6963de2ec3f8313bb95505f96bf0cf2025e7b07cefdb93e3d2e348720d401425"
     "f4d1b183465f2d29b7a2e9dbe87ccc20598e79738e5d29fc52ec8fb8c576fcfd"
     "ff24d14f5f7d355f47d53fd016565ed128bf3af30eb7ce8cae307ee4fe7f3fd0"
     "f1e8339b04aef8f145dd4782d03499d9d716fdc0361319411ac2efc603249326"
     "13096a9a6e75c7330c1bc500f30a8f4407bd618431c94aeab55c9855731a95e1"
     "aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8"
     "7ec8fd456c0c117c99e3a3b16aaf09ed3fb91879f6601b1ea0eeaee9c6def5d9"
     "3f24dd8f542f4aa8186a41d5770eb383f446d7228cd7a3413b9f5e0ec0d5f3c0"
     "22a0d47fe2e6159e2f15449fcb90bbf2fe1940b185ff143995cc604ead1ea171"
     "9b54ba84f245a59af31f90bc78ed1240fca2f5a93f667ed54bbf6c6d71f664ac"
     "f6665ce2f7f56c5ed5d91ed5e7f6acb66ce44d0ef4acfaa3a42c7cfe9e9a9013"
     default))
 '(exwm-floating-border-color "#011417")
 '(fci-rule-color "#62787f")
 '(highlight-tail-colors
   ((("#0e332f" "#0e332f" "green") . 0)
    (("#06343d" "#06343d" "brightcyan") . 20)))
 '(jdee-db-active-breakpoint-face-colors (cons "#01323d" "#3c98e0"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#01323d" "#93a61a"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#01323d" "#56697A"))
 '(objed-cursor-color "#ec423a")
 '(package-selected-packages nil)
 '(pdf-view-midnight-colors (cons "#8d9fa1" "#002732"))
 '(rustic-ansi-faces
   ["#002732" "#ec423a" "#93a61a" "#c49619" "#3c98e0" "#e2468f" "#3cafa5"
    "#8d9fa1"])
 '(vc-annotate-background "#002732")
 '(vc-annotate-color-map
   (list (cons 20 "#93a61a") (cons 40 "#a3a019") (cons 60 "#b39b19")
	 (cons 80 "#c49619") (cons 100 "#cb811c") (cons 120 "#d36c1f")
	 (cons 140 "#db5823") (cons 160 "#dd5247")
	 (cons 180 "#df4c6b") (cons 200 "#e2468f")
	 (cons 220 "#e54472") (cons 240 "#e84356")
	 (cons 260 "#ec423a") (cons 280 "#c64b4a")
	 (cons 300 "#a1555a") (cons 320 "#7b5f6a")
	 (cons 340 "#62787f") (cons 360 "#62787f")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Global settings for a clean UI
(server-start)
; (setq inhibit-startup-message t)
; (scroll-bar-mode -1)
; (set-fringe-mode 10)
(blink-cursor-mode 0)

;; Set up package repositories
(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Use use-package for managing all packages
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; Theme and modeline
(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 10)))
(use-package doom-themes)
(load-theme 'tango-dark)

;; General-purpose packages
(use-package evil
  :init (evil-mode 1))
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))
(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 1))
(use-package flycheck
  :init (global-flycheck-mode))
(global-font-lock-mode t)

;; LSP support
(use-package lsp-mode
  :hook (prog-mode . lsp-deferred)
  :custom
  (lsp-completion-provider t)
  (lsp-auto-guess-root t)
  (lsp-keep-workspace-alive nil)
  (lsp-warn-no-matched-clients nil)
  :config
  (lsp-dired-mode 1)
  (add-to-list 'lsp-language-id-configuration '(emacs-lisp-mode . "elisp")))
(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode))

;; Keybindings
(global-set-key (kbd "<f6>") 'first-error)
(global-set-key (kbd "<f7>") 'previous-error)
(global-set-key (kbd "<f8>") 'next-error)
(global-set-key (kbd "<f11>") 'compile)
(global-set-key (kbd "C-<f11>") 'recompile)
(global-set-key (kbd "C-M-,") 'previous-error)
(global-set-key (kbd "C-M-.") 'next-error)
(global-set-key (kbd "C-<f7>") 'next-theme)

;; Language-specific configurations
(use-package csound-mode
  :mode (("\\.orc\\'" . csound-mode)
         ("\\.sco\\'" . csound-mode)
         ("\\.csd\\'" . csound-mode)
         ("\\.udo\\'" . csound-mode)))

(add-to-list 'load-path "/home/bluelegend/.local/share/SuperCollider/downloaded-quarks/scel/el")
(use-package sclang
  :config
  (setq sc-sclang-program "sclang")
  :hook (sc-mode-hook . (lambda ()
                          (sclang-mode-setup)
                          (sclang-mode-hook))))

(use-package clojure-mode)
(use-package cider
  :hook (clojure-mode . cider-mode)
  :bind (:map cider-mode-map
              ("C-c C-c" . cider-eval-last-sexp)
              ("C-c C-e" . cider-eval-last-sexp-and-replace)))
(use-package paredit
  :hook ((clojure-mode . paredit-mode)
         (cider-repl-mode . paredit-mode)))

;; Helper function to cycle themes
(defun next-theme ()
  "Load the next theme from the custom-available-themes list."
  (interactive)
  (let* ((themes (custom-available-themes))
         (current-theme (car (custom-enabled-themes)))
         (current-index (cl-position current-theme themes :test 'eq)))
    (if current-theme
        (disable-theme current-theme))
    (let ((next-theme (nth (mod (1+ current-index) (length themes)) themes)))
      (load-theme next-theme t))))

;; Suppress native compiler warnings
(setq native-comp-async-report-warnings-errors '((not (comp-warn-missing-vars (not t)))))

(add-to-list 'auto-mode-alist '("\\.clj\\'" . clojure-mode))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

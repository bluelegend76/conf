; ;;; init.el --- The Black Tower Core
; (setq inhibit-startup-screen t
;       inhibit-startup-message t
;       initial-scratch-message nil
;       initial-major-mode 'fundamental-mode)
; 
; (scroll-bar-mode -1)
; (tool-bar-mode -1)
; (menu-bar-mode -1) ;; This kills that gray bar!
; (blink-cursor-mode 0)
; 
; (require 'evil)
; (setq evil-want-keybinding nil)
; (evil-mode 1)
; 
; (require 'doom-themes)
; (load-theme 'doom-ir-black t)
; 
; (require 'which-key)
; (which-key-mode)
; 
; (require 'general)
; (general-define-key
;   :states '(normal insert visual emacs)
;   :prefix ","
;   "f" 'find-file
;   "bb" 'switch-to-buffer)
; 
; (message "--- THE TOWER HAS RISEN ---")

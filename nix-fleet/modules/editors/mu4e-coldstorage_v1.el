        ;;; mu4e-coldstorage.el {{{
        ;;; --- Archive-and-delete workflow for mu4e cold storage

        ;; Usage:
        ;;   1. In the mu4e headers-view, select one message (point on it) or a
        ;;      region of several (Evil visual state: V then j/k to extend).
        ;;   2. Press A.
        ;;   3. At the minibuffer-prompt, accept the default cold-storage root,
        ;;      or type/tab-complete a subdirectory (e.g. add "2026/junk" etc).
        ;;   4. Press Enter. The raw .eml-files are copied immediately into
        ;;      <chosen-dir>/cur/ (with cur/new/tmp created if needed).
        ;;   5. The same messages are then marked for delete (like pressing D),
        ;;      visible as a normal pending mark you can still 'u'nmark.
        ;;   6. Review as usual, then x + your normal sync to finish removal
        ;;      from the local Maildir and (via mbsync Expunge/Remove Both)
        ;;      from Gmail.

        (defvar my/mu4e-coldstorage-root "~/Empire/store/messages/mail/"
          "Default root directory suggested when archiving mu4e messages to cold storage.")

        (defun my/mu4e--headers-collect-messages ()
          "Return a list of (POINT . MSG) for the active region, or just the message at point."
          (let (msgs)
            (if (use-region-p)
                (let ((end (region-end)))
                  (save-excursion
                    (goto-char (region-beginning))
                    (while (< (point) end)
                      (when-let ((msg (mu4e-message-at-point t)))
                        (push (cons (point) msg) msgs))
                      (forward-line 1))))
              (when-let ((msg (mu4e-message-at-point)))
                (push (cons (point) msg) msgs)))
            (nreverse msgs)))

        (defun my/mu4e-archive-and-delete ()
          "Copy selected/region message(s) to a chosen cold-storage Maildir, then mark for delete."
          (interactive)
          (let* ((entries (my/mu4e--headers-collect-messages))
                 (target (directory-file-name
                          (expand-file-name
                           (read-directory-name "Cold storage folder: "
                                                 my/mu4e-coldstorage-root
                                                 my/mu4e-coldstorage-root))))
                 (curdir (expand-file-name "cur" target))
                 (newdir (expand-file-name "new" target))
                 (tmpdir (expand-file-name "tmp" target)))
            (dolist (d (list target curdir newdir tmpdir))
              (unless (file-directory-p d) (make-directory d t)))
            (dolist (entry entries)
              (let* ((pos (car entry))
                     (msg (cdr entry))
                     (src (mu4e-message-field msg :path))
                     (dst (expand-file-name (file-name-nondirectory src) curdir)))
                (copy-file src dst t)
                (save-excursion
                  (goto-char pos)
                  (mu4e-mark-set 'delete))))
            (message "Archived %d message(s) to %s and marked for delete."
                     (length entries) curdir)))

        ;; Evil/general.el-aware binding: plain define-key on mu4e-headers-mode-map
        ;; is likely to be shadowed by evil-collection's own normal-state keymap,
        ;; so bind explicitly for both normal and visual state. "A" is used
        ;; instead of "c", since evil-collection's mu4e integration already uses
        ;; "c" as the compose-message prefix (cc/ce/cf).
        (general-define-key
         :states '(normal visual)
         :keymaps 'mu4e-headers-mode-map
         :prefix ","
         "ma" #'my/mu4e-archive-and-delete)

        (provide 'mu4e-coldstorage)
        ;;; mu4e-coldstorage.el ends here }}}

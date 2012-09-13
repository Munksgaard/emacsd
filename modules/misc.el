;; Highlight matching parentheses when the point is on them.
(show-paren-mode 1)

(set-default 'indent-tabs-mode nil)
(set-default 'indicate-empty-lines t)
(set-default 'imenu-auto-rescan t)

;; disable toolbar
(tool-bar-mode -1)

;; disable menu
(menu-bar-mode -1)

;; move the scrollbar to the right side
(set-scroll-bar-mode 'right)
(scroll-bar-mode -1)

;; line numbers
(line-number-mode t)

;; column numbers
(column-number-mode t)

;; highlight current line
(global-hl-line-mode t)
 
;; size indication
(size-indication-mode t)

;; disable startup screen
(setq inhibit-startup-screen t)

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

;; delete the selection with a keypress
(delete-selection-mode t)

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; use shift + arrow keys to switch between visible buffers
(require 'windmove)
(windmove-default-keybindings)

;; auto-completion in minbuffer
(icomplete-mode +1)

(require 'midnight)

;; make emacs use the clipboard
(setq x-select-enable-clipboard t)

;; Zone mode, because it's fun
(require 'zone)
(zone-when-idle 60)

;; store all backup and autosave files in an autosave dir
(defvar tmpfile-dir (concat emacsd-dir "tmpfiles"))
(unless (file-exists-p tmpfile-dir)
  (make-directory tmpfile-dir))

;; (setq backup-directory-alist
;;       `((".*" . ,tmpfile-dir)))
;; (setq auto-save-file-name-transforms
;;       `((".*" ,tmpfile-dir t)))

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

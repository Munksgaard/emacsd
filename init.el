(defvar custom-packages
  '(magit magithub melpa gist volatile-highlights haskell-mode paredit solarized-theme)
  "A list of packages to ensure are installed at launch.")

(message "Loading emacs configuration" (file-name-directory load-file-name))

(require 'cl)
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(defvar emacsd-dir (file-name-directory load-file-name))

(defvar modules-dir (concat emacsd-dir "modules"))
(unless (file-exists-p modules-dir)
  (make-directory modules-dir))

(defvar savefile-dir (concat emacsd-dir "savefiles/"))
(unless (file-exists-p savefile-dir)
  (make-directory savefile-dir))

(add-to-list 'load-path "~/.emacs.d/lisp/")

(defun packages-installed-p ()
  (loop for p in custom-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(defun install-packages ()
  (unless (packages-installed-p)
    ;; check for new packages (package versions)
    (message "%s" "Emacs is now refreshing its package database...")
    (package-refresh-contents)
    (message "%s" " done.")
    ;; install the missing packages
    (dolist (p custom-packages)
      (unless (package-installed-p p)
        (package-install p)))))

(install-packages)

(defun load-directory (dir)
  (mapcar '(lambda (x)
             (load-file x))
          (directory-files dir t "\\.el$")))

;; load the personal settings (this includes `custom-file')
(when (file-exists-p modules-dir)
  (mapc 'load (directory-files modules-dir 't "^[^#].*el$")))


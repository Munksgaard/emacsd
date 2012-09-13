(defun load-directory (dir)
  (mapcar '(lambda (x)
             (load-file x))
          (directory-files dir t "\\.el$")))

;;(load-directory "~/.emacs.d/modules/ghc-mod/")


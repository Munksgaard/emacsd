(require 'sml-mode)

(setq auto-mode-alist (cons '("\\.sml$" . sml-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.sig$" . sml-mode) auto-mode-alist))
(add-hook 'sml-mode-hook
          (lambda() ;;; *** SML-mode Customization
            (setq sml-program-name "mosml")
            (setq sml-default-arg "-P full")
            (setq sml-indent-level 4) ; conserve on horizontal space
            (setq words-include-escape t) ; \ loses word break status
            (setq indent-tabs-mode nil) ; never ever indent with tabs
            (define-key sml-mode-map (kbd "C-c s") 
              'comment-or-uncomment-region))) ; comments

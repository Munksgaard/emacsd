;; Font size
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

;; Cycle windows with C-tab and C-S-tab
(global-set-key [C-tab] 'other-window)
(global-set-key [C-S-iso-lefttab] (lambda () (interactive) (other-window -1)))

;; Set up buffer-move
(global-set-key (kbd "<C-M-up>")     'buf-move-up)
(global-set-key (kbd "<C-M-down>")   'buf-move-down)
(global-set-key (kbd "<C-M-left>")   'buf-move-left)
(global-set-key (kbd "<C-M-right>")  'buf-move-right)

;; Set up tiling
(global-set-key (kbd "C-`") 'tiling-cycle)

(define-key global-map (kbd "C-S-<up>") 'tiling-tile-up)
(define-key global-map (kbd "C-S-<down>") 'tiling-tile-down)
(define-key global-map (kbd "C-S-<right>") 'tiling-tile-right)
(define-key global-map (kbd "C-S-<left>") 'tiling-tile-left)

(global-set-key (kbd "C-<") 'shrink-window-horizontally)
(global-set-key (kbd "C->") 'enlarge-window-horizontally)
(global-set-key (kbd "C-,") 'shrink-window)
(global-set-key (kbd "C-.") 'enlarge-window)

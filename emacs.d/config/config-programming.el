(require 'multiple-cursors)
(require 'smartparens)

;; Do not highlight paren area
(setq sp-highlight-pair-overlay nil)
(setq sp-highlight-wrap-overlay nil)
(setq sp-highlight-wrap-tag-overlay nil)

;; 1 Tab = 4 Spaces
(setq tab-width 4
      indent-tabs-mode nil)

;; Multiple Cursors
(global-set-key (kbd "C-c m e") 'mc/edit-lines)
(global-set-key (kbd "C-c m n") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c m p") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c m a") 'mc/mark-all-like-this)

(provide 'config-programming)

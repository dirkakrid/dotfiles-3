;; Misc
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-c C-k") 'compile)

;; Undo
(global-set-key (kbd "C-z") 'undo)

(global-set-key [home] 'beginning-of-line)
(global-set-key [end] 'end-of-line)

(provide 'config-keybindings)

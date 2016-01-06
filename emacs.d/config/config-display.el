(require 'cl)
(require 'idle-highlight-mode)

(setq-default truncate-lines t)
(setq visible-bell nil)
(transient-mark-mode 1)
(show-paren-mode 1)
(idle-highlight-mode 1)
(column-number-mode 1)

(setq use-dialog-box nil
      visible-bell t
      echo-keystrokes 0.1
      truncate-partial-width-windows nil
      gnuserv-frame (car (frame-list)))

(global-hl-line-mode t)

(setq inhibit-splash-screen t
      initial-scratch-message nil
      initial-major-mode 'org-mode)

(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)

;; Linum-Mode
(setq linum-format " %3d ")
(global-linum-mode)

;; Scroll line-by-line
(setq scroll-margin 1
      scroll-conservatively 0
      scroll-up-aggressively 0.01
      scroll-down-aggressively 0.01)

;; Box Cursor
(setq default-cursor-type 'box)

;; Powerline
(powerline-vim-theme)

;; Smartparens faces
;; - disable pair overlay for readability
(setq sp-highlight-pair-overlay nil)

(provide 'config-display)

;; Use bin/bash as default shell for Emacs
(setq shell-file-name "/usr/bin/bash")

;; Delete selection with a keypress
(delete-selection-mode t)

;; Revert buffers automatically when files are changed
(global-auto-revert-mode t)

;; Enable y/n instead of yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; 'gc-cons-threshold'
;; I have a modern machine ;)
(setq gc-cons-threshold 20000000)

;; Faster Keystrokes, No dialog boxes and no whistling
(setq echo-keystrokes 0.1)

;; No dialog boxes
(setq use-dialog-box nil)

;; No bells and whistles ;)
(setq visible-bell t)
(setq ring-bell-function 'ignore)

;; No backups; Hide autosaves
(setq delete-old-versions t)
(setq make-backup-files nil)
(setq create-lockfiles nil)
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(provide 'config-system)

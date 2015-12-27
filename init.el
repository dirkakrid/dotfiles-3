;; Use Proxy
;; ------------
;;(setq url-proxy-services
;;      '(("no_proxy" . "^\\(localhost\\|10.*\\)")
;;        ("http" .  "192.168.3.10:3128")
;;        ("https" . "192.168.3.10:3128")))
;; Authentication
;;(setq url-http-proxy-basic-auth-storage
;;      (list (list "192.168.3.10:3128"
;;                  (cons "Authentication "
;;                        (base64-encode-string "USERNAME:PASSWORD")))))


(setq user-full-name "Kumar Utkarsh")
(setq user-mail-address "kumarutkarsh.ingen@gmail.com")

(load "package")
(package-initialize)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)


(setq inhibit-splash-screen t
      initial-scratch-message nil
      initial-major-mode 'org-mode)

(setq-default frame-title-format "%b - (%f) - GNU Emacs")

(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

(global-linum-mode 1)
(setq linum-format "%4d  ")

;; ErgoEmacs - modern conventions
(cua-mode 1)
(show-paren-mode t)
(setq show-paren-style 'expression)
(column-number-mode 1)
(setq auto-save-default nil)
(setq line-move-visual nil)
(global-visual-line-mode 1)

;; Set default font
(set-face-attribute 'default nil
                    :family "Roboto Mono"
                    :height 100
                    :weight 'normal
                    :width 'normal)

(load-theme 'molokai t)

(delete-selection-mode t)
(transient-mark-mode t)
(setq x-select-enable-clipboard t)
(global-hl-line-mode +1)

(setq-default indicate-empty-lines t)
(when (not indicate-empty-lines)
  (toggle-indicate-empty-lines))

(setq tab-width 4
      indent-tabs-mode nil)


(setq make-backup-files nil)

(defalias 'yes-or-no-p 'y-or-n-p)

(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-c C-k") 'compile)

(setq echo-keystrokes 0.1
      use-dialog-box nil
      visible-bell t)


;; Helm M-x
(global-set-key (kbd "M-x") 'helm-M-x)


(defun untabify-buffer ()
  (interactive)
  (untabify (point-min) (point-max)))

(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun cleanup-buffer ()
  "Perform a bunch of operations on the whitespace content of a buffer."
  (interactive)
  (indent-buffer)
  (untabify-buffer)
  (delete-trailing-whitespace))

(defun cleanup-region (beg end)
  "Remove tmux artifacts from region."
  (interactive "r")
  (dolist (re '("\\\\│\·*\n" "\W*│\·*"))
    (replace-regexp re "" nil beg end)))

(global-set-key (kbd "C-x M-t") 'cleanup-region)
(global-set-key (kbd "C-c n") 'cleanup-buffer)

(setq-default show-trailing-whitespace t)


;; Autopair Parentheses
(require 'autopair)
(autopair-global-mode 1)
(setq autopair-autowrap t)


;; Fix Annoying Key Combinations
(global-set-key (kbd "C-z") 'undo)
(global-set-key [home] 'beginning-of-line)
(global-set-key [end] 'end-of-line)

;; NeoTree
(global-set-key [f8] 'neotree-toggle)
(setq neo-theme 'ascii)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(neo-banner-face ((t :inherit shadow)))
 '(neo-button-face ((t :inherit dired-directory)))
 '(neo-dir-link-face ((t :inherit dired-directory)))
 '(neo-expand-btn-face ((t :inherit button)))
 '(neo-file-link-face ((t :inherit default)))
 '(neo-header-face ((t :inherit shadow)))
 '(neo-root-dir-face ((t :inherit link-visited :underline nil))))

;; Ido
(ido-mode t)
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-auto-merge-work-directories-length nil
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-use-virtual-buffers t
      ido-handle-duplicate-virtual-buffers 2
      ido-max-prospects 10)


;; ==============================================================
;; C/C++ and CEDET
;; ==============================================================
(require 'cc-mode)
(setq-default c-basic-offset 4 c-default-style "linux")
(setq-default tab-width 4 indent-tabs-mode nil)
(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)

(yas-global-mode 1)

;; Semantic Mode
(require 'semantic/analyze)
(provide 'semantic-analyze)
(provide 'semantic-ctxt)
(provide 'semanticdb)
(provide 'semanticdb-find)
(provide 'semanticdb-mode)
(provide 'semantic-load)
(provide 'semantic-ia)
(semantic-mode 1)


;; Auto-Complete
(add-to-list 'load-path "~/.emacs.d")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")

(require 'auto-complete-clang)

(setq ac-auto-start nil)
(setq ac-quick-help-delay 0.5)
(ac-flyspell-workaround)
(ac-set-trigger-key "TAB")
;;(define-key ac-mode-map  [(control tab)] 'auto-complete)
(defun my-ac-config ()
  (setq-default ac-sources '(ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers))
  (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
  (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
  (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)
  (add-hook 'css-mode-hook 'ac-css-mode-setup)
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  (global-auto-complete-mode t))
(defun my-ac-cc-mode-setup ()
  (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources)))
(add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)
;; ac-source-gtags
(my-ac-config)

;; echo "" | g++ -v -x c++ -E -
(setq ac-clang-flags
      (mapcar (lambda (item)(concat "-I" item))
              (split-string
               "
/usr/lib/gcc/x86_64-unknown-linux-gnu/5.2.0/../../../../include/c++/5.2.0
/usr/lib/gcc/x86_64-unknown-linux-gnu/5.2.0/../../../../include/c++/5.2.0/x86_64-unknown-linux-gnu
/usr/lib/gcc/x86_64-unknown-linux-gnu/5.2.0/../../../../include/c++/5.2.0/backward
/usr/lib/gcc/x86_64-unknown-linux-gnu/5.2.0/include
/usr/local/include
/usr/lib/gcc/x86_64-unknown-linux-gnu/5.2.0/include-fixed
/usr/include
"
               )))


(require 'flymake)
(add-hook 'find-file-hook 'flymake-find-file-hook)

(setq flycheck-display-errors-function t)


(setq
 helm-gtags-ignore-case t
 helm-gtags-auto-update t
 helm-gtags-use-input-at-cursor t
 helm-gtags-pulse-at-cursor t
 helm-gtags-prefix-key "\C-cg"
 helm-gtags-suggested-key-mapping t
 )

(require 'helm-gtags)
;; Enable helm-gtags-mode
(add-hook 'dired-mode-hook 'helm-gtags-mode)
(add-hook 'eshell-mode-hook 'helm-gtags-mode)
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)

(define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
(define-key helm-gtags-mode-map (kbd "C-j") 'helm-gtags-select)
(define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
(define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
(define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
(define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)


(setq scroll-margin 1
      scroll-conservatively 0	
      scroll-up-aggressively 0.01
      scroll-down-aggressively 0.01)
    (setq-default scroll-up-aggressively 0.01
      scroll-down-aggressively 0.01)

(powerline-vim-theme)


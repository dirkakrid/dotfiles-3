(require 'cc-mode)
(setq-default c-basic-offset 4 c-default-style "linux")
(setq-default tab-width 4 indent-tabs-mode nil)
(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)

;; Ya-Snippet
(yas-global-mode 1)

;; Function-Args
(fa-config-default)

;; Irony Mode
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)
;; replace the 'completion-at-point' and 'complete-symbol' bindings in
;; irony-mode's buffers by irony-mode's function
(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))
(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
;; load company-irony
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))
;; load flycheck-irony
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

;; -----------------------------------------------------------------------------------
;; NOTE :
;;     After installation of Irony-Mode, you need to build irony-server manually by
;;     typing M-x irony-install-server RET.
;;     You need to have cmake, jsoncpp and libclang installed in your system.
;; -----------------------------------------------------------------------------------

(provide 'config-c++)

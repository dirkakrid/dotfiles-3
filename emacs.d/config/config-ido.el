(ido-mode 1)
(ido-everywhere 1)
(ido-vertical-mode 1)

(setq ido-vertical-show-count nil)
(setq ido-auto-merge-work-directories-length -1)

(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-auto-merge-work-directories-length nil
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-use-virtual-buffers t
      ido-handle-duplicate-virtual-buffers 2
      ido-max-prospects 10
      )

(provide 'config-ido)

;;; init.el --- Personal Emacs Configuration of Kumar Utkarsh

;; Copyright © 2014-2016 Kumar Utkarsh
;;
;; Author : Kumar Utkarsh <kumarutkarsh.ingen@gmail.com>
;; Maintainer : Kumar Utkarsh <kumarutkarsh.ingen@gmail.com>
;; URL : https://www.github.com/utkrsh/dotfiles

;; This file is not part of GNU Emacs.

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <http://www.gnu.org/licenses/>.

;; -------------------------------------------------------------------------

(setq user-full-name "Kumar Utkarsh")
(setq user-mail-address "kumarutkarsh.ingen@gmail.com")

;; Internet Proxy Configuration
(setq url-proxy-services
      '(("no_proxy" . "^\\(localhost\\|10.*\\)")
        ("http" .  "192.168.3.10:3128")
        ("https" . "192.168.3.10:3128")))

;; Proxy Authentication
(setq url-http-proxy-basic-auth-storage
      (list (list "192.168.3.10:3128"
                  (cons "Authentication "
                        (base64-encode-string "USERNAME:PASSWORD")))))

;; Package Setup
(require 'cl)
(load "package")
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)


;; Define Required Packages
(defvar reqd-packages
  '(
    yasnippet
    function-args
    irony
    company
    company-irony
    flycheck
    flycheck-irony
    idle-highlight-mode
    powerline
    helm
    helm-gtags
    ggtags
    ido-vertical-mode
    multiple-cursors
    smartparens
    ujelly-theme
    )
  )

;; Install Required Packages
(defun install-reqd-packages ()
  (loop for pkg in reqd-packages
        when (not (package-installed-p pkg)) do (return nil)
        finally (return t)))

(unless (install-reqd-packages)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg reqd-packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; Add Multi-file Configuration Directory
(add-to-list 'load-path (expand-file-name "config" user-emacs-directory))

;; Load configuration files
(require 'config-system)
(require 'config-theme_font)
(require 'config-display)
(require 'config-ido)
(require 'config-completion)
;;(require 'config-helm)
(require 'config-programming)
(require 'config-c++)
(require 'config-keybindings)
(require 'config-cleanup)


(provide 'init)

;;; init.el ends here

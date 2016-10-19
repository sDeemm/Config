;;; package --- Sumarry

;;; Commentary:

;;; Code:
;; Added settings directory
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; Add Melpa packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(package-initialize)

;;
;; Settings
;;
(require 'general-settings)
(require 'color-settings)
(require 'line-number-settings)
(require 'neotree-settings)
(require 'yasnippet-settings)
(require 'powerline-settings)

(projectile-global-mode)

(require 'evil)
(evil-mode 1)

(require 'ido)
(ido-mode 1)

(require 'move-lines)
(move-lines-binding)

;; Language specific settings
(require 'js2-mode-settings)
(require 'octave-settings)

;; Company mode
(add-hook 'after-init-hook 'global-company-mode)

;; Company mode hook function
(defun my-company-mode-hook ()
  (add-to-list 'company-backends 'company-tern))

(add-hook 'company-mode-hook 'my-company-mode-hook)

;; Web mode init
(require 'web-mode-settings)
(my-web-mode-init)

;; company web html
(require 'company-web-html)

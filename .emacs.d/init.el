;;; init.el --- init file for emacs

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
(require 'color-settings)
(require 'status-bar-init)
(require 'general-settings)
(require 'line-number-settings)
(require 'neotree-settings)
(require 'yasnippet-settings)

;; Projectile project manager
(projectile-global-mode)

;; Vi emulator layer
(require 'evil)
(evil-mode 1)

;; auto-highlight-symbol init
(global-auto-highlight-symbol-mode 1)

;; Ido mode and ido fuzzy search
(require 'ido-init)

;; Require to be able to move line up and down
(require 'move-lines)
(move-lines-binding)

;; Restclient mode init
(require 'restclient-init)

;; Language specific settings
(require 'js2-mode-settings)
(require 'octave-settings)
(require 'web-mode-settings)

;; CC init
(defun my-c-mode-hook ()
  (setq c-basic-offset 4
	c-set-style "stroustrup"
	indent-tabs-mode nil)
  (auto-fill-mode 1))

(add-hook 'c-mode-hook 'my-c-mode-hook)
(add-hook 'c++-mode-hook 'my-c-mode-hook)

;; Java init
(require 'java-init)

;; Company mode
(require 'company-init)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(gdb-show-main t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

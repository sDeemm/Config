;;; init.el --- init file for emacs

;;; Commentary:

;;; Code:

;; Add emacs lisp files in `load-path' directory
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; Add Melpa packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(package-initialize)

(autoload 'my-install-dep "bootstrap"
  "Install Emacs dependencies with `package.el'" t nil)

(require 'my-emacs-core)
(my-emacs-core-init)
(my-emacs-setup-init)

;; Projectile project manager
(require 'projectile-init)

;; Vi emulator layer
(require 'evil-init)

;; Ido mode and ido fuzzy search
(require 'ido-init)

;; Restclient mode init
(require 'restclient-init)

;; Language specific settings
(require 'js2-mode-settings)
(require 'octave-settings)
(require 'web-mode-settings)
(require 'cc-init)
(require 'java-init)

;; Company mode
(require 'company-init)

;; yasnippet-settings
(require 'yasnippet-settings)

;; OS dependant initialization
(unless (eq system-type 'gnu/linux)
  (message "Windows only initialization")
  (require 'os-windows-init))

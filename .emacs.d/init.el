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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (web-completion-data yasnippet flycheck irony eclim company auto-complete evil winum web-mode use-package sr-speedbar spaceline restclient projectile powerline-evil neotree molokai-theme magit macrostep js2-mode ido-vertical-mode google-this flycheck-irony flx-ido eyebrowse evil-vimish-fold esup cygwin-mount company-web company-tern company-irony-c-headers company-irony company-emacs-eclim cmake-mode auto-highlight-symbol airline-themes ag ac-octave))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

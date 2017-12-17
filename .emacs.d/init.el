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

;; clang-format
(use-package clang-format
  :defer t
  :init
  (setq clang-format-executable "clang-format-3.8")
  (autoload 'clang-format "clang-format" nil t)
  (autoload 'clang-format-buffer "clang-format" nil t))

;; python-mode
(add-hook 'python-mode-hook
  (lambda ()
    (set (make-local-variable 'company-backends) '(company-anaconda :with company-capf))))
(add-hook 'python-mode-hook 'anaconda-mode)

;; OS dependant initialization
(unless (eq system-type 'gnu/linux)
  (message "Windows only initialization")
  (require 'os-windows-init))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(rainbow-delimiters-depth-1-face ((t (:foreground "dark orange"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "deep pink"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "chartreuse"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "deep sky blue"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "yellow"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "orchid"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "spring green"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "sienna1"))))
 '(whitespace-space ((t (:foreground "darkgray")))))

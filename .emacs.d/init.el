;; Emacs Configuration file

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

;; Auto-Complete configs for autocompletion framework
(require 'auto-complete)
(ac-config-default)

;; Add octave-mode to list of Auto-Complete modes
(add-to-list 'ac-modes 'octave-mode)

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

(provide 'neotree-settings)

(provide 'powerline-settings)

;;
;; Modes
;;

(require 'evil)
(evil-mode 1)

(require 'ido)
(ido-mode 1)

(require 'auto-complete)
(ac-config-default)

(require 'js2-mode)
(require 'js2-mode-settings)

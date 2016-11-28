;;; js2-mode-settings --- Initialize Javascript specific packages and settings

;;; Commentary:

;;; Code:
(require 'js2-mode)

;; autoload ternjs
(add-to-list 'load-path "/home/deemm/.emacs.d/tern/emacs/")
(autoload 'tern-mode "tern.el" nil t)

;; .js files will automatically load JS2-mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; Default Javascript hook function
(defun my-js-hook ()
  "Customize js2-mode hook."
  (setq-default js2-basic-offset 4)
  (setq-default indent-tabs-mode nil)
  (tern-mode t))

(add-hook 'js2-mode-hook 'my-js-hook)

;; Global key bindings
(global-set-key (kbd "<f2>") 'tern-find-definition)

(provide 'js2-mode-settings)
;;; js2-mode-settings ends here

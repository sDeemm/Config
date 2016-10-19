(require 'js2-mode)

(add-to-list 'load-path "/home/deemm/.emacs.d/tern/emacs/")
(autoload 'tern-mode "tern.el" nil t)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(setq-default js2-basic-offset 4)

;; Default Javascript hook function
(defun my-js-hook ()
  (setq-default indent-tabs-mode nil)
  (tern-mode t))

(add-hook 'js2-mode-hook 'my-js-hook)

;; Global key bindings
(global-set-key (kbd "<f2>") 'tern-find-definition)

(provide 'js2-mode-settings)

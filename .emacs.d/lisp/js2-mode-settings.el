(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(setq-default js2-basic-offset 4)

(add-hook 'js2-mode-hook
	  (lambda ()
	    (setq-default indent-tabs-mode nil)))

(provide 'js2-mode-settings)

;;; company-init --- Initialize company mode-line

;;; Commentary:

;;; Code:
(use-package company
  :defer t
  :config
  (progn
    (setq company-backends (delete 'company-semantic company-backends)
	  company-idle-delay 0.2)
    (add-to-list 'company-backends 'company-tern)
    (add-to-list 'company-backends 'company-web-html)
    (company-emacs-eclim-setup)))

(add-hook 'my-emacs-setup-hook #'global-company-mode)

(provide 'company-init)
;;; company-init.el ends here

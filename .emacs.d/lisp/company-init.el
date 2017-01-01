;;; company-init --- Initialize company mode-line

;;; Commentary:

;;; Code:
(add-hook 'after-init-hook 'global-company-mode)

;; company config
(with-eval-after-load "company"
  (setq company-backends (delete 'company-semantic company-backends)
	company-idle-delay 0)
  (add-to-list 'company-backends 'company-tern)
  (add-to-list 'company-backends 'company-web-html)
  (company-emacs-eclim-setup))

(provide 'company-init)
;;; company-init.el ends here

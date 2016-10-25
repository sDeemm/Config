;;; company-init --- Initialize comapny mode-line

;;; Commentary:

;;; Code:

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

;; Company mode hook function
(defun my-company-mode-hook ()
  "Company-mode hook function."
  (add-to-list 'company-backends 'company-tern))

(add-hook 'company-mode-hook 'my-company-mode-hook)

(provide 'company-init)
;;; company-init.el ends here

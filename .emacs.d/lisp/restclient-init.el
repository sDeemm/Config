;;; restclient-init --- Initialize restclient major mode

;;; Commentary:

;;; Code:
(add-to-list 'auto-mode-alist '("\\.restclient\\'" . restclient-mode))
(add-to-list 'auto-mode-alist '("\\.http\\'" . restclient-mode))

(provide 'restclient-init)
;;; restclient-init.el ends here

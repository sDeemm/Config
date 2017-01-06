;;; yasnippet-settings --- yasnippet package configuration

;;; Commentary:

;;; Code:

(use-package yasnippet
  :defer 1
  :config
  (yas-reload-all))

(add-hook 'prog-mode-hook #'yas-minor-mode)

(provide 'yasnippet-settings)
;;; yasnippet-settings.el ends here

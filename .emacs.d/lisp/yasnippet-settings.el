;;; yasnippet-settings --- yasnippet package configuration

;;; Commentary:

;;; Code:
(require 'yasnippet)

(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)

(provide 'yasnippet-settings)
;;; yasnippet-settings.el ends here

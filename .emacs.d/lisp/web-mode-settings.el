;;; web-mode-settings --- Summary
;;; Commentary:

;;; Code:
;; Load web-mode on these particular files
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(defun my-web-mode-hook ()
  "Hook for web mode."
  (setq indent-tabs-mode nil))

;; web-mode customization
(with-eval-after-load "web-mode"
  (add-hook 'web-mode-hook 'my-web-mode-hook))

(provide 'web-mode-settings)
;;; web-mode-settings.el ends here

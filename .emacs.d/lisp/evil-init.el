;;; evil-init --- Inialize evil mode

;;; Commentary:

;;; Code:

(defun my-evil-init ()
  "Hook that inialize evil package"
  (use-package evil
    :config
    (evil-mode 1)
    (setq evil-visual-state-cursor '(hbar "orange"))))
(add-hook 'my-emacs-setup-hook #'my-evil-init)

(provide 'evil-init)
;;; evil-init.el ends here

;;; projectile-init --- Initialize projectile

;;; Commentary:

;; Initialize projectile
;;

;;; Usage:

;; require('projectile-init)
;;

;;; Code:

(defun my-projectile-init ()
  (use-package projectile :defer t)
  (projectile-mode 1))
(add-hook 'my-emacs-setup-hook #'my-projectile-init)

(provide 'projectile-init)
;;; projectile-init.el ends here

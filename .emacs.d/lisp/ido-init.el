;;; ido-init --- Initialize IDO package and Fuzzy search

;;; Commentary:

;;; Code:

(defun my-emacs-ido-init ()
  "Initialize ido mode"
  (ido-mode 1)
  (ido-vertical-mode 1)
  (ido-everywhere 1)
  (flx-ido-mode 1)

  ;; disable ido faces to see flx highlights.
  (setq ido-enable-flex-matching t)
  (setq ido-use-faces nil))
(add-hook 'my-emacs-setup-hook #'my-emacs-ido-init)

(provide 'ido-init)
;;; ido-init.el ends here

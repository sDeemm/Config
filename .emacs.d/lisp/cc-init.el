;;; cc-init --- Initialize C/C++ developpement

;;; Commentary:

;; Initialize Emacs for C/C++ developpement
;;

;;; Usage:

;; require('cc-init)
;;

;;; Code:

(use-package cc-mode
  :defer t
  ;; *.h opens as c++ files
  :mode ("\\.h\\'" . c++-mode)

  :preface
  (defun cc-init--hook ()
    "CC Mode hook that initialize syntax and company backends."
    (c-set-style "stroustrup")
    (setq indent-tabs-mode nil)
    (auto-fill-mode 1)
    (rtags-enable-standard-keybindings))

  :config
  (progn
    ;; RTags setup
    (use-package rtags
      :load-path "~/.emacs.d/rtags/"
      :commands rtags-enable-standard-keybindings
      :config
      (setq rtags-autostart-diagnostics t)
      (rtags-diagnostics))

    (use-package flycheck
      :defer t
      :config
      (add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

    (add-hook 'c++-mode-hook #'cc-init--hook)
    (add-hook 'c-mode-hook #'cc-init--hook)

    (add-hook 'c++-mode-hook 'irony-mode)
    (add-hook 'c-mode-hook 'irony-mode)
    (add-hook 'objc-mode-hook 'irony-mode)

    (add-hook 'irony-mode-hook #'irony-cdb-autosetup-compile-options)
    (add-hook 'irony-mode-hook
      (lambda ()
	(set (make-local-variable 'company-backends) '(company-irony-c-headers company-irony))))

    (add-hook 'c++-mode-hook 'flycheck-mode)
    (add-hook 'c-mode-hook 'flycheck-mode)))

(provide 'cc-init)
;;; cc-init.el ends here

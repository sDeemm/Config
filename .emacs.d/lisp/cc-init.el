;;; cc-init --- Initialize C/C++ developpement

;;; Commentary:

;; Initialize emacs for C/C++ developpement
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
  (defun my-c-mode-hook ()
    "CC Mode hook that initialize syntax and company backends."
    (c-set-style "stroustrup")
    (setq indent-tabs-mode nil)
    (auto-fill-mode 1)
    (add-to-list 'company-backends '(company-irony-c-headers company-irony)))

  :config
  (progn
    ;; RTags setup
    (use-package rtags
      :load-path "~/.emacs.d/rtags/"
      :commands rtags-enable-standard-keybindings
      :init
      (rtags-enable-standard-keybindings)
      :config
      (setq rtags-autostart-diagnostics t))

    ;; Initialize syntax and company backends
    (add-hook 'c++-mode-hook #'my-c-mode-hook)
    (add-hook 'c-mode-hook #'my-c-mode-hook)

    ;; Flycheck mode in c/c++ buffers
    (add-hook 'c++-mode-hook #'flycheck-mode)
    (add-hook 'c-mode-hook #'flycheck-mode)

    ;; Irony setup
    (add-hook 'c++-mode-hook #'irony-mode)
    (add-hook 'c-mode-hook #'irony-mode)
    (add-hook 'objc-mode-hook #'irony-mode)))

(use-package irony
  :defer t
  :preface
  ;; replace the `completion-at-point' and `complete-symbol' bindings in
  ;; irony-mode's buffers by irony-mode's function
  (defun my-irony-mode-hook ()
    "Remap completion-at-point and complete-symbol bindings to irony-mode's."
    (define-key irony-mode-map [remap completion-at-point]
      'irony-completion-at-point-async)
    (define-key irony-mode-map [remap complete-symbol]
      'irony-completion-at-point-async))
  :config
  (progn
    (add-hook 'irony-mode-hook #'my-irony-mode-hook)
    (add-hook 'irony-mode-hook #'irony-cdb-autosetup-compile-options)))

;; flycheck irony setup
(use-package flycheck
  :defer t
  :config
  (add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

(provide 'cc-init)
;;; cc-init.el ends here

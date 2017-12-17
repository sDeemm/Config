;;; my-emacs-core --- Core Emacs initialization

;;; Commentary:

;; Initialize the core components of Emacs.

;;; Code:

(defvar my-emacs-setup-hook nil
  "Hook run after `emacs-startup-hook' for more customizations.")

(defun my-remove-gui-elems ()
  "Remove gui elements of Emacs."
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (setq inhibit-splash-screen t))

(defun my-emacs-theme-setup ()
  "Setup my Emacs color theme."
  (load-theme 'molokai t))

(defun my-emacs-nlinum-mode ()
  "Enable nlinum mode."
  (nlinum-mode 1))

(defun my-emacs-winum-mode ()
  "Enable winum mode."
  (use-package winum
    :config
    (setq winum-auto-setup-mode-line nil)
    (winum-mode)))

(defun my-emacs-spaceline-init ()
  "Initialize Emacs spaceline run after `after-init-hook'."
  (use-package spaceline-config
    :commands spaceline-spacemacs-theme
    :config
    (setq powerline-default-separator 'wave)
    (setq powerline-height 25)
    (setq spaceline-separator-dir-left '(left . left))
    (setq spaceline-separator-dir-right '(right . right))
    (setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)
    (setq spaceline-window-numbers-unicode t)
    (spaceline-compile)))

(defun my-emacs-setup-init ()
  "Custom init setup run with `emacs-startup-hook'."
  (add-hook
   'emacs-startup-hook
   (lambda ()
     (run-hooks 'my-emacs-setup-hook))))

(defun my-emacs-core-init ()
  "My Emacs core initialization function."
  (my-remove-gui-elems)
  (my-emacs-theme-setup)
  (my-emacs-spaceline-init)
  (my-emacs-winum-mode)

  ;; Global minor modes for `hl-line', `auto-highlight-symbol' and `eyebrowse'
  (global-hl-line-mode 1)
  (global-auto-highlight-symbol-mode 1)
  (eyebrowse-mode)

  ;; Required to be able to move line up and down
  (use-package move-lines
    :config
    (move-lines-binding))

  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
  (add-hook 'find-file-hook #'my-emacs-nlinum-mode)
  (add-hook 'after-init-hook #'spaceline-spacemacs-theme))

(provide 'my-emacs-core)
;;; my-emacs-core.el ends here

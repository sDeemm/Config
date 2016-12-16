;;; bootstrap --- Install all dependencies

;;; Commentary:

;;; Code:
(defun my-install-dep ()
  "Install all dependencies needed by init.el."
  (interactive)
  (package-refresh-contents)
  (package-install 'company)
  (package-install 'evil)
  (package-install 'powerline-evil)
  (package-install 'ido-vertical-mode)
  (package-install 'airline-themes)
  (package-install 'auto-complete)
  (package-install 'auto-highlight-symbol)
  (package-install 'molokai-theme)
  (package-install 'company-tern)
  (package-install 'company-web)
  (package-install 'evil-vimish-fold)
  (package-install 'magit)
  (package-install 'restclient)
  (package-install 'neotree)
  (package-install 'flycheck)
  (package-install 'flx-ido)
  (package-install 'js2-mode)
  (package-install 'yasnippet)
  (package-install 'web-mode)
  (package-install 'web-completion-data)
  (package-install 'projectile)
  (package-install 'ag)
  (package-install 'ac-octave)
  (package-install 'sr-speedbar))

(provide 'bootstrap)
;;; bootstrap.el ends here

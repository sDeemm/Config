;;; bootstrap --- Install all dependencies

;;; Commentary:

;;; Code:

;;;###autoload
(defun my-install-dep ()
  "Install all dependencies needed by init.el."
  (interactive)
  (package-refresh-contents)
  (package-install 'projectile)
  (package-install 'evil)
  (package-install 'evil-vimish-fold)
  (package-install 'molokai-theme)
  (package-install 'spaceline)
  (package-install 'eyebrowse)
  (package-install 'winum)
  (package-install 'ido-vertical-mode)
  (package-install 'flx-ido)
  (package-install 'auto-complete)
  (package-install 'auto-highlight-symbol)
  (package-install 'company)
  (package-install 'company-tern)
  (package-install 'company-web)
  (package-install 'company-emacs-eclim)
  (package-install 'company-irony)
  (package-install 'company-irony-c-headers)
  (package-install 'cmake-mode)
  (package-install 'eclim)
  (package-install 'magit)
  (package-install 'restclient)
  (package-install 'neotree)
  (package-install 'irony)
  (package-install 'flycheck)
  (package-install 'flycheck-irony)
  (package-install 'js2-mode)
  (package-install 'google-this)
  (package-install 'yasnippet)
  (package-install 'web-mode)
  (package-install 'web-completion-data)
  (package-install 'ag)
  (package-install 'sr-speedbar)
  (package-install 'use-package)
  (package-install 'cygwin-mount)
  (package-install 'esup)
  (package-install 'macrostep))

(provide 'bootstrap)
;;; bootstrap.el ends here

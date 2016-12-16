;;; octave-settings --- Octave configuration

;;; Commentary:

;;; Code:
(autoload 'octave-mode "octave" nil t)
(setq auto-mode-alist
      (cons '("\\.m$" . octave-mode) auto-mode-alist))

(defun my-octave-mode-hook ()
  "Octave major mode hook."
  (setq indent-tabs-mode nil)
  (abbrev-mode 1)
  (auto-fill-mode 1)
  (if (eq window-system 'x)
      (font-lock-mode 1)))

(with-eval-after-load "octave"
  (setq-default octave-block-offset 4)
  (add-hook 'octave-mode-hook 'my-octave-mode-hook))

(provide 'octave-settings)
;;; octave-settings.el ends here

;; Linum-mode
(defun my-linum-mode ()
  (linum-mode 1))

(add-hook 'find-file-hook 'my-linum-mode)

(provide 'line-number-settings)

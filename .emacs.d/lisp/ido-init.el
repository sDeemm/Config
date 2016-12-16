;;; ido-init --- Initialize IDO package and Fuzzy search

;;; Commentary:

;;; Code:
(require 'flx-ido)

(ido-mode 1)
(ido-vertical-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

(provide 'ido-init)
;;; ido-init.el ends here

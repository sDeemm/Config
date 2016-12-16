;;; status-bar-init --- Initalize the status bar

;;; Commentary:

;;; Code:
(require 'airline-themes)
(load-theme 'airline-dark t)

(with-eval-after-load "airline-themes"
  (setq powerline-utf-8-separator-left        #xe0b0
	powerline-utf-8-separator-right       #xe0b2
	airline-utf-glyph-separator-left      #xe0b0
	airline-utf-glyph-separator-right     #xe0b2
	airline-utf-glyph-subseparator-left   #xe0b1
	airline-utf-glyph-subseparator-right  #xe0b3
	airline-utf-glyph-branch              #xe0a0
	airline-utf-glyph-readonly            #xe0a2
	airline-utf-glyph-linenumber          #xe0a1

	airline-eshell-colors nil))

(provide 'status-bar-init)
;;; status-bar-init.el ends here

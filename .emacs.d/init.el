(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(package-initialize)

;; Remove mouse interface
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(require 'evil)
(evil-mode 1)

(require 'ido)
(ido-mode 1)

(require 'auto-complete)
(ac-config-default)

;; Linum-mode
(defun my-linum-mode ()
  (linum-mode 1))

(add-hook 'find-file-hook 'my-linum-mode)

(require 'solarized)
(load-theme 'solarized-dark t nil)

(require 'neotree)
(global-set-key "\C-xt" 'neotree-toggle)

(require 'powerline)
(powerline-vim-theme)

(require 'airline-themes)
(load-theme 'airline-solarized-gui t nil)
(setq powerline-utf-8-separator-left        #xe0b0
      powerline-utf-8-separator-right       #xe0b2
      airline-utf-glyph-separator-left      #xe0b0
      airline-utf-glyph-separator-right     #xe0b2
      airline-utf-glyph-subseparator-left   #xe0b1
      airline-utf-glyph-subseparator-right  #xe0b3
      airline-utf-glyph-branch              #xe0a0
      airline-utf-glyph-readonly            #xe0a2
      airline-utf-glyph-linenumber          #xe0a1)

;; Js2 variables
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(setq-default js2-basic-offset 4)


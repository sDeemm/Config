;; NeoTree a File explorer for Emacs
(require 'neotree)
(global-set-key "\C-xt" 'neotree-toggle)

;; neo-smart-open
(setq neo-smart-open t)

;; Use with evil-mode
(add-hook 'neotree-mode-hook
	  (lambda ()
	    (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
	    (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
	    (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
	    (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))

(provide 'neotree-settings)

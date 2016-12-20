;;; java-init --- Java mode initialization

;;; Commentary:

;;; Code:
(add-hook 'java-mode-hook
	  (lambda ()
	    (eclim-mode 1)))

(with-eval-after-load "eclim"
  (setq eclim-eclipse-dirs '("/opt/eclipse")
	eclim-executable "/opt/eclipse/eclim"))

(autoload 'start-eclimd "eclimd" "Start eclimd." t)
(autoload 'stop-eclimd "eclimd" "Stop eclimd." t)

(provide 'java-init)
;;; java-init.el ends here

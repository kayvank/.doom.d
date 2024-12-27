;;; conf/solidity.el -*- lexical-binding: t; -*-

(use-package! solidity-mode
  :init
  (setq auto-complete-mode t)
  :hook (
         solidity-mode-hook . (lambda ()
	(set (make-local-variable 'company-backends)
		(append '((company-solidity company-capf company-dabbrev-code))
			company-backends)))))

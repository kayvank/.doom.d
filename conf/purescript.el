(use-package! purescript-mode
  :bind(
        ("C-c C-w". purescript-pursuit)
        ))
;; purescript files use camelcase and tend to benefit from subword movement
;; use lsp
;; (add-hook! 'purescript-mode-hook #'subword-mode)
;;   :init
;;   (add-hook 'purescript-mode-hook
;;   (lambda ()
;;     (psc-ide-mode)
;;     (company-mode)
;;     (flycheck-mode)
;;     (turn-on-purescript-indentation)))
;;   :config
;;   (setq psc-ide-use-npm-bin t)

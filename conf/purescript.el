;; purescript files use camelcase and tend to benefit from subword movement
(add-hook! 'purescript-mode-hook #'subword-mode)
;; use lsp
;; (use-package psc-ide
;;   :init
;;   (add-hook 'purescript-mode-hook
;;   (lambda ()
;;     (psc-ide-mode)
;;     (company-mode)
;;     (flycheck-mode)
;;     (turn-on-purescript-indentation)))
;;   :config
;;   (setq psc-ide-use-npm-bin t)
;;   )
(use-package! purescript-mode
  :bind(
        ("C-c w" . purescript-pursuit)
        ;; ("C-c h" . haskell-hoogle-lookup-from-local)
        ;; ("C-c C-f" . haskell-mode-stylish-buffer)
        ;; ("C-c C-o" . ormolu-format-buffer)
        )
  )

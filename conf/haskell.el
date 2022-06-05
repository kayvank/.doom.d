(use-package! ormolu
  ;; :hook (haskell-mode . ormolu-format-on-save-mode)
  :bind
  ("C-c C-f" . haskell-mode-stylish-buffer)
  ("C-c C-o" . ormolu-format-buffer)
  )

(add-hook 'haskell-mode-hook #'(lambda () (eldoc-mode -1)) )

;;TODO: does this stll work?
(setq haskell-auto-insert-module-format-string
      "module %s\n    ( \n    ) where")

(setq haskell-hoogle-port-number 9000)
(setq ormolu-extra-args
      '("--ghc-opt" "-XTypeApplications" "--ghc-opt" "-XBangPatterns"))
(setq-default flycheck-disabled-checkers '(haskell-stack-ghc))
;; the above and below should do the same and are redundent
(add-to-list 'flycheck-disabled-checkers 'haskell-stack-ghc)

(global-set-key (kbd "C-c w") 'haskell-hoogle-lookup-from-website)
(global-set-key (kbd "C-c h") 'haskell-hoogle-lookup-from-local)
(global-set-key [f12] 'lsp-goto-type-definition)
(global-set-key (kbd "S-<f12>") 'lsp-goto-implementation)

(lsp-register-client
    (make-lsp-client :new-connection (lsp-tramp-connection "~/bin/haskell-language-server-wrapper")
                     :major-modes '(haskell-mode)
                     :remote? t
                     :server-id 'haskell-remote))
=

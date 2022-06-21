(use-package! lsp)
(use-package! lsp-mode
  :commands (lsp lsp-ui-mode)
  :config
  (use-package! lsp-ui)
  (use-package! lsp-haskell)
  (use-package! ormolu)
  (setq
   lsp-ui-doc-enable t
   lsp-ui-doc-mode t
   lsp-signature-auto-activate t
   ;; lsp-haskell-server-path "~/bin/haskell-language-server"
   ;; lsp-haskell-server-wrapper-function "~/bin/haskell-language-server-wrapper"
   lsp-haskell-server-args ()
   haskell-auto-insert-module-format-string "module %s\n    ( \n    ) where"
   haskell-hoogle-port-number 8666
   haskell-compile-cabal-build-command "cabal build"
   lsp-log-io t)
  :bind
  ("C-c C-f" . haskell-mode-stylish-buffer)
  ("C-c C-o" . ormolu-format-buffer)
  :hook (
         (haskell-mode . lsp)
         (haskell-literate-mode .lsp)
         (haskell-mode .  (lambda () (eldoc-mode -1)))
       )
  )
(global-set-key (kbd "C-c w") 'haskell-hoogle-lookup-from-website)
(global-set-key (kbd "C-c h") 'haskell-hoogle-lookup-from-local)
(global-set-key [f12] 'lsp-goto-type-definition)
(global-set-key (kbd "S-<f12>") 'lsp-goto-implementation)

(use-package! lsp-haskell)
(use-package! tramp)
(add-to-list 'tramp-remote-path 'tramp-own-remote-path)
(lsp-register-client
    (make-lsp-client :new-connection (lsp-tramp-connection "haskell-language-server-wrapper")
                     :major-modes '(haskell-mode)
                     :activation-fn (lsp-activate-on "haskell")
                     :remote? t
                     :server-id 'haskell-language-server-wrapper))


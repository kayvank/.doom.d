(with-eval-after-load 'company
  (add-to-list 'company-backends 'company-ghci))


(use-package! lsp
  :config
  (add-to-list 'lsp-file-watch-ignored-directories '"[/\\\\]\\dist-newstyle-repl\\'")
  (add-to-list 'lsp-file-watch-ignored-directories '"[/\\\\]\\plutus-playground-client/output\\'")
  (add-to-list 'lsp-file-watch-ignored-directories '"[/\\\\]\\generated\\'")
  (add-to-list 'lsp-file-watch-ignored-directories '"[/\\\\]\\.spago\\'")
  (add-to-list 'lsp-file-watch-ignored-directories '"[/\\\\]\\result\\'")
  (add-to-list 'lsp-file-watch-ignored-files '"[/\\\\]\\result\\'")
  )

(use-package! lsp-mode
  :defer t
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
  :hook (
         (haskell-mode . lsp)
         (haskell-literate-mode .lsp)
         (haskell-mode .  (lambda () (eldoc-mode -1)))
       )
  )
(global-set-key (kbd "C-c w") 'haskell-hoogle-lookup-from-website)
;; (global-set-key (kbd "C-c w") 'haskell-hoogle-lookup-from-website)
;; (global-set-key (kbd "C-c h") 'haskell-hoogle-lookup-from-local)
(add-to-list 'projectile-globally-ignored-directories "dist-newstyle")
(use-package! lsp-haskell)
(use-package! tramp)
(add-to-list 'tramp-remote-path 'tramp-own-remote-path)
(lsp-register-client
    (make-lsp-client :new-connection (lsp-tramp-connection "haskell-language-server-wrapper")
                     :major-modes '(haskell-mode)
                     :activation-fn (lsp-activate-on "haskell")
                     :remote? t
                     :server-id 'haskell-language-server-wrapper))
(use-package! haskell-mode
  :defer t
  :hook (
         (haskell-mode-hook . hindent-mode)
         (haskell-cabbal . hindent-mode)
         ;; (haskell-cabal-mode-hook . line-number-mode)
         (line-number-mode-hook . haskell-cabal-mode)
         (haskell-cabbal-mode . prog-mode)
         (haskell-mode-hook . company-mode)
         )

  :bind(
        ("C-c w". haskell-hoogle-lookup-from-website)
        ("C-c h" . haskell-hoogle-lookup-from-local)
        ("C-c C-f" . haskell-mode-stylish-buffer)
        ("C-c C-o" . ormolu-format-buffer)
        ([f8] . haskell-navigate-imports)
        )
  )

(add-hook 'haskell-cabal-mode (lambda () (local-set-key [f2] 'cabal-fmt)))

(with-eval-after-load 'company
  (add-to-list 'company-backends 'company-ghci))


(global-flycheck-mode)


(global-set-key (kbd "C-c w") 'haskell-hoogle-lookup-from-website)
;; (global-set-key (kbd "C-c w") 'haskell-hoogle-lookup-from-website)
;; (global-set-key (kbd "C-c h") 'haskell-hoogle-lookup-from-local)
(add-to-list 'projectile-globally-ignored-directories "dist-newstyle")




(use-package! haskell-mode
  :defer t
  :config
  (use-package! lsp
    :config
    (add-to-list 'lsp-file-watch-ignored-directories '"[/\\\\]\\dist-newstyle-repl\\'")
    (add-to-list 'lsp-file-watch-ignored-directories '"[/\\\\]\\plutus-playground-client/output\\'")
    (add-to-list 'lsp-file-watch-ignored-directories '"[/\\\\]\\generated\\'")
    (add-to-list 'lsp-file-watch-ignored-directories '"[/\\\\]\\.spago\\'")
    (add-to-list 'lsp-file-watch-ignored-directories '"[/\\\\]\\result\\'")
    (add-to-list 'lsp-file-watch-ignored-files '"[/\\\\]\\result\\'")
    (setq
     lsp-haskell-formatting-provider nil
     lsp-signature-auto-activate t
     ;; lsp-haskell-server-path "~/bin/haskell-language-server"
     ;; lsp-haskell-server-wrapper-function "~/bin/haskell-language-server-wrapper"
     lsp-haskell-server-args ()
     haskell-hoogle-port-number 8666
     haskell-compile-cabal-build-command "cabal build"
     lsp-log-io t))

  (use-package! lsp-mode)
  (use-package! lsp-ui
    :config
    (setq
     lsp-ui-doc-enable t
     lsp-ui-doc-mode t))
  (use-package! lsp-haskell)
  (use-package! lsp-ivy)
  (use-package! hindent
    :config
    (setq
     haskell-indent-offset 2
     haskell-indent-spaces 2))
  (use-package! flycheck
    :hook (flycheck-mode-hook . flycheck-haskell-setup))

  (use-package! company)

  (use-package! tramp
    :defer
    :config
    (add-to-list 'tramp-remote-path 'tramp-own-remote-path)
    (lsp-register-client
     (make-lsp-client :new-connection (lsp-tramp-connection "haskell-language-server-wrapper")
                        :major-modes '(haskell-mode)
                        :activation-fn (lsp-activate-on "haskell")
                        :remote? t
                        :server-id 'haskell-language-server-wrapper)))

  :commands (lsp lsp-ui-mode)

  :hook (
         (haskell-mode-hook . flyspel-prog-mode)
         (haskell-mode-hook . hindent-mode)
         (haskell-cabbal . hindent-mode)
         (haskell-mode-hook . haskell-setup)
         (haskell-mode-hook . company-mode)
         )

  :bind(
        ("C-c w". haskell-hoogle-lookup-from-website)
        ("C-c h" . haskell-hoogle-lookup-from-local)
        ("C-c d"  . hindent-reformat-decl)
        ("C-c r"  . hindent-reformat-refron)
        ("C-c b" . hindent-reformat-buffer)
        ("C-c C-f" . haskell-mode-stylish-buffer)
        ;; ("C-c C-o" . ormolu-format-buffer)
        ([f8] . haskell-navigate-imports)
        )
)

(with-eval-after-load 'company
  (add-to-list 'company-backends 'company-ghci))


;; (global-flycheck-mode)


(global-set-key (kbd "C-c w") 'haskell-hoogle-lookup-from-website)
(global-set-key (kbd "C-c h") 'haskell-hoogle-lookup-from-local)
(add-to-list 'projectile-globally-ignored-directories "dist-newstyle")

(use-package lsp-haskell
  :defer t
  :init
  (add-hook 'haskell-mode-hook
            (lambda ()
              (lsp)
              (setq evil-shift-width 2)))
  (add-hook 'haskell-literate-mode-hook #'lsp)
  :config
  (setq
     lsp-haskell-formatting-provider "stylish-haskell"
   ))

(use-package lsp-mode
  :hook (prog-mode . lsp-mode)
  :init
  ;; (with-eval-after-load 'lsp-mode (evil-leader/set-key "l" lsp-command-map))
  :config
    (add-to-list 'lsp-file-watch-ignored-directories '"[/\\\\]\\dist-newstyle-repl\\'")
    (add-to-list 'lsp-file-watch-ignored-directories '"[/\\\\]\\plutus-playground-client/output\\'")
    (add-to-list 'lsp-file-watch-ignored-directories '"[/\\\\]\\generated\\'")
    (add-to-list 'lsp-file-watch-ignored-directories '"[/\\\\]\\.spago\\'")
    (add-to-list 'lsp-file-watch-ignored-directories '"[/\\\\]\\result\\'")
    (add-to-list 'lsp-file-watch-ignored-files '"[/\\\\]\\result\\'")
  ;; This is to make `lsp-mode' work with `direnv' and pick up the correct
  ;; version of GHC.
  ;; (advice-add 'lsp :before #'direnv-update-environment)
  (setq lsp-modeline-code-actions-enable nil))

(use-package! lsp-ui
  :hook (prog-mode . lsp-ui-mode)
  :config
  ;; (evil-leader/set-key "x m" #'lsp-ui-imenu)
  (setq lsp-ui-doc-position 'bottom))

(use-package! lsp-ivy)

(use-package! hindent
  :config
  (setq
   haskell-indent-offset 2
   haskell-indent-spaces 2))

(use-package! haskell-mode
  :defer t
  :config
  (setq
   haskell-hoogle-port-number 8666)
  :hook (
         (haskell-literate-mode . lsp)
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
        ("C-c C-o" . ormolu-format-buffer)
        ([f8] . haskell-navigate-imports))
  )

(use-package! flycheck
  :hook (flycheck-mode-hook . flycheck-haskell-setup))

(use-package! tramp
  :defer t
  :config
  (add-to-list 'tramp-remote-path 'tramp-own-remote-path)
  (lsp-register-client
   (make-lsp-client :new-connection (lsp-tramp-connection "haskell-language-server-wrapper")
                    :major-modes '(haskell-mode)
                    :activation-fn (lsp-activate-on "haskell")
                    :remote? t
                    :server-id 'haskell-language-server-wrapper)))


(add-to-list 'projectile-globally-ignored-directories "dist-newstyle")
(add-to-list 'projectile-globally-ignored-directories "dist-newstyle-repl")
(add-to-list 'projectile-globally-ignored-directories ".direnv")
(add-to-list 'projectile-globally-ignored-directories "result")
(add-to-list 'projectile-globally-ignored-directories "results")
(add-to-list 'projectile-globally-ignored-directories "results")


(use-package! haskell-mode
  :init
  (add-to-list 'load-path  "~/.doom.d/conf/lisp/hlint/")
  (require 'hs-lint)
  (defun my-haskell-mode-hook ()
    (local-set-key "\C-cl" 'hs-lint))
  :hook (
         (haskell-mode-hook . flyspel-prog-mode)
         (haskell-mode-hook . flycheck-haskell-setup)
         (haskell-mode-hook . haskell-setup)
         (haskell-mode-hook . company-mode)
         (haskell-mode-hook . my-haskell-mode-hook)
         ;; (haskell-cabal-mode-hook . line-number-mode)
         )
  :bind(
        ("C-c w". haskell-hoogle-lookup-from-website)
        ("C-c h" . haskell-hoogle-lookup-from-local)
        ("C-c C-f" . haskell-mode-stylish-buffer)
        ("C-c l" . hs-lint)
        ("M-n" . flymake-goto-next-error)
        ("M-p" . flymake-goto-next-error)
        ([f8] . haskell-navigate-imports)
        )
  )
  (use-package! lsp-haskell
    :config
    (setq
     haskell-indent-offset 2
     haskell-indent-spaces 2))

  (use-package! lsp
    :config
    (add-to-list 'lsp-file-watch-ignored-directories '"[/\\\\]dist-newstyle-repl\\'")
    (add-to-list 'lsp-file-watch-ignored-directories '"[/\\\\]plutus-playground-client/output\\'")
    (add-to-list 'lsp-file-watch-ignored-directories '"[/\\\\]generated\\'")
    (add-to-list 'lsp-file-watch-ignored-directories '"[/\\\\]\\.direnv\\'")
    (add-to-list 'lsp-file-watch-ignored-directories '"[/\\\\]\\.spago\\'")
    (add-to-list 'lsp-file-watch-ignored-directories '"[/\\\\]result\\'")
    (add-to-list 'lsp-file-watch-ignored-directories '"[/\\\\]__std__\\'")
    (add-to-list 'lsp-file-watch-ignored-files '"[/\\\\]result\\'")
    (setq
     lsp-haskell-formatting-provider nil
     ;; lsp-signature-auto-activate t
     haskell-hoogle-port-number 8666
     lsp-log-io nil))
;;
;; lsp optimizations
;;
(setq
 gc-cons-threshold 100000000
 read-process-output-max (* 1024 1024) ;; 1mb
 lsp-idle-delay 0.500
 lsp-log-io nil
 flycheck-nix-linter-executable "nixfmt"
 lsp-headerline-breadcrumb-enable t
 lsp-ui-sideline-show-code-actions t
 lsp-completion-provider :none


 ) ; if set to true can cause a performance hit

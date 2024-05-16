;;; conf/haskell.el -*- lexical-binding: t; -*-


(use-package! haskell-mode
:config
(setq
 haskell-hoogle-port-number 8666
 lsp-haskell-formatting-provider "fourmolu"
 )


:hook (
       (haskell-mode-hook . lsp)
       (haskell-literate-mode . lsp))
:bind(:map haskell-mode-map
           ("C-c C-w". haskell-hoogle-lookup-from-website)
           ("C-c C-h" . haskell-hoogle-lookup-from-local)
           )
)

;;; conf/haskell.el -*- lexical-binding: t; -*-


(use-package! haskell-mode
:config
(setq
 haskell-hoogle-port-number 8666
 lsp-haskell-formatting-provider "fourmolu"
 ;; corfu-mode t
 )


:hook (
       (haskell-mode-hook . lsp)
       (haskell-mode-hook . flymake-cspell)
       (haskell-literate-mode . lsp))

:bind(:map haskell-mode-map
           ("C-c C-w". haskell-hoogle-lookup-from-website)
           ("C-c C-h" . haskell-hoogle-lookup-from-local)
           ("C-c f" . lsp-format-buffer)
           )
)

;;; conf/purescript.el -*- lexical-binding: t; -*-

(use-package! purescript-mode
  :config
  (setq
   lsp-purescript-formatter "purs-tidy"
   corfu-mode t
   )
  :bind(:map purescript-mode-map
             ("C-c C-p" . purescript-pursuit)
             ("C-c f" . lsp-format-buffer)
             ))

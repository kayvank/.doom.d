;;; conf/purescript.el -*- lexical-binding: t; -*-

(use-package! purescript-mode
  :bind(:map purescript-mode-map
             ("C-c C-p" . purescript-pursuit)))

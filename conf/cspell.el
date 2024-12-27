;;; conf/cspell.el -*- lexical-binding: t; -*-


(use-package! flymake-cspell
  :hook (
         (prog-mode-hook . flymake-cspell-setup)
         ))

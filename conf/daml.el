;;; conf/daml.el -*- lexical-binding: t; -*-

(use-package daml-mode
  :load-path "~/.emacs.d/lisp/daml-mode/"
  :mode "\\.daml\'"
  :bind (:map daml-mode-map
         ("M-n" . flymake-goto-next-error)
         ("M-p" . flymake-goto-next-error)
         ("<tab>" . haskell-indent-cycle))
  :config
  (require 'lsp-daml)
  ;; (setq lsp-daml-extra-arguments '("--scenarios" "no" "--telemetry" "--ghc-option" "-XMonoLocalBinds" "--ghc-option" "-W" "--ghc-option" "-Wno-unused-binds" "--ghc-option" "-Wno-unused-matches" "--RTS" "--jobs" "16" "+RTS" "-N16" "-H10G" "-M12G" "-A20M" "-RTS"))
  )

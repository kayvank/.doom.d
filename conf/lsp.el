;;; conf/lsp-ui.el -*- lexical-binding: t; -*-


(use-package! lsp-ui
  :config
  (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
  (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
  (setq
   lsp-ui-peek-enable t
   lsp-ui-peek-show-directory t
   lsp-ui-imenu-enable t
   lsp-ui-doc-enable t
   lsp-ui-doc-delay 2 ;; 1 second delay
   lsp-ui-doc-show-with-cursor t
   lsp-ui-doc-show-with-mouse t
   ))

(use-package! lsp
    :config
    (add-to-list 'lsp-file-watch-ignored-directories '"[/\\\\]dist-newstyle-repl\\'")
    (add-to-list 'lsp-file-watch-ignored-directories '"[/\\\\]plutus-playground-client/output\\'")
    (add-to-list 'lsp-file-watch-ignored-directories '"[/\\\\]generated\\'")
    (add-to-list 'lsp-file-watch-ignored-directories '"[/\\\\]\\.direnv\\'")
    (add-to-list 'lsp-file-watch-ignored-directories '"[/\\\\]\\.cabal\\'")
    (add-to-list 'lsp-file-watch-ignored-directories '"[/\\\\]\\.spago\\'")
    (add-to-list 'lsp-file-watch-ignored-directories '"[/\\\\]result\\'")
    (add-to-list 'lsp-file-watch-ignored-directories '"[/\\\\]__std__\\'")
    (add-to-list 'lsp-file-watch-ignored-files '"[/\\\\]result\\'")
    (setq
     gc-cons-threshold 100000000
     read-process-output-max (* 1024 1024) ;; 1mb
     lsp-idle-delay 0.500
     lsp-log-io nil
     flycheck-nix-linter-executable "nix-linter"
     lsp-headerline-breadcrumb-enable t
     lsp-ui-sideline-show-code-actions t
     lsp-completion-provider :none)
    )

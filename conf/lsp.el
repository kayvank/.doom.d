;;; conf/lsp.el -*- lexical-binding: t; -*-

(use-package! lsp-ui
  :config
  (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
  (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)

  (setq
    lsp-ui-sideline-delay 2
    lsp-ui-sideline-delay 2
    eldoc-idle-delay 2
    lsp-ui-peek-enable t
    lsp-ui-peek-show-directory t
    lsp-ui-imenu-enable t
  ))

(use-package! lsp
  :init
  (setq
   lsp-file-watch-ignored-directories ( cons "[/\\\\]\\.spago\\'"  lsp-file-watch-ignored-directories )
   lsp-file-watch-ignored-directories (cons "[/\\\\]dist-newstyle-repl\\'" lsp-file-watch-ignored-directories )
   lsp-file-watch-ignored-directories (cons "[/\\\\]plutus-playground-client/output\\'" lsp-file-watch-ignored-directories )
   lsp-file-watch-ignored-directories (cons "[/\\\\]generated\\'" lsp-file-watch-ignored-directories )
   lsp-file-watch-ignored-directories (cons "[/\\\\]\\.cargo\\'" lsp-file-watch-ignored-directories )
   lsp-file-watch-ignored-directories (cons "[/\\\\]\\.cabal\\'" lsp-file-watch-ignored-directories )
   lsp-file-watch-ignored-directories (cons "[/\\\\]\\output\\'" lsp-file-watch-ignored-directories )
   lsp-file-watch-ignored-directories (cons "[/\\\\]\\.psa-stash\\'" lsp-file-watch-ignored-directories )
   lsp-file-watch-ignored-directories (cons "[/\\\\]\\.psa-stash\\'" lsp-file-watch-ignored-directories )
   lsp-file-watch-ignored-directories (cons "[/\\\\]result\\'" lsp-file-watch-ignored-directories )
   lsp-file-watch-ignored-directories (cons "[/\\\\]__std__\\'" lsp-file-watch-ignored-directories )
   lsp-file-watch-ignored-files (cons "[/\\\\]result\\'" lsp-file-watch-ignored-directories )
   )
  (setq
   gc-cons-threshold 100000000
   read-process-output-max (* 1024 1024) ;; 1mb
   lsp-idle-delay 2

   lsp-log-io t  ;; uncomment for debugging
   ;;     flycheck-nix-linter-executable "nix-linter"
   lsp-headerline-breadcrumb-enable t
   lsp-ui-sideline-show-code-actions t
   ;; lsp-completion-provider :none
   lsp-eldoc-render-all t
   eldoc-idle-delay 2
   )
  :bind
  ("C-c C-e" . eldoc-doc-buffer)
  )
;; (push 'company-lsp company-backends)

;; (use-package! company-box
;;   :defer t
;;   :config
;;   (setq-hook! 'prog-mode-hook
;;     company-box-frame-top-margin 20)
;;   (setq-hook! 'text-mode-hook
;;     company-box-frame-top-margin 75)
;;   )


(use-package! lsp-treemacs
  :config
  (lsp-treemacs-sync-mode 1) 
  :commands 
  (lsp-treemacs-errors-list))

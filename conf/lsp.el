;;(define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
;;(define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)


;; optionally
(use-package! lsp-ui
  :commands
  (lsp-ui-mode)
  )

;; if you are helm user
;; (use-package helm-lsp :commands helm-lsp-workspace-symbol)
;; if you are ivy user
;; (use-package! lsp-ivy :commands (lsp-ivy-workspace-symbol) )
(use-package! lsp-treemacs :commands (lsp-treemacs-errors-list) )

;; optional if you want which-key integration
(use-package! which-key
  :config
  (which-key-mode))

(use-package! lsp-mode
  :commands (lsp lsp-execute-code-action)
  :hook ((go-mode . lsp-deferred)
         (lsp-mode . lsp-enable-which-key-integration)
         (lsp-mode . lsp-diagnostics-modeline-mode))
  :bind ("C-c C-c" . 'lsp-execute-code-action)
  :custom
  (setq
   (lsp-diagnostics-modeline-scope :project)
   (lsp-file-watch-threshold 5000)
   (lsp-response-timeout 1)
   (lsp-enable-file-watchers nil)

   )
  )


(use-package! lsp-ui
  :init
)

(use-package! lsp-ivy
  :after (ivy lsp-mode))

(use-package! company-lsp
  :disabled
  :custom (company-lsp-enable-snippet t)
  :after (company lsp-mode))

(setq
 lsp-lens-enable t
 lsp-ui-doc-position 'top
 lsp-ui-doc-mode t
 lsp-ui-peek-enable t
 lsp-ui-doc-delay 0.9
 lsp-ui-sideline-enable t
 lsp-headerline-breadcrumb-enable t
 lsp-completion-show-kind t
 lsp-ui-doc-alignment 'window

 )

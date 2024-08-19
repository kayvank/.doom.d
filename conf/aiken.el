
(use-package! aiken-mode
  :config
  (use-package! lsp
    :config
    (setq
     lsp-log-io t
     lsp-server-trace t
     lsp-ui-sideline-show-hover t
     lsp-ui-mode t
     )

    :hook
    (aiken-mode . lsp)
    )
  ;; :hook
  ;; (aiken-mode . company-mode)
  :bind
  ("C-c C-b" . aiken-format-buffer)
  ("C-c C-r" . aiken-format-region))
;;; aiken.el ends here

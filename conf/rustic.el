(use-package! rustic
  :init
(use-package! lsp-mode
  :custom
  ;; what to use when checking on-save. "check" is default, I prefer clippy
  (lsp-rust-analyzer-cargo-watch-command "clippy")
  ;; (lsp-idle-delay 2)
  ;; ;; enable / disable the hints as you prefer:
  ;; (lsp-inlay-hint-enable nil)
  (lsp-rust-analyzer-display-lifetime-elision-hints-enable "skip_trivial")
  ;; (lsp-rust-analyzer-display-chaining-hints nil)
  ;; (lsp-rust-analyzer-display-lifetime-elision-hints-use-parameter-names nil)
  ;; (lsp-rust-analyzer-display-closure-return-type-hints nil)
  ;; (lsp-rust-analyzer-display-parameter-hints nil)
  ;; (lsp-rust-analyzer-display-reborrow-hints nil)
  :config
  (add-hook 'lsp-mode-hook 'lsp-ui-mode))

(use-package lsp-ui
  ;; :custom
  ;; (lsp-ui-peek-always-show nil)
  ;; (lsp-ui-sideline-show-hover nil)
  ;; (lsp-ui-doc-enable nil))



  :bind (
         "C-c r" . lsp-rust-analyzer-open-external-docs)
  :config
  ;; (setq corfu-mode t)
  )
  )

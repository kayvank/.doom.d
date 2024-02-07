;;; conf/rust.el -*- lexical-binding: t; -*-
(add-to-list 'projectile-globally-ignored-directories ".cargo")
(add-to-list 'lsp-file-watch-ignored-directories '"[/\\\\]\\.cargo\\'")

;; (use-package! counsel-dash
;;   :config (setq counsel-dash-common-docsets '("rust"))

;;   )

;; (use-package! rust
;;   :config
  ;; (add-hook rustic-mode-hook (lambda () (setq-local counsel-dash-docsets '("Rust.docset"))))

;; (setq counsel-dash-docsets-path "~/.local/share/Zeal/Zeal/docsets")
;; (setq counsel-dash-docsets-url "https://raw.github.com/Kapeli/feeds/master")
;; (setq counsel-dash-min-length 3)
;; (setq counsel-dash-candidate-format "%d %n (%t)")
;; (setq counsel-dash-enable-debugging nil)
;; (setq counsel-dash-browser-func 'browse-url)
;; (setq counsel-dash-ignored-docsets nil)

   ;; )

(add-to-list 'projectile-globally-ignored-directories "dist-newstyle")
(add-to-list 'projectile-globally-ignored-directories "dist-newstyle-repl")
(add-to-list 'projectile-globally-ignored-directories ".direnv")
(add-to-list 'projectile-globally-ignored-directories ".cabal")
(add-to-list 'projectile-globally-ignored-directories "results")


;; (use-package! ormolu
;;   :after haskell-mode
;;   :bind
;; ("C-c r" . ormolu-format-buffer))


(use-package! haskell-mode
  :init
  (add-to-list 'load-path  "~/.config/doom/conf/lisp/hlint/")
  (require 'hs-lint)

(defun cabal-fmt ()
  "format cabal source code using cabal-fmt"
  (interactive)
  (setq auto-reverer-mode t)
  (shell-command
   "git ls-files  '*.cabal' | xargs cabal-fmt --inplace"
    nil ;; output buffer
    "*cabal-fmt-error-buffer*" ;; error buffer
   ))

  (defun cabal-fmt-hook ()
    (local-set-key "\C-c" 'cabal-fmt))

(defun fourmolu ()
    "Format haskell source code using `fourmolu'"
  (interactive)
    (setq auto-reverer-mode t)
    (shell-command
     ;; "fix-fourmolu" ;; available thru
     "git ls-files -z '*.hs' | xargs -0 fourmolu --mode inplace -q"
     nil ;; output buffer
     "*fourmolu-error-buffer*" ;; error buffer
   ))

  (defun fourmolu-hook ()
    (local-set-key "\C-f" 'fourmolu) )

  (defun my-haskell-mode-hook ()
    (local-set-key "\C-cl" 'hs-lint))
  :config
  ;; (add-hook 'before-save-hook #'fourmolu-haskell)
  (setq
   haskell-hoogle-port-number 8666
   haskell-indent-offset 2
   haskell-indent-spaces 2)
  :hook (
         (haskell-mode-hook . lsp)
         (haskell-mode-hook . haskell-setup)
         ;; (haskell-mode-hook . company-mode)
         (haskell-mode-hook . my-haskell-mode-hook)
         (haskell-mode-hook . fourmolu-hook)
         (before-save-hook  . fourmolu)
         (haskell-cabal-mode . cabal-fmt-hook)
         )
  :bind(
        ("C-c w". haskell-hoogle-lookup-from-website)
        ("C-c h" . haskell-hoogle-lookup-from-local)
        ;; ("C-c C-f" . lsp-format-buffer ) ;; this does wierd formatting with lambda functions in inline comments
        ("C-c l" . hs-lint)
        ("C-c r" . revert-buffer-no-confirm)
        )
  )
(use-package! lsp-haskell
  :after haskell-mode
  :config
  (setq
   lsp-completion-enable t
   lsp-completion-no-cache t
   lsp-haskell-formatting-provider "fourmolu"
   lsp-haskell-plugin-hlint-config-flags t)
)

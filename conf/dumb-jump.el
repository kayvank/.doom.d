(use-package! dumb-jump
  :bind(
        ("M-g o" . dumb-jump-go-other-window)
        ("M-g j" . dumb-jump-go)
        ("M-g x" . dumb-jump-go-prefer-external)
        ("M-g z" . dumb-jump-go-prefer-external-other-window)
        )
  :config (setq dumb-jump-selector 'ivy))

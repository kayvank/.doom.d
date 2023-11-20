;;; conf/projectile.el -*- lexical-binding: t; -*-

(use-package! projectile
  :config
  (add-to-list 'projectile-globally-ignored-directories ".direnv")
  (add-to-list 'projectile-globally-ignored-directories ".spago")
  (add-to-list 'projectile-globally-ignored-directories "./.nix")
  (add-to-list 'projectile-globally-ignored-directories "./result")

  )

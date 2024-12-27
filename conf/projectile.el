;;; conf/projectile.el -*- lexical-binding: t; -*-

;;; conf/projectile.el -*- lexical-binding: t; -*-

(use-package! projectile
  :config
  (add-to-list 'projectile-globally-ignored-directories ".direnv")
  (add-to-list 'projectile-globally-ignored-directories ".spago")
  (add-to-list 'projectile-globally-ignored-directories "./.nix")
  (add-to-list 'projectile-globally-ignored-directories "./result")
  (add-to-list 'projectile-globally-ignored-directories ".cargo")
  (add-to-list 'projectile-globally-ignored-directories "target")
  :bind (:map projectile-mode-map
              ("C-c C-f" . projectile-find-file-dwim-other-window)))

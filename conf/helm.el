;;; conf/helm.el -*- lexical-binding: t; -*-

(use-package! helm
  :bind
  ("C-x b" . helm-buffers-list)
  :config
  (helm-mode 1)
)
(use-package! wgrep
  :config
  (setq
   wgrep-auto-save-buffer t
   ))

(use-package! wgrep-helm)
(setq helm-projectile-fuzzy-match nil)
(use-package! helm-projectile
:init
(helm-projectile-on)
:config
(setq
 projectile-completion-system 'helm
 projectile-indexing-method 'native
 projectile-switch-project-action 'helm-projectile-find-file
 projectile-switch-project-action 'helm-projectile
 projectile-enable-caching t
 )
(add-to-list 'projectile-globally-ignored-directories "backup")
(add-to-list 'projectile-globally-ignored-directories "dist")
(add-to-list 'projectile-globally-ignored-directories "result")
(add-to-list 'projectile-globally-ignored-directories "dist-newstyle")
(add-to-list 'projectile-globally-ignored-directories ".marconidb")
(add-to-list 'projectile-globally-ignored-directories ".direnv")
(add-to-list 'projectile-globally-ignored-directories ".direnv-disable")
)

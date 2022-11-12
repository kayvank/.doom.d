
(use-package! doom-todo-ivy
  :load-path "~/.doom.d/conf/lisp/doom-todo-ivy.el"
  :defer t
  :after org
  :hook (after-init . doom-todo-ivy))

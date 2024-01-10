;;; conf/orderless.el -*- lexical-binding: t; -*-

(use-package! orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package! citar
  ;; :custom (citar-bibliography '("~/bib/references.bib"))
  :hook
  (LaTeX-mode . citar-capf-setup)
  (org-mode . citar-capf-setup)


  ;; (citar-bibliography '("~/bib/references.bib"))
  :hook
  (LaTeX-mode . citar-capf-setup)
  (org-mode . citar-capf-setup)
  :config
  (use-package! citar-embark
    :config (citar-embark-mode))

  )

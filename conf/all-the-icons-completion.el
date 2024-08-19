;;; conf/all-the-icons-completion.el -*- lexical-binding: t; -*-

(use-package! all-the-icons-completion
  :after (marginalia all-the-icons)
  :hook (marginalia-mode . all-the-icons-completion-marginalia-setup)
  :init
  (all-the-icons-completion-mode))

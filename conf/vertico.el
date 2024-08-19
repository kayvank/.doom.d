;;; conf/vertico.el -*- lexical-binding: t; -*-
;;;
;;;
(use-package! vertico
  :bind (:map vertico-map
         ("C-j" . vertico-next)
         ("C-k" . vertico-previous)
         ("C-f" . vertico-exit)
         :map minibuffer-local-map
         ("M-h" . backward-kill-word))
  :custom
  (vertico-cycle t)
  :init
(use-package! marginalia
  :custom
  (marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))
  :init
  (marginalia-mode));

  (vertico-mode))

(use-package! savehist
  :init
  (savehist-mode))

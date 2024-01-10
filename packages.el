;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; To install a package with Doom you must declare them here and run 'doom sync'
;; on the command line, then restart Emacs for the changes to take effect -- or
;; use 'M-x doom/reload'.


;; To install SOME-PACKAGE from MELPA, ELPA or emacsmirror:
;(package! some-package)

;; To install a package directly from a remote git repo, you must specify a
;; `:recipe'. You'll find documentation on what `:recipe' accepts here:
;; https://github.com/raxod502/straight.el#the-recipe-format
;(package! another-package
;  :recipe (:host github :repo "username/repo"))

;; If the package you are trying to install does not contain a PACKAGENAME.el
;; file, or is located in a subdirectory of the repo, you'll need to specify
;; `:files' in the `:recipe':
;(package! this-package
;  :recipe (:host github :repo "username/repo"
;           :files ("some-file.el" "src/lisp/*.el")))

;; If you'd like to disable a package included with Doom, you can do so here
;; with the `:disable' property:
;(package! builtin-package :disable t)

;; You can override the recipe of a built in package without having to specify
;; all the properties for `:recipe'. These will inherit the rest of its recipe
;; from Doom or MELPA/ELPA/Emacsmirror:
;(package! builtin-package :recipe (:nonrecursive t))
;(package! builtin-package-2 :recipe (:repo "myfork/package"))

;; Specify a `:branch' to install a package from a particular branch or tag.
;; This is required for some packages whose default branch isn't 'master' (which
;; our package manager can't deal with; see raxod502/straight.el#279)
;(package! builtin-package :recipe (:branch "develop"))

;; Use `:pin' to specify a particular commit to install.
;(package! builtin-package :pin "1a2b3c4d5e")


;; Doom's packages are pinned to a specific commit and updated from release to
;; release. The `unpin!' macro allows you to unpin single packages...
;(unpin! pinned-package)
;; ...or multiple packages
;(unpin! pinned-package another-pinned-package)
;; ...Or *all* packages (NOT RECOMMENDED; will likely break things)
;(unpin! t)


(package! ace-jump-mode)
(package! async)
(package! counsel-tramp)
(package! counsel-tramp)
(package! dmenu)
(package! dired-open)
(package! dhall-mode)
(package! doom-snippets :ignore t)
(package! dumb-jump)
(package! elfeed-org)
(package! elfeed-goodies)
(package! elisp-format)
(package! evil-multiedit)
(package! erc-hl-nicks)
(package! erc-colorize)
(package! evil-snipe)
(package! flycheck-aspell)
(package! google-this)
(package! highlight-symbol)
(package! hlint-refactor)
(package! iedit)
(package! lsp-mode)
;; (package! lsp-treemacs)
(package! lsp-ivy)
(package! powerline)
(package! popwin)
(package! org-bullets)
(package! nix-haskell-mode)
(package! lsp-haskell)
(package! hindent)
(package! which-key)
(package! ormolu)
(package! quelpa)
(package! shm)
(package! smart-tab)
(package! solaire-mode)
;; (package! treemacs-magit)
;; (package! treemacs-evil)
;; (package! treemacs-icons-dired)
;; (package! treemacs-all-the-icons)
;; (package! treemacs-projectile)
(package! all-the-icons)
(package! w3m)
(package! yasnippet)
(package! yasnippet-snippets)
;; (package! helm-icons)
;; (package! helm-swoop)
(package! company-ghc)
(package! company-ghci)
(package! multiple-cursors)
;; (package! pdf-tools)
;; (package! org-pdftools)
(package! org-contrib)
(unpin! org-roam)
(package! org-roam-ui)
(package! websocket)
(package! rainbow-delimiters)
;; dynamic window size
(package! zoom-window)
(package! golden-ratio)
(package! citar)
(package! citar-denote)
(package! citar-org-roam)
(package! citar-embark)
(package! vertico)
(package! orderless)
(package! embark)
(package! marginalia)

(package! nerd-icons)
(package! adoc-mode)

;; (package! flymake-hlint)
;;(package! default-text-scale)
;; TODO not sure if this will conflict with company
;; drop doom default snippets

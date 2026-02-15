(setq doom-theme 'doom-ayu-dark)

 (setq doom-font (font-spec :family "Fira Code" :size 16))
;; (setq doom-font (font-spec :family "JetBrains Mono" :size 14))
(show-paren-mode +1)

;; this is for copy/paste when using emacs -nw
(when (getenv "WAYLAND_DISPLAY")
  (setq wl-copy-process nil)
  (defun wl-copy (text)
    (setq wl-copy-process (make-process :name "wl-copy"
                                        :buffer nil
                                        :command '("wl-copy" "-f" "-n")
                                        :connection-type 'pipe
                                        :noquery t))
    (process-send-string wl-copy-process text)
    (process-send-eof wl-copy-process))

  (defun wl-paste ()
    (if (and wl-copy-process (process-live-p wl-copy-process))
        nil ; shoul return nil if we are the current paste owner)
      (shell-command-to-string "wl-paste -n | tr -d \r")))
  (setq
   interprogram-cut-function 'wl-copy
   interprogram-paste-function 'wl-paste))

;; these settings are currently the default setting,and we could remove them
(setq
 select-enable-primary nil
 select-enable-clipboard t
 x-select-enable-primary nil
 x-select-enable-clipboard t
 )

(map! :leader
      :desc "Comment line" "-" #'comment-line)

(custom-set-faces
 '(markdown-header-face ((t (:inherit font-lock-function-name-face :weight bold :family "variable-pitch"))))
 '(markdown-header-face-1 ((t (:inherit markdown-header-face :height 1.6))))
 '(markdown-header-face-2 ((t (:inherit markdown-header-face :height 1.5))))
 '(markdown-header-face-3 ((t (:inherit markdown-header-face :height 1.4))))
 '(markdown-header-face-4 ((t (:inherit markdown-header-face :height 1.3))))
 '(markdown-header-face-5 ((t (:inherit markdown-header-face :height 1.2))))
 '(markdown-header-face-6 ((t (:inherit markdown-header-face :height 1.1)))))

(defun dt/toggle-markdown-view-mode ()
  "Toggle between `markdown-mode' and `markdown-view-mode'."
  (interactive)
  (if (eq major-mode 'markdown-view-mode)
      (markdown-mode)
    (markdown-view-mode)))

(custom-theme-set-faces!
'doom-one
'(org-level-8 :inherit outline-3 :height 1.0)
'(org-level-7 :inherit outline-3 :height 1.0)
'(org-level-6 :inherit outline-3 :height 1.1)
'(org-level-5 :inherit outline-3 :height 1.2)
'(org-level-4 :inherit outline-3 :height 1.3)
'(org-level-3 :inherit outline-3 :height 1.4)
'(org-level-2 :inherit outline-2 :height 1.5)
'(org-level-1 :inherit outline-1 :height 1.6)
'(org-document-title  :height 1.8 :bold t :underline nil))

(setq
 org-directory "~/dev/emacs/org/"
 org-modern-table-vertical 1
 org-modern-table t
 )
(add-hook 'org-mode-hook #'hl-todo-mode)

(use-package! org-roam
  :config (setq
           org-roam-db-location "~/dev/emacs/org/roam/iog/zk/db"
           org-roam-directory "~/dev/emacs/org/roam/iog/zk"
           org-roam-dailies-directory "~/dev/emacs/org/roam/journal"
           org-roam-completion-everywhere t
          )
  )
(use-package! org-roam-ui
  :init (use-package! websocket)
  :config (setq
           org-roam-ui-sync-theme t
           org-roam-ui-follow t
           org-roam-ui-update-on-save t
           org-roam-ui-open-on-start t
           )
  )

(after! org
  (setq
   org-agenda-files '("~/dev/emacs/org/agenda/agenda.org")))

;; (use-package! org-super-agend
;;               :ensure t
;;               :after org
;;               :init
;;               ;; (setq org-super-agenda-groups '((:name "Today" :time-grid t :scheduled "today") (:name "Due Today" :deadline today) (:name "Important" :priority "A") (:name "Overdue" :deadline past) (:name "Due soon" :deadline future) (:name "Big Outcomes" :tag "bo")))
;;               :config
;;               (org-super-agenda-mode)
;;               )

;; (after! yasnippet (add-to-list 'yas-snippet-dirs "~/dev/emacs/templates/snippets"))

(use-package! projectile
  :config
  (setq
   projectile-globally-ignore-directories '(
                                            ".direnv"
                                            ".spago"
                                            "./result"
                                            ".cargo"
                                            ".cabal"
                                            "target"
                                            "var"
                                            "logs"
                                            "tmp"
                                            "dist-newstyle"
                                            "node_modules"
                                            "build"
                                            "output"
                                            "input"
                                            "var"
                                            ".vscode"

                                            )
   )
  :bind (:map projectile-mode-map
              ("C-c C-f" . projectile-find-file-dwim-other-window)))

(use-package! treemacs
  :config
  (setq
   treemacs-follow-mode t
   treemacs-tag-follow-delay 2)
  :bind (
         ([f8] . treemacs-add-and-display-current-project-exclusively)
         ("S-<f8>" . treemacs-select-window)
         ("C-c t" . treemacs)
         )
  )

(use-package! elfeed-org
  :config
        (use-package! org)
  (setq
   rmh-elfeed-org-files '("~/dev/emacs/org/elfeed/elfeed.org")
   elfeed-db-directory    "~/dev/emacs/org/elfeed/db/"
   elfeed-search-filter "@6-months-ago +unread"
   ))

(use-package! ebuku
  :config
  (setq
   browse-url-generic-program "brave-browser"
   browse-url-browser-function 'browse-url-generic)
  )

(use-package! evil-multiedit)
(evil-multiedit-default-keybinds)

(global-set-key (kbd "C-x k") 'kill-current-buffer) ;; skip verification
;; (global-whitespace-mode +1)

(setq
 ;; display-line-numbers-type t
 display-line-numbers-type 'relative
 ;; browse-url-browser-function 'eww-browse-url
 ;; initial-buffer-choice 'eshell ;; Eshell is initial buffer
 confirm-kill-emacs nil
 auto-save-default nil
 popup-mode nil
 +popup-mode nil
 )

(editorconfig-mode 1)
(global-set-key (kbd "C-x v") 'yank)

(use-package! consult-hoogle
  :config
  (setq consult-hoogle-server "http://localhost:8666"))

(use-package! haskell-mode
  :config
  (setq
   haskell-hoogle-port-number 8666
   browse-url-browser-function 'eww)
  :bind
  ("C-c C-w". haskell-hoogle-lookup-from-website)
  ("C-c C-h" . haskell-hoogle-lookup-from-local)
  ("C-c f" . lsp-format-buffer)
  ("C-c s" . haskell-mode-stylish-buffer)

  :init
  (use-package! lsp-mode
    :config
    ( setq
        lsp-log-io nil
        lsp-enable-symbol-highlighting t
        lsp-enable-on-type-formatting nil
        lsp-headerline-breadcrumb-enable t
        lsp-modeline-diagnostics-enable t
        lsp-modeline-code-actions-enable t
        lsp-idle-delay 1
        lsp-enable-indentation t
        lsp-enable-snippet nil
        lsp-restart nil)
    :init
 (use-package! lsp-haskell
    :config
    (setq
      lsp-haskell-server-path "haskell-language-server-wrapper"
      lsp-haskell-formatting-provider "fourmolu"
      lsp-haskell-plugin-ghcide-completions-config-snippets-on t
      ;; lsp-haskell-plugin-ghcide-type-lenses-global-on t
      lsp-haskell-plugin-ghcide-hover-actions-global-on t
      ;; lsp-haskell-plugin-cabal-code-actions-on t
      )
  )
 (use-package! lsp-ui
    :config
    ( setq
      lsp-ui-peek-show-directory t
      lsp-ui-imenu-enable t
      lsp-ui-sideline-delay 2
      lsp-ui-doc-delay 2
      lsp-ui-mode t
      ;; lsp-ui-doc-position 'bottom; or 'top, 'right, 'at-point
      ;; lsp-ui-doc-position 'at-point
      ;; lsp-ui-doc-show-with-cursor t
      lsp-ui-doc-enable t
      lsp-ui-sideline-show-hover t
      lsp-ui-sideline-show-diagnostics t
      lsp-ui-sideline-show-code-actions t
      lsp-ui-sideline-update-mode 'point
      ;; lsp-ui-doc-use-childframe t
      lsp-ui-doc-include-signature t)
    )


  )
    )

(use-package! lsp
  :config
  (setq
   gc-cons-threshold 100000000 ;; 100MB
   read-process-output-max (* 1024 1024 5) ;; 5mb
   lsp-log-io nil  ;; uncomment for debugging
   lsp-headerline-breadcrumb-enable t
   lsp-auto-guess-root t
   ;; lsp-modeline-diagnostics-scope :workspace
   ;; flymake-mode t
;; monorepo
   lsp-auto-guess-root nil
   debug-on-error nil
   )
  :bind
  ("C-c C-e" . eldoc-doc-buffer)


:init
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\.cabal\\'")
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\.direnv\\'")
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\var\\'")
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\output\\'")
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\input\\'")
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\.deps-src\\'")
(use-package! lsp-treemacs
  :config
  (lsp-treemacs-sync-mode 1)
  :commands
  (lsp-treemacs-errors-list))

  )

(use-package! lsp-mode
  :config
  (lsp-register-client
   (make-lsp-client
    :new-connection (lsp-stdio-connection '("deno" "lsp"))
    :major-modes '(typescript-mode typescript-tsx-mode js-mode js-ts-mode)
    :server-id 'deno-ls
    :initialized-fn (lambda (workspace)
                      (with-lsp-workspace workspace
                        (lsp--set-configuration
                         `(:enable t
                           :lint t
                           :unstable t
                           :suggest :all)))))
   ))

(setq +latex-viewers '(pdf-tools))
(setq lsp-tex-server 'digestif)

(add-hook 'latex-mode-hook #'xenops-mode)
(add-hook 'LaTeX-mode-hook #'xenops-mode)

;; (add-hook LaTeX-mode-hook #'xenops-mode)

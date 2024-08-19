;;; conf/general.el -*- lexical-binding: t; -*-

(global-set-key (kbd "C-x k") 'kill-current-buffer) ;; skip verification
(global-whitespace-mode +1)

(setq
 browse-url-generic-program "brave"
 browse-url-browser-function 'browse-url-generic
 confirm-kill-emacs nil
 auto-save-default nil
 )
(editorconfig-mode 1)
(global-set-key (kbd "C-x v") 'yank)

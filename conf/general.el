;;; conf/general.el -*- lexical-binding: t; -*-

(global-set-key (kbd "C-x k") 'kill-current-buffer) ;; skip verification

(setq
 browse-url-generic-program "brave"
 browse-url-browser-function 'browse-url-generic
 confirm-kill-emacs nil
 )
(editorconfig-mode 1)

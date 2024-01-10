;;; conf/window.el -*- lexical-binding: t; -*-

(defun split-3-windows-horizontally-evenly ()
  (interactive)
  (command-execute 'split-window-horizontally)
  (command-execute 'split-window-horizontally)
  (command-execute 'balance-windows)
  )

(global-set-key (kbd "C-x 4") 'split-3-windows-horizontally-evenly)

(with-eval-after-load "persp-mode-autoloads"
  (add-hook 'after-init-hook #'(lambda () (persp-mode 1))))

(use-package! zoom-window
:config
 (setq
 zoom-window-mode-line-color nil)
(zoom-window-setup))

(global-set-key (kbd "C-x C-z") 'zoom-window-zoom)

;;; conf/projectile_neotree.el -*- lexical-binding: t; -*-

;; NeoTree can be opened (toggled) at projectile project root
(defun neotree-project-dir ()
    "Open NeoTree using the git root."
    (interactive)
    (let ((project-dir (projectile-project-root))
          (file-name (buffer-file-name)))
      (neotree-toggle)
      (if project-dir
          (if (neo-global--window-exists-p)
              (progn
                (neotree-dir project-dir)
                (neotree-find file-name)))
        (message "Could not find git project root."))))

;; need another one for python stuff, since this gets re-bound
(global-set-key (kbd "C-c C-p") 'neotree-project-dir)
(global-set-key (kbd "C-c C-e") 'projectile-grep)

(setq projectile-mode-line "Projectile")
(setq remote-file-name-inhibit-cache nil)
(setq vc-ignore-dir-regexp
      (format "%s\\|%s"
                    vc-ignore-dir-regexp
                    tramp-file-name-regexp))
(setq tramp-verbose 1)

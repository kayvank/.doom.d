(use-package! elfeed-goodies)
(use-package! elfeed-org)
(setq
 rmh-elfeed-org-files (list "~/.shared/elfeed/elfeed.org")
 elfeed-db-directory "~/.shared/elfeed/"
 elfeed-goodies/entry-pane-size 0.5
 )
(evil-define-key 'normal elfeed-show-mode-map
  (kbd "J") 'elfeed-goodies/split-show-next
  (kbd "K") 'elfeed-goodies/split-show-prev
  )
(evil-define-key 'normal elfeed-search-mode-map
  (kbd "J") 'elfeed-goodies/split-show-next
  (kbd "K") 'elfeed-goodies/split-show-prev
  )

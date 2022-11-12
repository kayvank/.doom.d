;;; conf/diary.el -*- lexical-binding: t; -*-

;;; Calendar and Diary (and prot-diary.el)
  (setq
        calendar-mark-diary-entries-flag t
        calendar-mark-holidays-flag t
        calendar-mode-line-format nil
        calendar-time-display-form '(24-hours ":" minutes (when time-zone (format "(%s)" time-zone)))
        calendar-week-start-day 1
        calendar-date-style 'iso
        calendar-date-display-form calendar-iso-date-display-form
        calendar-time-zone-style 'numeric
   )






  (require 'solar)
  (setq calendar-latitude 35.17         ; Not my actual coordinates
        calendar-longitude 33.36)

  (require 'cal-dst)
  (setq calendar-standard-time-zone-name "+0200")
  (setq calendar-daylight-time-zone-name "+0300")

  (require 'diary-lib)
  (setq diary-mail-addr user-mail-address)
  (setq diary-date-forms diary-iso-date-forms)
  (setq diary-comment-start ";;")
  (setq diary-comment-end "")
  (setq diary-nonmarking-symbol "!")
  (setq diary-show-holidays-flag t)
  (setq diary-display-function #'diary-fancy-display) ; better than its alternative
  (setq diary-header-line-format nil)
  (setq diary-list-include-blanks nil)
  (setq diary-number-of-entries 2)
  (setq diary-mail-days 2)
  (setq diary-abbreviated-year-flag nil)

  (add-hook 'calendar-today-visible-hook #'calendar-mark-today)
  (add-hook 'diary-list-entries-hook 'diary-sort-entries t)
  (add-hook 'diary-mode-hook #'goto-address-mode) ; buttonise plain text links

  ;; Those presuppose (setq diary-display-function #'diary-fancy-display)
  (add-hook 'diary-list-entries-hook 'diary-include-other-diary-files)
  (add-hook 'diary-mark-entries-hook 'diary-mark-included-diary-files)

  (remove-hook 'calendar-mode-hook #'org--setup-calendar-bindings)
  (let ((map calendar-mode-map))
    (define-key map (kbd "s") #'calendar-sunrise-sunset)
    (define-key map (kbd "l") #'lunar-phases)
    (define-key map (kbd "i") nil) ; Org sets this, much to my chagrin (see `remove-hook' above)
    (define-key map (kbd "i a") #'diary-insert-anniversary-entry)
    (define-key map (kbd "i b") #'diary-insert-block-entry)
    (define-key map (kbd "i c") #'diary-insert-cyclic-entry)
    (define-key map (kbd "i d") #'diary-insert-entry) ; for current "day"
    (define-key map (kbd "i i") #'diary-insert-entry) ; most common action, easier to type
    (define-key map (kbd "i m") #'diary-insert-monthly-entry)
    (define-key map (kbd "i w") #'diary-insert-weekly-entry)
    (define-key map (kbd "i y") #'diary-insert-yearly-entry)
    (define-key map (kbd "M-n") #'calendar-forward-month)
    (define-key map (kbd "M-p") #'calendar-backward-month))

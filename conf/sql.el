;;; conf/sql.el -*- lexical-binding: t; -*-

(defun sql-beautify-region (beg end)
  "Beautify SQL in region between beg and END."
  (interactive "r")
  (save-excursion
    (shell-command-on-region beg end "sql-formatter" nil t)))
    ;; change sqlbeautify to anbt-sql-formatter if you
    ;;ended up using the ruby gem

(defun sql-beautify-buffer ()
 "Beautify SQL in buffer."
 (interactive)
 (sql-beautify-region (point-min) (point-max)))

(defun sql-beautify-region-or-buffer ()
  "Beautify SQL for the entire buffer or the marked region between beg and end"
  (interactive)
  (if (use-region-p)
      (sql-beautify-region (region-beginning) (region-end))
    (sql-beautify-buffer)))

(add-hook 'sql-mode-hook '(lambda ()
  ;; beautify region or buffer
  (local-set-key (kbd "C-M-]") 'sql-beautify-region-or-buffer)))

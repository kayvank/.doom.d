;;; conf/erc.el -*- lexical-binding: t; -*-

(use-package erc
  :config
  (require 'erc-services)

  ;; highlight notifications in ERC
  (font-lock-add-keywords
   'erc-mode
   '((";;.*\\(kayvank2\\|éducation\\|clojure\\|emacs\\|orgmode\\)"
      (1 kayvank-todo-comment-face t))))

  (setq erc-modules '(autoaway autojoin irccontrols log netsplit noncommands
			       notify pcomplete completion ring services stamp
			       track truncate)
	erc-keywords nil
	erc-prompt-for-nickserv-password nil
	erc-prompt-for-password nil
	erc-timestamp-format "%s "
	erc-hide-timestamps t
	erc-log-channels t
	erc-log-write-after-insert t
	erc-log-insert-log-on-open nil
	erc-save-buffer-on-part t
	erc-input-line-position 0
	erc-fill-function 'erc-fill-static
	erc-fill-static-center 0
	erc-fill-column 130
	erc-insert-timestamp-function 'erc-insert-timestamp-left
	erc-insert-away-timestamp-function 'erc-insert-timestamp-left
	erc-whowas-on-nosuchnick t
	erc-public-away-p nil
	erc-save-buffer-on-part t
	erc-echo-notice-always-hook '(erc-echo-notice-in-minibuffer)
	erc-auto-set-away nil
	erc-autoaway-message "%i seconds out..."
	erc-away-nickname "kayvank"
	erc-kill-queries-on-quit nil
	erc-kill-server-buffer-on-quit t
	erc-log-channels-directory "~/.erc_log"
	erc-enable-logging t
	erc-query-on-unjoined-chan-privmsg t
	erc-auto-query 'window-noselect
	erc-server-coding-system '(utf-8 . utf-8)
	erc-encoding-coding-alist '(("#emacs" . utf-8)
				    ("&bitlbee" . utf-8)))

  (add-hook 'erc-mode-hook
	    #'(lambda ()
		(auto-fill-mode -1)
		(erc-completion-mode 1)
		(erc-ring-mode 1)
		(erc-log-mode 1)
		(erc-netsplit-mode 1)
		(erc-button-mode -1)
		(erc-match-mode 1)
		(erc-autojoin-mode 1)
		(erc-nickserv-mode 1)
		(erc-timestamp-mode 1)
		(erc-services-mode 1)))

  (defun erc-notify-on-msg (msg)
    (if (string-match "kayvank:" msg)
	(shell-command (concat "notify-send \"" msg "\""))))

  (add-hook 'erc-insert-pre-hook 'erc-notify-on-msg)

  (defun kayvank-erc-connect-libera ()
    "Connect to Libera server with ERC."
    (interactive)
    (erc-ssl :server "irc.libera.chat"
	     :port 6697
	     :nick "kayvank"
	     :full-name "kayvan")))

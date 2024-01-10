(setq auth-sources
      '((:source "~/.authinfo.gpg"))
      erc-prompt-for-password nil erc-prompt-for-nickserv-password nil)
(use-package! erc
  :defer t
  :config (setq erc-server "irc.libera.chat" erc-services-mode 1 erc-autojoin-channels-alist '(("libera.chat"
                                                                                                 "#xmonad"
                                                                                                 "#purescript"
                                                                                                 "#haskell"
                                                                                                 "#nixos"
                                                                                                ;;"#emacs"
												))
                erc-prompt "->> " erc-server-coding-system '(utf-8 . utf-8) erc-fill-column 100 ;; ;; column with is 100
                erc-interpret-mirc-color t
                ;; Kill buffers for channels after /part
                erc-kill-buffer-on-part t
                ;; Kill buffers for private queries after quitting the server
                erc-kill-queries-on-quit t
                ;; Kill buffers for server messages after quitting the server
                erc-kill-server-buffer-on-quit t
                ;; open query buffers in the current window
                erc-query-display 'buffer erc-save-buffer-on-part t erc-insert-timestamp-function
                'erc-insert-timestamp-left erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT"
                                                                     "MODE" "324" "329" "332" "333"
                                                                     "353" "477")
                erc-auto-discard-away t erc-autoaway-idle-seconds 600 erc-autoaway-use-emacs-idle t)
  :custom (erc-tls :server "irc.libera.chat"
                   :port 6697
                   :nick "kayvank")
  (erc: server "irc.libera.chat"
        :port 6667
        :nick "kayvank")
  ;; Auto join irc server when erc start
  (erc-autojoin-mode t)
  ;; truncate too long line
  (erc-truncate-mode +1)
  (erc-timestamp-mode 1)
  ;; enable track-mode
  (erc-track-mode t)
  (use-package! erc-spelling
    :config (erc-spelling-mode 0))
  (use-package! erc-hl-nicks)
  (use-package! erc-colorize)

  )

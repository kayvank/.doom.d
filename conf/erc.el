(setq auth-sources
      '((:source "~/.authinfo.gpg"))
      erc-prompt-for-password nil erc-prompt-for-nickserv-password nil)
(use-package! erc
  :defer t
  :config
  (setq
   erc-server "irc.libera.chat"
   erc-nick "kayvank"
   erc-services-mode 1
   erc-autojoin-channels-alist '(
                                 ("libera.chat"
                                  "#xmonad"
                                  "#purescript"
                                  "#haskell"
                                  "#haskell-servant"
                                  "#haskell-cryptography"
                                  "#nixos"
                                  "#emacs"))
   erc-prompt "->> "
   erc-server-coding-system '(utf-8 . utf-8)
   erc-fill-column 100 ;; default is 78
   erc-fill-function 'erc-fill-static
   ;; erc-fill-center 10
   erc-fill-static-center 10
   erc-interpret-mirc-color t
   erc-keywords '("cabal" "quickcheck" "monad" "polysem" "eff")
   erc-kill-buffer-on-part t
   erc-kill-queries-on-quit t
   erc-kill-server-buffer-on-quit t
   erc-query-display 'buffer
   erc-save-buffer-on-part t
   erc-insert-timestamp-function 'erc-insert-timestamp-right
   erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT" "MODE" "AWAY" "324" "329" "332" "333" "353" "477")
   erc-track-exclude '("#emacs")
   erc-track-exclude-server-buffer t
   erc-auto-discard-away t
   erc-autoaway-idle-seconds 600
   erc-log-channels-directory "~/.erc/logs/"
   erc-generate-log-file-name-function (quote erc-generate-log-file-name-with-date)
   erc-save-buffer-on-part nil
   erc-save-queries-on-quit nil
   erc-log-write-after-insert t
   erc-log-write-after-send t
   erc-autoaway-use-emacs-idle t)

  (use-package! erc-spelling
    :config (erc-spelling-mode t))
  (use-package! erc-hl-nicks)
  (use-package! erc-colorize)

  :custom
  (erc-tls :server "irc.libera.chat"
                   :port 6697
                   :nick "kayvank")
  (erc: server "irc.libera.chat"
        :port 6667
        :nick "kayvank")
  (erc-autojoin-mode t)
  (erc-truncate-mode +1)
  (erc-timestamp-mode 1)
  )
;; The directory should be created by user.

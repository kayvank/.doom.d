(setq auth-sources '( "~/.authinfo.gpg" ))

(use-package! erc
  :custom
  (erc-tls :server "irc.libera.chat" :port 6697 :nick "kayvank")
  (erc: server "irc.libera.chat" :port 6667 :nick "kayvank")
  :config
    (require 'erc-services)
  (use-package! erc-colorize)
  (setq
   erc-server "irc.libera.chat"
   erc-services-mode 1
   erc-autojoin-channels-alist '(("libera.chat" "#xmonad" "#purescript" "#haskell" "#emacs"))
   erc-prompt-for-password nil
   erc-prompt-for-nickserv-password nil
   erc-colorize-mode 1
   erc-log-insert-log-on-open t
   erc-enable-logging t
   erc-log-channels-directory "~/.erc/logs/"
   erc-save-buffer-on-part t
   )

  (add-to-list 'erc-modules 'notifications)
  (add-to-list 'erc-modules 'spelling)
  )

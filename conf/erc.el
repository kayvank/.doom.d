(setq auth-sources '("~/.authinfo.gpg"))

(use-package erc
  :custom
  (erc-autojoin-channels-alist '(("libera.chat" "#purescript" "#haskell"
                                  )))
  (erc-autojoin-timing 'ident)
  (erc-fill-function 'erc-fill-static)
  (erc-fill-static-center 22)
  (erc-hide-list '("JOIN" "PART" "QUIT"))
  (erc-lurker-hide-list '("JOIN" "PART" "QUIT"))
  (erc-lurker-threshold-time 43200)
  (erc-prompt-for-nickserv-password nil)
  (erc-server-reconnect-attempts 5)
  (erc-server-reconnect-timeout 3)
  (erc-track-exclude-types '("JOIN" "MODE" "NICK" "PART" "QUIT"
                             "324" "329" "332" "333" "353" "477"))
  :config
  (add-to-list 'erc-modules 'notifications)
  (add-to-list 'erc-modules 'spelling)
  (erc-services-mode 1)
  (erc-update-modules))

(defun my/erc-start-or-switch ()
  "Connects to ERC, or switch to last active buffer."
  (interactive)
  (if (get-buffer "irc.libera.chat:6697")
      (erc-track-switch-buffer 1)
    (when (y-or-n-p "Start ERC? ")
      (erc-tls :server "irc.libera.chat" :port 6697 :nick "kayvank"))))

(defun my/erc-notify (nickname message)
  "Displays a notification message for ERC."
  (let* ((channel (buffer-name))
         (nick (erc-hl-nicks-trim-irc-nick nickname))
         (title (if (string-match-p (concat "^" nickname) channel)
                    nick
                  (concat nick " (" channel ")")))
         (msg (s-trim (s-collapse-whitespace message))))
    (alert (concat nick ": " msg) :title title)))

(defun my/erc-count-users ()
  "Displays the number of users connected on the current channel."
  (interactive)
  (if (get-buffer "irc.libera.chat:6697")
      (let ((channel (erc-default-target)))
        (if (and channel (erc-channel-p channel))
            (message "%d users are online on %s"
                     (hash-table-count erc-channel-users)
                     channel)
          (user-error "The current buffer is not a channel")))
    (user-error "You must first start ERC")))
(defun my/erc-preprocess (string)
  "Avoids channel flooding."
  (setq str
        (string-trim
         (replace-regexp-in-string "\n+" " " str))))
(use-package! erc-hl-nicks)

;; (use-package! erc-image)

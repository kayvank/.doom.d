;;; conf/pomodoro.el -*- lexical-binding: t; -*-

(use-package! org-pomodoro
  :bind (
         ([f12] . org-pomodoro))
  :config
  (setq
        org-pomodoro-manual-break t
        org-pomodoro-length 50
        org-pomodoro-short-break-length 10
        org-pomodoro-long-break-length 20
        org-pomodoro-finished-sound "~/dev/emacs/org/sound-files/tos-photon-torpedo-1.wav"
        org-pomodoro-start-sound "~/dev/emacs/org/sound-files/tos-photon-torpedo-1.wav"
        org-pomodoro-killed-sound "~/dev/emacs/org/sound-files/tos-photon-torpedo-1.wav"
        org-pomodoro-short-break-sound "~/dev/emacs/org/sound-files/tos-photon-torpedo-1.wav"
        org-pomodoro- "~/dev/emacs/org/sound-files/tos-photon-torpedo-1.wav"
        ))

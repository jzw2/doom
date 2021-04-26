;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "John Wang"
      user-mail-address "jzw2@illinois.edu")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-fairy-floss) ;; I actually really like this theme

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;;

(display-battery-mode t) ;; yay battery
;;(display-time-mode t) ;; yay time
(setq auto-save-default t) ;;yay save time
(setq global-subword-mode t) ;; w goes though the stuff or whatetever

(set-email-account! "Illinois"
  '(
    (mu4e-refile-folder     . "/Illinois/All Mail")
    (smtpmail-smtp-user     . "jzw2@illinois.edu")
    (mu4e-compose-signature . "John Wang"))
  t)

(setq mu4e-mu4e-mail-path "~/mbsync") ;; I don't think i actually got this to work because illinois email is dumb
;; (setq org-pomodoro-ticking-sound-p t) ;; Whats that strange ticking sound
(setq org-pomodoro-audio-player "afplay") ;; because I hate pulse audio and whoever designed it so that you could


(after! avy
  ;; home row priorities: 8 6 4 5 - - 1 2 3 7
  (setq avy-keys '(?a ?o ?e ?u ?h ?t ?l ?s))) ;; setting the dvorak stuff uwu



(after! company
  (setq company-show-numbers t) ;;not sure what thuis does but whatever
  )
(setq which-key-idle-delay 0.5) ;; I need the help, I really do


;; not suer if I did this correctly
(setq org-pomodoro-finished-hook (lambda () (start-process-shell-command "osascript" nil "osascript -e 'display notification \"Pomodoro Ended\" with title \"Hey Listen!!!\"'")))
(setq org-pomodoro-break-finished-hook (lambda () (start-process-shell-command "osascript" nil "osascript -e 'display notification \"Break Ended, get back to work scrub\" with title \"Hey Listen!!!\"'")))


(setq pdf-view-use-scaling t pdf-view-use-imagemagick nil) ;; please fix things
;; (setq browse-url-browser-function 'xwidget-webkit-browse-url) ;; this is actually kind of annoying
(setq org-agenda-todo-ignore-deadlines "near")
(setq org-agenda-todo-ignore-scheduled "all")



(setq +ivy-buffer-preview t)

(add-hook 'text-mode-hook #'auto-fill-mode)
(add-hook 'LaTeX-mode-hook (lambda () (if (eq major-mode 'org-mode)
                                          (turn-on-smartparens-mode)
                                        (turn-off-smartparens-mode)
                                       )))

(setq prettify-symbols-unprettify-at-point t)
(setq LaTeX-electric-left-right-brace t)
(map! :map cdlatex-mode-map
    :i "TAB" #'cdlatex-tab)

(use-package! org-fragtog
  :hook (org-mode . org-fragtog-mode)) ;; I kin dof doe'nt know what use packgae is usppode to do

(setq org-pomodoro-short-break-sound "~/.doom.d/break_end.wav")
(setq org-pomodoro-finished-sound "~/.doom.d/pom_end.wav" )

(setq lsp-pyright-python-executable-cmd "python3") ;; stupid I should probably send a bug fix or something



;;(setq k-custom-word-highlights '("Term"))

(setq k-custom-highlights-regex "Int")


(use-package! metamath-mode
  :commands (metamath-mode))



(elcord-mode) ;; flex on people
(nyan-mode)

;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "John Wang"
      user-mail-address "johnz.wang@outlook.com")

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
 ;; (setq doom-font (font-spec :family "noto" :size 12 :weight 'semi-light)
;; doom-variable-pitch-font (font-spec :family "sans" :size 13))
;;
;;

;; (setq doom-font "Minecraft Mono")

(setq doom-font "Fira Code")
;; (setq doom-font (font-spec :family "Noto Sans Mono" :size 16)
      ;; doom-big-font (font-spec :family "JetBrains Mono" :size 36)
      ;; doom-variable-pitch-font (font-spec :family "Noto Sans" :size 24)
      ;; doom-unicode-font (font-spec :family "JuliaMono")
      ;; doom-serif-font (font-spec :family "IBM Plex Mono" :weight 'light)
      ;; )
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

;;(display-battery-mode t) ;; yay battery
;;(display-time-mode t) ;; yay time
(setq auto-save-default t) ;;yay save time
(setq global-subword-mode t) ;; w goes though the stuff or whatetever

(set-email-account! "outlook"
  '(
    (mu4e-refile-folder     . "/mbsync/INBOX")
    (smtpmail-smtp-user     . "johnz.wang@outlook.com")
    (mu4e-compose-signature . "John Wang"))
  t)

(setq mu4e-mu4e-mail-path "~/mbsync") ;; I don't think i actually got this to work because illinois email is dumb
;; (setq org-pomodoro-ticking-sound-p t) ;; Whats that strange ticking sound
(setq org-pomodoro-audio-player "afplay") ;; because I hate pulse audio and whoever designed it so that you could


(after! avy
  ;; home row priorities: 8 6 4 5 - - 1 2 3 7
  (setq avy-keys '(?a ?o ?e ?u ?h ?t ?l ?s))) ;; setting the dvorak stuff uwu



;; (after! company
;;   (setq company-show-numbers t) ;;not sure what thuis does but whatever
;;   )
(setq which-key-idle-delay 0.5) ;; I need the help, I really do


;; not suer if I did this correctly
(setq org-pomodoro-finished-hook (lambda () (start-process-shell-command "osascript" nil "osascript -e 'display notification \"Pomodoro Ended\" with title \"Hey Listen!!!\"'")))
(setq org-pomodoro-break-finished-hook (lambda () (start-process-shell-command "osascript" nil "osascript -e 'display notification \"Break Ended, get back to work scrub\" with title \"Hey Listen!!!\"'")))
(setq org-pomodoro-tick-hook (lambda () (
                                         if (nth 1 org-pomodoro-mode-line)
                                         (write-region (nth 1 org-pomodoro-mode-line) nil "~/pomodoro.txt" nil 'shutup
                                                      ) nil)
                               ))

;; magic that chatgpt gave me
(after! org
  (defun set-custom-font-for-org-mode ()
    "Set custom font for org mode."
    (interactive)
    (setq buffer-face-mode-face '(:family "Minecraft Mono" :height 120))
    (buffer-face-mode))
  (add-hook 'org-mode-hook 'set-custom-font-for-org-mode))


(setq pdf-view-use-scaling t pdf-view-use-imagemagick nil) ;; please fix things
;; according to the documentation of pdf view use image magick "This variable has no effect" wtf?
;; (setq browse-url-browser-function 'xwidget-webkit-browse-url) ;; this is actually kind of annoying
(setq org-agenda-todo-ignore-deadlines "near")
(setq org-agenda-todo-ignore-scheduled "all")



(setq +ivy-buffer-preview t)


;; I don't know why I adde the ones below
;; (add-hook 'text-mode-hook #'auto-fill-mode)
;; (add-hook 'LaTeX-mode-hook (lambda () (if (eq major-mode 'org-mode)
;;                                           (turn-on-smartparens-mode)
;;                                         (turn-off-smartparens-mode)
;;                                        )))

(setq prettify-symbols-unprettify-at-point t)
;; (setq LaTeX-electric-left-right-brace t) ;; I don't rember why I enabled this
(map! :map cdlatex-mode-map
    :i "TAB" #'cdlatex-tab)

;; (use-package! org-fragtog
;;

(setq org-pomodoro-short-break-sound "~/.doom.d/break_end.wav")
(setq org-pomodoro-finished-sound "~/.doom.d/pom_end.wav" )

(setq lsp-pyright-python-executable-cmd "python3") ;; stupid I should probably send a bug fix or something



;;(setq k-custom-word-highlights '("Term"))

;; (setq k-custom-highlights-regex "Int") ;; I don't know what this is supposde to do

(setq evil-respect-visual-line-mode t)

(setq smtpmail-smtp-server 587)

(use-package! metamath-mode
  :commands (metamath-mode))

(use-package! metamath-mode)

(use-package! nyan-mode
  :commands nyan-mode
  )
(use-package! elcord
  :commands elcord-mode
  :config
  (setq elcord-use-major-mode-as-main-icon t))


(setq auto-revert-interval 0.5)

(setq +org-capture-todo-file "roam/todo.org")

;; (setq org-fold-core-style "overlays") ;; see https://github.com/org-roam/org-roam/issues/2198#issuecomment-1208072780

(setq +notmuch-sync-backend 'mbsync)


(add-to-list 'load-path "/Users/johnwang/.nix-profile/share/emacs/site-lisp/mu4e") ;; according to the troubleshooting for mu4e



(after! org
(add-to-list 'org-latex-packages-alist '("" "listings"))
(add-to-list 'org-latex-packages-alist '("" "color"))
(add-to-list 'org-latex-packages-alist '("" "minted"))
(add-to-list 'org-latex-packages-alist '("" "svg"))
 (setq org-fold-core-style 'overlays) ;; Apparently necassary to stop org folding from breaking
  )
(setq org-latex-src-block-backend 'minted) ;; add source blocks
(setq org-latex-pdf-process '("LC_ALL=en_US.UTF-8 latexmk -f -pdf -%latex -shell-escape -interaction=nonstopmode -output-directory=%o %f"))


(after! org-roam-dailies
(add-to-list 'org-roam-dailies-capture-templates '("p" "pomodoro" entry "* %<%R>\n%?"
                                                   :target
  (file+head+olp "%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d>\n" ("Pomodoros"))))
(add-to-list 'org-roam-dailies-capture-templates '("j" "Journal" entry "* %<%T>\n%?"
                                                   :target
  (file+head+olp "%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d>\n" ("Journal"))))

  )

;; (add-to-list 'org-capture-templates '("P" "pomodoro" entry "* %<%R>\n%?"
;;   (file+headline "%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d>\n" ("Pomodoros"))))

;; ;; ("t" "Personal todo" entry
;;   ;; (file+headline +org-capture-todo-file "Inbox")
;;   ;; "* [ ] %?\n%i\n%a" :prepend t)

;;   )

(map! :leader :desc "Capture my pomodoro " :n "1" (cmd! (org-roam-dailies-capture-today nil "p")))
(map! :leader :desc "Go to today" :n "2" (cmd! (org-roam-dailies-capture-today t "d")))
(map! :leader :desc "Do a journal entry" :n "3" (cmd! (org-roam-dailies-capture-today nil "j")))
(setq prolog-system 'swi) ;; prolog stuff

;; perl is ba
(add-to-list 'auto-mode-alist '("\\.\\(pl\\|pro\\|lgt\\)" . prolog-mode))



;; secrets
(when (file-exists-p "~/.doom.d/secrets.el")
    (load  "~/.doom.d/secrets.el"))

(defun create-custom-buffer ()
  "Create a custom buffer with a larger text size."
  (interactive)
  (let ((buffer (generate-new-buffer "custom-buffer")))
    (with-current-buffer buffer
      ;; Set a larger text size
      (setq buffer-face-mode-face '(:height 250))
      (buffer-face-mode)
      ;; Set your formatting here (like line-spacing, font, etc.)
      (setq line-spacing nil)
      ;; Display the buffer in a side window
      (display-buffer-in-side-window buffer '((side . top))))
    buffer))  ;; return the buffer

(defun read-from-pipe ()
  "Read from the specified PIPE and append to custom-buffer."
  (interactive)
  (let* ((buffer (create-custom-buffer))  ;; create the buffer first
         (window (get-buffer-window buffer 0))  ;; get the window displaying the buffer
         (process (start-process "pipe-process" nil "sptlrx" "pipe")))
    (set-process-filter process
                        (lambda (_process output)
                          (with-current-buffer buffer
                            (goto-char (point-max))  ;; go to the end of the buffer
                            (insert output)  ;; insert the process output
                            ;; scroll to the last two lines
                            (set-window-start window (line-beginning-position -1))  ;; if it doesn't work, try replacing -1 with -2
                            (set-window-point window (point-max)))))  ;; move the point to the end of the buffer
    ;; Optional: Kill the process when the associated buffer is killed.
    (set-process-sentinel process
                          (lambda (process event)
                            (when (= 0 (process-exit-status process))
                              (kill-process process))))))

(defun start-pipe-reading ()
  "Create a custom buffer and start reading from a pipe."
  (interactive)
  (call-interactively #'read-from-pipe))


(global-activity-watch-mode)

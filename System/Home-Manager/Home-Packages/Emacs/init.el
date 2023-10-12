(start-process-shell-command "PolyBar StartUp" "*Messages*" "polybar Thanatos")

(start-process-shell-command "volctl" "*Messages*" "volctl")

(start-process-shell-command "nm-applet" "*Messages*" "nm-applet")

(setq package-enable-at-startup nil)

(setq use-package-always-ensure t) ;Adds the require argument to all use-package statements.

(setq vc-follow-symlinks t)

(setq undo-tree-history-directory-alist '(("." . "~/.config/emacs/backup-files")))
(setq backup-directory-alist '(("." . "~/.config/emacs/backup-files")))

(setq warning-minimum-level ":error")

(server-start)

(menu-bar-mode -1)

(tool-bar-mode -1)

(scroll-bar-mode -1)

(set-fringe-mode 5)

(global-hl-line-mode 1)

(setq column-number-mode t)

(bookmark-load bookmark-default-file t)

(add-to-list 'auto-mode-alist '("\\.md\\'" . text-mode))

(defvar Tn/default-font-size 120)

(set-face-attribute 'default nil
                    :font "Iosevka"
                    :weight 'regular
                    :height 180)

(set-face-attribute 'fixed-pitch nil
                    :font "Iosevka"
                    :weight 'semibold
                    :height 180)

(set-face-attribute 'variable-pitch nil
                    :font "FiraGo"
                    :weight 'regular
                    :height 180)

(prefer-coding-system 'utf-8)
(when (display-graphic-p)
  (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING)))

(global-display-line-numbers-mode t)

(dolist (mode '(pdf-view-mode-hook
                term-mode-hook
                shell-mode-hook
                eww-mode-hook
                text-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(setq calendar-latitude 42.33
      calendar-longitude -83.04
      calendar-location-name "Detroit,MI"
      user-login-name "xin"
      user-mail-address "xin@ironshark.org")

(global-visual-line-mode t)

(setq-default fill-column 80)

(setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))

(global-set-key (kbd "<escape>")  'keyboard-escape-quit)

(defadvice keyboard-escape-quit (around my-keyboard-escape-quit activate)
  (let (orig-one-window-p)
    (fset 'orig-one-window-p (symbol-function 'one-window-p))
    (fset 'one-window-p (lambda (&optional nomini all-frames) t))
    (unwind-protect
        ad-do-it
      (fset 'one-window-p (symbol-function 'orig-one-window-p)))))

(global-set-key (kbd "C-x c")  'centered-cursor-mode)

(global-set-key (kbd "C-S-v") 'clipboard-yank)
(global-set-key (kbd "C-S-c") 'clipboard-kill-ring-save)
(global-set-key (kbd "C-S-x") 'clipboard-kill-region)

(add-hook 'before-save-hook #'whitespace-cleanup)
(setq-default sentence-end-double-space nil)

(global-auto-revert-mode 1)

(fset 'yes-or-no-p 'y-or-n-p)

(setq visible-bell t
      ring-bell-function 'ignore)

(show-paren-mode t)

(setq-default indent-tabs-mode nil)

(use-package burly)

(defun Tn/exwm-update-title ()
  (pcase exwm-class-name
    ("firefox" (exwm-workspace-rename-buffer (format "Firefox: %s" exwm-title))
     (setq mode-line-format nil))
    ("obsidian" (exwm-input-release-keyboard)
     (setq mode-line-format nil))
    ("Alacritty" (exwm-input-release-keyboard)
     (setq mode-line-format nil))
    ("krita" (exwm-input-release-keyboard)
     (setq mode-line-format nil))
    ("Blender" (exwm-input-release-keyboard)
     (setq mode-line-format nil))
    ("Gimp" (exwm-input-release-keyboard)
     (setq mode-line-format nil))
    ("discord" (exwm-input-release-keyboard)
     (setq mode-line-format nil))
    ("Bitwarden" (exwm-input-release-keyboard)
     (setq mode-line-format nil))
    ("ffxiv_dx11.exe" (exwm-input-release-keyboard)
     (setq mode-line-format nil))
    ("XIVLauncher.Core" (exwm-input-release-keyboard)
     (setq mode-line-format nil))))

(defun Tn/dmenu-launch ()
  (interactive)
  (execute-extended-command "" "dmenu"))

(defun Tn/lock-screen ()
  (interactive)
  (shell-command "sudo slock"))

(defun Tn/audio-up ()
  (interactive)
  (shell-command "pulseaudio-ctl up"))

(defun Tn/audio-down ()
  (interactive)
  (shell-command "pulseaudio-ctl down"))

(defun Tn/audio-mute ()
  (interactive)
  (shell-command "pulseaudio-ctl mute"))

(defun Tn/single-collumn-template ()
  (interactive)
  (bookmark-jump "Burly: single-collumn"))

(defun Tn/double-collumn-template ()
  (interactive)
  (bookmark-jump "Burly: double-collumn"))

(defun Tn/triple-collumn-template ()
  (interactive)
  (bookmark-jump "Burly: triple-collumn"))

(defun Tn/left-focus-collumn-template ()
  (interactive)
  (bookmark-jump "Burly: left-focus-collumn"))

(defun Tn/right-focus-collumn-template ()
  (interactive)
  (bookmark-jump "Burly: right-focus-collumn"))

(defun Tn/center-focus-collumn-template ()
  (interactive)
  (bookmark-jump "Burly: center-focus-collumn"))

(defun Tn/brightness-up ()
  (interactive)
  (shell-command "sudo light -A 5"))

(defun Tn/brightness-down ()
  (interactive)
  (shell-command "sudo light -U 5"))

(use-package exwm
  :config

(require 'exwm-systemtray)
(exwm-systemtray-enable)

(setq exwm-workspace-number 9)

(setq exwm-layout-show-all-buffers t)

;(setq exwm-workspace-show-all-buffers t)

(setq exwm-input-prefix-keys
  '(?\C-x
    ?\C-u
    ?\C-h
    ?\M-x
    ?\M-`
    ?\M-&
    ?\M-:
    ?\C-c
    ?\C-\M-j  ;; Buffer list
    ?\C-\     ;; Ctrl+Space
    ))

(define-key exwm-mode-map [?\C-q] 'exwm-input-send-next-key)

(setq exwm-input-global-keys
      `(

([?\s-r] . exwm-reset)

([?\s-c] . org-capture)

([?\s-a] . org-agenda)

([?\s-\M-a] . org-agenda-exit)

([?\s-`] . (lambda (command)
             (interactive (list (read-shell-command "$ ")))
             (start-process-shell-command command nil command)))

([s-left] . windmove-left)
([s-right] . windmove-right)
([s-up] . windmove-up)
([s-down] . windmove-down)

([?\s-\ ] . helm-buffers-list)
([s-backspace] . ibuffer)
([?\s-b] . switch-to-buffer)
([\C-s-right] . next-buffer)
([\C-s-left] . previous-buffer)

([?\s-x] . Tn/dmenu-launch)
([?\s-f] . helm-find-files)
([?\s-q] . Tn/lock-screen)

([?\s-p] . helm-projectile)

([?\s-.] . Tn/audio-up)
([?\s-,] . Tn/audio-down)
([?\s-/] . Tn/audio-mute)

([?\s->] . Tn/brightness-up)
([?\s-<] . Tn/brightness-down)

([?\s-\C-1] . Tn/single-collumn-template)
([?\s-\C-2] . Tn/double-collumn-template)
([?\s-\C-3] . Tn/triple-collumn-template)
([?\s-\C-4] . Tn/left-focus-collumn-template)
([?\s-\C-4] . Tn/right-focus-collumn-template)
([?\s-\C-4] . Tn/center-focus-collumn-template)

([?\s-=] . balance-windows)
([?\s-D] . kill-buffer-and-widow)
([?\s-d] . kill-this-buffer)
([?\s-\M-1] . delete-other-windows)
([?\s-\M-2] . split-window-below)
([?\s-\M-3] . split-window-right)
([?\s-0] . delete-window)
([?\s-|] . enlarge-window)
([?\s-}] . enlarge-window-horizontally)
([?\s-{] . shrink-window-horizontally)

,@(mapcar (lambda (i)
            `(,(kbd (format "s-%d"  i)) .
              (lambda ()
                (interactive)
                (exwm-workspace-switch-create ,(- i 1)))))
          (number-sequence 1 9))

))

(unless (get 'exwm-input-simulation-keys 'saved-value)
  (setq exwm-input-simulation-keys
        '(([?\C-b] . [left])
          ([?\C-f] . [right])
          ([?\C-p] . [up])
          ([?\C-n] . [down])
          ([?\C-a] . [home])
          ([?\C-e] . [end])
          ([?\M-v] . [prior])
          ([?\C-v] . [next])
          ([?\C-d] . [delete])
          ([?\C-k] . [S-end delete]))))

(add-hook 'exwm-update-class-hook
          (lambda ()
          (exwm-workspace-rename-buffer exwm-class-name)))

(add-hook 'exwm-update-title-hook #'Tn/exwm-update-title)

(exwm-enable))

(use-package helm)
(setq helm-mode-fuzzy-match t)
(helm-mode 1)

(setq _helm-exciting-buffer-regexp-list
      (quote
       ("\\*magit:"
        )))

(setq helm-boring-buffer-regexp-list
      (quote
       (  "\\Minibuf.+\\*"
               "\\` "
               "\\*.+\\*"
                  )))

;(global-set-key (kbd "M-x") 'helm-M-x)

(global-set-key (kbd "C-x C-f") 'helm-find-files)

(define-key helm-find-files-map (kbd "<SPC>") 'helm-find-files-up-one-level)

(use-package helm-projectile)

(custom-set-variables
 '(git-gutter:modified-sign "~")
 '(org-export-backends '(ascii html icalendar latex md odt freemind)))

(use-package emojify)

(use-package all-the-icons
  :init
  (unless (member "all-the-icons" (font-family-list))
    (all-the-icons-install-fonts t)))

(defvar ligatures-fixed '("|||>" "<|||" "<==>" "<!--" "####" "~~>" "***" "||=" "||>"
                                     ":::" "::=" "=:=" "===" "==>" "=!=" "=>>" "=<<" "=/=" "!=="
                                     "!!." ">=>" ">>=" ">>>" ">>-" ">->" "->>" "-->" "---" "-<<"
                                     "<~~" "<~>" "<*>" "<||" "<|>" "<$>" "<==" "<=>" "<=<" "<->"
                                     "<--" "<-<" "<<=" "<<-" "<<<" "<+>" "</>" "###" "#_(" "..<"
                                     "..." "+++" "/==" "///" "_|_" "www" "&&" "^=" "~~" "~@" "~="
                                     "~>" "~-" "**" "*>" "*/" "||" "|}" "|]" "|=" "|>" "|-" "{|"
                                     "[|" "]#" "::" ":=" ":>" ":<" "$>" "==" "=>" "!=" "!!" ">:"
                                     ">=" ">>" ">-" "-~" "-|" "->" "--" "-<" "<~" "<*" "<|" "<:"
                                     "<$" "<=" "<>" "<-" "<<" "<+" "</" "#{" "#[" "#:" "#=" "#!"
                                     "##" "#(" "#?" "#_" "%%" ".=" ".-" ".." ".?" "+>" "++" "?:"
                                     "?=" "?." "??" ";;" "/*" "/=" "/>" "//" "__" "~~" "(*" "*)"
                                     "\\\\" "://"))

(use-package ligature
  :config
  (ligature-set-ligatures 't ligatures-fixed)
  (global-ligature-mode t))

(use-package centered-cursor-mode)

(use-package rainbow-delimiters
  :init (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package smartparens
  :config
  (setq sp-show-pair-from-inside nil)
  (require 'smartparens-config)
  :diminish smartparens-mode)

(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

(use-package doom-themes
  :init (load-theme 'doom-city-lights t))

(use-package evil
  :init
  (setq evil-want-integration t
       evil-want-keybinding nil
       evil-want-C-u-scroll t
       evil-want-C-i-jump nil
       evil-respect-visual-line-mode t
       evil-undo-system 'undo-tree)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)
  (define-key evil-normal-state-map (kbd "<SPC>") 'helm-occur)
  (define-key evil-normal-state-map (kbd "/") 'helm-regexp)
  (evil-ex-define-cmd "q" 'kill-this-buffer) ;Evil nomral mode ':q' kills active buffer
  (evil-ex-define-cmd "Q" 'kill-buffer-and-window)) ; Evil normal mode ':Q' kills buffer and window

(use-package evil-snipe
  :after evil
  :config
  (evil-snipe-mode +1)
  (evil-snipe-override-mode +1))

(add-hook 'magit-mode-hook 'turn-off-evil-snipe-override-mode)
(evil-define-key 'visual evil-snipe-local-mode-map "z" 'evil-snipe-s)
(evil-define-key 'visual evil-snipe-local-mode-map "Z" 'evil-snipe-S)

(evil-define-key '(normal motion) evil-snipe-local-mode-map
  "s" 'evil-snipe-j
  "t" 'evil-snipe-J)

(evil-define-key 'motion evil-snipe-override-local-mode-map
  "S" 'evil-snipe-t
  "T" 'evil-snipe-T)

(use-package evil-easymotion
  :after evil evil-snipe
  :config
  (evilem-default-keybindings "RET")
  (define-key evilem-map "n" #'evilem-motion-next-line)
  (define-key evilem-map "e" #'evilem-motion-previous-line)
  (define-key evilem-map "N" #'evil-scroll-page-down)
  (define-key evilem-map "E" #'evil-scroll-page-up)
  (define-key evilem-map "T" #'evil-scroll-line-to-center)
  (define-key evilem-map "S" #'centered-cursor-mode)
  (define-key evilem-map "x" #'eval-region)
  (define-key evilem-map "t" #'evil-snipe-s)
  (define-key evilem-map "s" #'evil-snipe-S))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

(defun  Tn/evil-collection-colemak (_mode mode-keymaps &rest _rest)
  (evil-collection-translate-key 'normal mode-keymaps
    "m" "h"
    "n" "j"
    "e" "k"
    "i" "l"
    "h" "m"
    "j" "n"
    "k" "e"
    "l" "i"))

;; called after evil-collection makes its keybindings
(add-hook 'evil-collection-setup-hook #'Tn/evil-collection-colemak)

(use-package evil-colemak-basics
  :after evil evil-snipe
  :diminish global-evil-colemak-basis-mode
  :init
  (setq evil-colemak-basics-layout-mod 'mod-dh)
  (setq evil-colemak-basics-char-jump-commands 'evil-snipe)
  :config
  (global-evil-colemak-basics-mode))

(setq ibuffer-formats
      '((mark modified read-only " "
              (name 40 40 :left :elide) ; change: 30s were originally 18s
              " "
              (size 9 -1 :right)
              " "
              (mode 9 9 :left :elide)
              " " filename-and-process)
        (mark " "
              (name 16 -1)
              " " filename)))

(with-eval-after-load 'ibuf-ext
  ;; Create a case-insensitive ibuffer sort command.  Derived from
  ;; `ibuffer-do-sort-by-alphabetic' which is defined in ibuf-ext.el
  ;; by (define-ibuffer-sorter alphabetic ...).
  (define-ibuffer-sorter alphabetic-ignore-case
    "Sort the buffers by their names, ignoring case."
    (:description "buffer name")
    (string-collate-lessp
     (buffer-name (car a))
     (buffer-name (car b))
     nil t))
  ;; Assign the new command to the 'Name' header keymap.
  (define-key ibuffer-name-header-map [(mouse-1)]
    'ibuffer-do-sort-by-alphabetic-ignore-case)
  (put 'ibuffer-make-column-name 'header-mouse-map
       ibuffer-name-header-map))

(setq-default ibuffer-default-sorting-mode 'alphabetic-ignore-case)

(add-hook 'ibuffer-mode-hook #'ibuffer-auto-mode)

(setq ibuffer-expert t)
(remove-hook 'kill-buffer-query-functions 'process-kill-buffer-query-function)

(use-package helpful
  :commands (helpful-callable helpful-variable helpful-command helpful-key)
  :bind
  ([remap describe-command] . helpful-command)
  ([remap describe-key] . helpful-key))

(use-package which-key
  :diminish which-key-mode
  :config
  (which-key-mode)
  (setq which-key-idle-delay 1))

(use-package undo-tree)
(global-undo-tree-mode 1)

(use-package dmenu)

(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda ()
                   (flyspell-mode 1))))

(add-hook 'prog-mode-hook #'flyspell-prog-mode)

(add-hook 'text-mode-hook #'flyspell-mode)

(use-package magit)

(add-hook 'with-editor-mode-hook 'evil-insert-state)

(use-package git-gutter)

(custom-set-variables
 '(git-gutter:modified-sign "~")) ;; two space

(set-face-foreground 'git-gutter:modified "deep sky blue") ;; background color
(set-face-foreground 'git-gutter:added "green")
(set-face-foreground 'git-gutter:deleted "red")

(global-set-key (kbd "C-c G") 'git-gutter-mode)

(use-package projectile
  :init
  (projectile-mode +1))

;; (setq  projectile-project-search-path '("~/Projects" "~/Grimoire"))

(use-package ag)

(use-package rg)

(global-set-key (kbd "C-s") #'rg-menu)

(use-package nix-mode
  :mode "\\.nix\\'")

(use-package org-bullets
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

(use-package org-appear)
(add-hook 'org-mode-hook 'org-appear-mode)

(setq org-appear-trigger 'manual)
(add-hook 'org-mode-hook (lambda ()
                           (add-hook 'evil-insert-state-entry-hook
                                     #'org-appear-manual-start
                                     nil
                                     t)
                           (add-hook 'evil-insert-state-exit-hook
                                     #'org-appear-manual-stop
                                     nil
                                     t)))

(defun Tn/org-mode-setup ()
  (org-indent-mode 1)
  (variable-pitch-mode 1)
  (auto-fill-mode 0)
  (visual-line-mode 1)
  (display-line-numbers-mode 0)
  (setq evil-auto-indent nil
        org-src-preserve-indentation nil
        org-edit-src-content-indentation 0))

(defun Tn/org-font-setup ()

(font-lock-add-keywords 'org-mode
                        '(("^ *\\([-]\\) "
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

(dolist (face '((org-level-1 . 1.1)
                (org-level-2 . 1.1)
                (org-level-3 . 1.1)
                (org-level-4 . 1.1)
                (org-level-5 . 1.1)
                (org-level-6 . 1.1)
                (org-level-7 . 1.1)
                (org-level-8 . 1.1)))
  (set-face-attribute (car face) nil :font "FiraGO" :weight 'regular :height (cdr face)))

(set-face-attribute 'org-block nil    :foreground nil :inherit 'fixed-pitch)
(set-face-attribute 'org-table nil    :inherit 'fixed-pitch)
(set-face-attribute 'org-formula nil  :inherit 'fixed-pitch)
(set-face-attribute 'org-code nil     :inherit '(shadow fixed-pitch))
(set-face-attribute 'org-table nil    :inherit '(shadow fixed-pitch))
(set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
(set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
(set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
(set-face-attribute 'org-checkbox nil  :inherit 'fixed-pitch)
(set-face-attribute 'line-number nil :inherit 'fixed-pitch)
(set-face-attribute 'line-number-current-line nil :inherit 'fixed-pitch)

)

(defun Tn/org-find-time-file-property (property &optional anywhere)
  "Return the position of the time file PROPERTY if it exists.
When ANYWHERE is non-nil, search beyond the preamble."
  (save-excursion
    (goto-char (point-min))
    (let ((first-heading
           (save-excursion
             (re-search-forward org-outline-regexp-bol nil t))))
      (when (re-search-forward (format "^#\\+%s:" property)
                               (if anywhere nil first-heading)
                               t)
        (point)))))

(defun Tn/org-has-time-file-property-p (property &optional anywhere)
  "Return the position of time file PROPERTY if it is defined.
As a special case, return -1 if the time file PROPERTY exists but
is not defined."
  (when-let ((pos (Tn/org-find-time-file-property property anywhere)))
    (save-excursion
      (goto-char pos)
      (if (and (looking-at-p " ")
               (progn (forward-char)
                      (org-at-timestamp-p 'lax)))
          pos
        -1))))

(defun Tn/org-set-time-file-property (property &optional anywhere pos)
  "Set the time file PROPERTY in the preamble.
When ANYWHERE is non-nil, search beyond the preamble.
If the position of the file PROPERTY has already been computed,
it can be passed in POS."
  (when-let ((pos (or pos
                      (Tn/org-find-time-file-property property))))
    (save-excursion
      (goto-char pos)
      (if (looking-at-p " ")
          (forward-char)
        (insert " "))
      (delete-region (point) (line-end-position))
      (let* ((now (format-time-string "[%Y-%m-%d %a %H:%M]")))
        (insert now)))))

(defun Tn/org-set-last-modified ()
  "Update the LAST_MODIFIED file property in the preamble."
  (when (derived-mode-p 'org-mode)
    (Tn/org-set-time-file-property "LAST_MODIFIED")))

;; (setq org-capture-templates
;;   '(("j" "Journal Entry"
;;          entry (file+datetree "~/Grimoire/temp-journal.org")
;;          "* %<%H:%M> %?"
;;          :empty-lines 1)
;;     ("f" "Food Log"
;;          entry (file+datetree "~/Grimoire/temp-food-log.org")
;;          "* %<%H:%M> %?"
;;          :empty-lines 1)))

(add-hook 'org-capture-mode-hook 'evil-insert-state)

;; (setq org-agenda-files (append
                        ;; (directory-files-recursively "~/Grimoire/" "\\.org$")
                        ;; (directory-files-recursively "~/Projects/" "\\.org$")
                        ;; ))

;; (define-key org-agenda-mode-map "j" 'evil-next-line)
;; (define-key org-agenda-mode-map "k" 'evil-previous-line)

(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
              (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE" "MEETING"))))

(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "cyan" :weight bold)
              ("NEXT" :foreground "SeaGreen1" :weight bold)
              ("DONE" :foreground "dim gray" :weight bold)
              ("WAITING" :foreground "deep pink" :weight bold)
              ("HOLD" :foreground "blue violet" :weight bold)
              ("CANCELLED" :foreground "dark red" :weight bold)
              ("MEETING" :foreground "gainboro" :weight bold)
              ("PHONE" :foreground "gainboro" :weight bold))))

(add-to-list 'org-structure-template-alist
             '("en" . "src nix"))

(defun Tn/org-mode-visual-fill ()
  (setq visual-fill-column-width 100
        visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package org

:hook (org-mode . Tn/org-mode-setup)
      (org-mode . Tn/org-font-setup)
      (after-save . org-babel-tangle)
      (before-save . Tn/org-set-last-modified)

:config
(setq org-ellipsis " ▾"
      org-hide-emphasis-markers t
      org-src-fontify-natively t
      org-fontify-quote-and-verse-blocks t
      org-src-tab-acts-natively t
      org-edit-src-content-indentation 2
      org-hide-block-startup nil
      org-src-preserve-indentation nil
      org-startup-folded t
      org-startup-with-inline-images t
      org-cycle-separator-lines 2
      org-confirm-babel-evaluate nil
      org-capture-bookmark nil)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (lisp . t)
   (latex . t)
   (scheme . t)))

(push '("conf-unix" . conf-unix) org-src-lang-modes)

)

(require 'org-tempo)
(add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))

(require 'org-agenda)

(define-key org-agenda-mode-map (kbd "n") 'org-agenda-next-line)
(define-key org-agenda-mode-map (kbd "e") 'org-agenda-previous-line)

(define-key org-agenda-mode-map (kbd "n") 'org-agenda-goto-date)

(define-key org-agenda-mode-map (kbd "p") 'org-agenda-capture)

(define-key org-agenda-mode-map (kbd "<SPC>") 'helm-occur)

(define-key org-agenda-mode-map (kbd "s-A") 'org-agenda-exit)

(use-package ox-hugo
  :after ox)

(use-package visual-fill-column
  :hook (org-mode . Tn/org-mode-visual-fill))

(use-package aggressive-indent)
(global-aggressive-indent-mode 1)

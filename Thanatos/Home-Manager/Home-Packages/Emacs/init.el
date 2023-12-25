(server-start)

(bookmark-load bookmark-default-file t)

(setq warning-minimum-level ":error")

(setq package-enable-at-startup nil
      use-package-always-ensure t
      vc-follow-symlinks t)

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

(defvar Tn/default-font-size 120)

(prefer-coding-system 'utf-8)
(when (display-graphic-p)
  (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING)))

(setq calendar-latitude 39.96
      calendar-longitude -82.99
      calendar-location-name "Columbus,OH"
      user-login-name "xin"
      user-mail-address "xin@ironshark.org")

(menu-bar-mode -1)
(tool-bar-mode -1)
(show-paren-mode t)
(set-fringe-mode 5)
(scroll-bar-mode -1)
(global-hl-line-mode 1)
(global-auto-revert-mode 1)
(global-visual-line-mode t)
(global-display-line-numbers-mode t)
(winner-mode +1)

(setq visible-bell t
      column-number-mode t
      ring-bell-function 'ignore
      initial-major-mode 'org-mode
      visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))

(setq-default fill-column 80
              indent-tabs-mode nil
              sentence-end-double-space nil)

(fset 'yes-or-no-p 'y-or-n-p)

(dolist (mode '(pdf-view-mode-hook
                term-mode-hook
                org-mode-hook
                shell-mode-hook
                eww-mode-hook
                text-mode-hook
                scad-preview-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

(use-package doom-themes
  :init (load-theme 'doom-city-lights t))

(defadvice keyboard-escape-quit (around my-keyboard-escape-quit activate)
  (let (orig-one-window-p)
    (fset 'orig-one-window-p (symbol-function 'one-window-p))
    (fset 'one-window-p (lambda (&optional nomini all-frames) t))
    (unwind-protect
        ad-do-it
      (fset 'one-window-p (symbol-function 'orig-one-window-p)))))

(global-set-key (kbd "<escape>")  'keyboard-escape-quit)
(global-set-key (kbd "C-x c")  'centered-cursor-mode)
(global-set-key (kbd "C-S-v") 'clipboard-yank)
(global-set-key (kbd "C-S-c") 'clipboard-kill-ring-save)
(global-set-key (kbd "C-S-x") 'clipboard-kill-region)
(global-set-key (kbd "C-M-u") 'universal-argument)

(define-key winner-mode-map (kbd "<C-s-left>") #'winner-undo)
(define-key winner-mode-map (kbd "<C-s-right>") #'winner-redo)

(defun Tn/exwm-update-title ()
  (pcase exwm-class-name

    ("firefox" (exwm-workspace-rename-buffer (format "Firefox: %s" exwm-title))
     (setq mode-line-format nil))

    ("OpenSCAD" (exwm-input-release-keyboard)
     (setq mode-line-format nil))

    ("SCAD/Preview" (exwm-input-release-keyboard)
     (setq mode-line-format nil))

    ("discord" (exwm-input-release-keyboard)
     (setq mode-line-format nil))

    ("Alacritty" (exwm-input-release-keyboard)
     (setq mode-line-format nil))

    ("Bitwarden" (exwm-input-release-keyboard)
     (setq mode-line-format nil))))

(defun Tn/dmenu-launch ()
  (interactive)
  (execute-extended-command "" "dmenu"))

(defun Tn/lock-screen ()
  (interactive)
  (shell-command "sudo slock"))

(defun Tn/audio-set ()
  (interactive)
  (execute-extended-command "" "alsamixer-set-volume"))

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

(use-package burly)

(use-package alsamixer)

(use-package exwm
  :config

(exwm-enable)

(require 'exwm-systemtray)
(exwm-systemtray-enable)

(setq exwm-workspace-number 9
      exwm-layout-show-all-buffers t
      exwm-workspace-show-all-buffers t)

(add-hook 'exwm-update-class-hook
          (lambda ()
          (exwm-workspace-rename-buffer exwm-class-name)))

(add-hook 'exwm-update-title-hook #'Tn/exwm-update-title)

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
([?\s-s] . Tn/save-and-magit)

([?\s-.] . alsamixer-up-volume)
([?\s-,] . alsamixer-down-volume)
([?\s-\M-/] . Tn/audio-set)
([?\s-/] . alsamixer-toggle-mute)

([?\s->] . Tn/brightness-up)
([?\s-<] . Tn/brightness-down)

([?\s-t] . Tn/org-agenda-day)
([?\s-w] . Tn/org-agenda-week)

([?\s-i] . Tn/org-clock-in)
([?\s-o] . Tn/org-clock-out)

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
))) ;; last paren closes exwm block

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

(use-package aggressive-indent)
(global-aggressive-indent-mode 1)

(use-package rainbow-delimiters
  :init
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package smartparens
  :init
  (add-hook 'prog-mode-hook #'smartparens-mode)
  (add-hook 'org-mode-hook #'smartparens-mode)

  :config
  (setq sp-show-pair-from-inside nil)
  (require 'smartparens-config)

  :diminish
  smartparens-mode)

(add-hook 'before-save-hook #'whitespace-cleanup)

(add-to-list 'auto-mode-alist '("\\.md\\'" . text-mode))

(use-package nix-mode
  :mode "\\.nix\\'")

(use-package helm)
(helm-mode 1)

(setq helm-mode-fuzzy-match t)

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

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(define-key helm-find-files-map (kbd "<SPC>") 'helm-find-files-up-one-level)

(use-package helm-projectile)

(use-package helm-bibtex
  :config
  (setq org-cite-follow-processor 'helm-bibtex-org-cite-follow
        bibtex-completion-pdf-symbol "⌘"
        bibtex-completion-notes-symbol "✎"))

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

(add-hook 'with-editor-mode-hook 'evil-insert-state)

(use-package evil-snipe
  :after evil
  :config
  (evil-snipe-mode +1)
  (evil-snipe-override-mode +1))

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

(setq ibuffer-expert t)
(setq-default ibuffer-default-sorting-mode 'alphabetic-ignore-case)

(add-hook 'ibuffer-mode-hook #'ibuffer-auto-mode)
(remove-hook 'kill-buffer-query-functions 'process-kill-buffer-query-function)

(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda ()
                   (flyspell-mode 1))))

(add-hook 'prog-mode-hook #'flyspell-prog-mode)
(add-hook 'text-mode-hook #'flyspell-mode)

(use-package undo-tree)
(global-undo-tree-mode 1)
(setq undo-tree-history-directory-alist '(("." . "~/.config/emacs/backup-files"))
      backup-directory-alist '(("." . "~/.config/emacs/backup-files")))

(use-package magit)
(add-hook 'magit-mode-hook 'turn-off-evil-snipe-override-mode)

(defun Tn/save-and-magit ()
  "Save the current buffer and call Magit status."
  (interactive)
  (save-buffer)
  (magit-status))

(use-package projectile
  :init
  (projectile-mode +1))

;; (setq  projectile-project-search-path '("~/Projects" "~/Grimoire"))

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

(use-package org-bullets
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

(use-package org-appear)

(setq org-appear-trigger 'manual
      org-appear-autoemphasis t
      org-appear-autolinks t
      org-link-descriptive t
      org-pretty-entities t
      org-appear-autoentities t
      org-appear-autosubmarkers t
      org-appear-autokeywords t
      org-hidden-keywords t
      org-appear-inside-latex t)

(add-hook 'org-mode-hook 'org-appear-mode)

(add-hook 'org-mode-hook (lambda ()
                           (add-hook 'evil-insert-state-entry-hook
                                     #'org-appear-manual-start
                                     nil
                                     t)
                           (add-hook 'evil-insert-state-exit-hook
                                     #'org-appear-manual-stop
                                     nil
                                     t)))

(defun Tn/org-mode-visual-fill ()
  (setq visual-fill-column-width 100
        visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package visual-fill-column
  :hook (org-mode . Tn/org-mode-visual-fill))

(use-package ox-hugo
  :after ox)

(setq org-export-backends '(ascii html icalendar latex md odt freemind))

(require 'org-tempo)
(add-to-list 'org-structure-template-alist
             '("el" . "src emacs-lisp\n"))
(add-to-list 'org-structure-template-alist
             '("en" . "src nix\n"))

(defun Tn/org-mode-setup ()
  (org-indent-mode 1)
  (variable-pitch-mode 1)
  (auto-fill-mode 0)
  (visual-line-mode 1))

(add-hook 'org-capture-mode-hook 'evil-insert-state)
(add-hook 'org-log-buffer-setup-hook 'evil-insert-state)

(defun Tn/org-font-setup ()
;; This is magic code that changes the font of non-heading bullet point lists.
(font-lock-add-keywords 'org-mode
                        '(("^ *\\([-]\\) "
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

(dolist (face '((org-level-1 . "Azure3")
                (org-level-2 . "Azure3")
                (org-level-3 . "Azure3")
                (org-level-4 . "Azure3")
                (org-level-5 . "Azure3")
                (org-level-6 . "Azure3")
                (org-level-7 . "Azure3")
                (org-level-8 . "Azure3")))
  (set-face-attribute (car face) nil :font "Iosevka"
                      :weight 'regular :height 1.3
                      :foreground (cdr face)))

(set-face-attribute 'org-link nil    :foreground "dark cyan" :inherit 'fixed-pitch)
(set-face-attribute 'org-tag nil     :height 0.9 :inherit 'fixed-pitch)
(set-face-attribute 'org-block nil    :inherit 'fixed-pitch)
(set-face-attribute 'org-table nil    :foreground "dark cyan" :inherit 'fixed-pitch)
(set-face-attribute 'org-formula nil  :foreground "dark cyan" :inherit 'fixed-pitch)
(set-face-attribute 'org-code nil     :foreground "SpringGreen3"
                    :weight 'semi-bold :inherit '(shadow fixed-pitch))
(set-face-attribute 'org-verbatim nil :foreground "SpringGreen3"
                    :weight 'semi-bold :inherit '(shadow fixed-pitch))
(set-face-attribute 'org-table nil    :inherit '(shadow fixed-pitch))
(set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
(set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
(set-face-attribute 'org-checkbox nil  :inherit 'fixed-pitch)
(set-face-attribute 'line-number nil :inherit 'fixed-pitch)
(set-face-attribute 'line-number-current-line nil :inherit 'fixed-pitch))

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

(defun Tn/current-year () (interactive)
  (shell-command-to-string "echo -n $(date +%Y)"))

(setq org-capture-templates
  '(("j" "Journal Entry"
         (org-journal-open-current-journal-file)
         "* %<%H:%M> %?"
         :empty-lines 1)
    ("f" "Journal TODO"
         (org-journal-open-current-journal-file)
         entry (file (org-journal-open-current-journal-file))
         "* %<%H:%M> \n ** TODO %?"
         :empty-lines 1)))

(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "ACTIVE(a@/!)" "|" "DONE(d@/!)")
              (sequence "WAITING(w@/!)" "HOLD(h@/!)" "INACTIVE(i@/!)" "|" "CANCELLED(c@/!)"))))

(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "deep sky blue" :weight bold)
              ("NEXT" :foreground "medium spring green" :weight bold)
              ("ACTIVE" :foreground "cyan" :weight bold)
              ("DONE" :foreground "dim gray" :weight bold)
              ("WAITING" :foreground "blue violet" :weight bold)
              ("HOLD" :foreground "dark red" :weight bold)
              ("CANCELLED" :foreground "dim gray" :weight bold))))

(setq org-tag-alist
      '((:startgroup . ART)
        ("SCULPTURE" . ?s) ("ILLUSTRATION" . ?i) ("METAL-WORKING" . ?m)
        (:endgroup . ART)
        (:startgroup . TECHNOLOGY)
        ("PROGRAMMING" . ?p) ("CAD" . ?x)
        (:endgroup . TECHNOLOGY)
        (:startgroup . ACADEMIC)
        ("MATHS" . ?m)
        (:endgroup . ACADEMIC)
        (:startgroup . FITNESS)
        ("@CF-GYM" . ?g) ("@OLY-GYM" . ?o)
        (:endgroup . FITNESS)
        ("@Toby" . ?T)
        ("@PHONE" . ?P) ("@COMPUTER" . ?C) ("@CAR" . ?V)))

(setq org-ellipsis " ▾"
      org-hide-emphasis-markers t
      org-src-fontify-natively t
      org-fontify-quote-and-verse-blocks t
      org-fontify-done-headline t
      org-src-tab-acts-natively t
      org-hide-block-startup nil
      org-src-preserve-indentation nil
      org-startup-folded t
      org-treat-S-cursor-todo-selection-as-state-change nil
      org-startup-with-inline-images t
      org-cycle-separator-lines 2
      org-confirm-babel-evaluate nil
      org-capture-bookmark nil
      evil-auto-indent nil
      org-src-preserve-indentation nil
      org-export-with-todo-keywords nil
      org-edit-src-content-indentation 0
      org-return-follows-link t
      org-enforce-todo-dependencies t
      org-enforce-todo-checkbox-dependencies t
      org-odd-levels-only t
      org-fold-catch-invisible-edits 'show-and-error
      org-directory "~/Archive/Feronomicon/ORG/"
      org-archive-location (format
                            "~/Archive/Feronomicon/ORG/\%s-archive.org::datetree/"
                            (Tn/current-year)))

(use-package org
:hook
(org-mode . Tn/org-mode-setup)
(org-mode . Tn/org-font-setup)
(before-save . Tn/org-set-last-modified)

:config
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (lisp . t)
   (latex . t)
   (scheme . t)))

(push '("conf-unix" . conf-unix) org-src-lang-modes))

(global-set-key (kbd "C-c C-l") 'org-store-link)
(global-set-key (kbd "C-c l") 'org-insert-link)

(use-package org-roam
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n g" . org-roam-graph)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n e" . org-roam-dailies-capture-today)
         ("C-c n c" . org-roam-capture))

  :config
  (setq org-roam-directory (file-truename "~/Archive/Grimoire/")
        org-roam-dailies-directory (file-truename "~/Archive/Feronomicon/Notes/")
        org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))

  (org-roam-db-autosync-mode)
  (require 'org-roam-protocol))

;; (("d" "default" plain "%?"
;;   :target (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
;;                      "#+title: ${title}\n")
;;   :unnarrowed t))

;; (setq org-roam-dailies-capture-templates
;;       '(("d" "default" entry
;;          "* %?"
;;          :target (file+head "%<%Y-%m-%d>.org"
;;                             "#+title: %<%Y-%m-%d>\n"))))

(add-to-list 'display-buffer-alist
             '("\\*org-roam\\*"
               (display-buffer-in-direction)
               (direction . right)
               (window-width . 0.33)
               (window-height . fit-window-to-buffer)))

(use-package org-roam-bibtex
  :after org-roam
  :config
  (require 'org-ref))

(use-package org-roam-ui
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))

(use-package org-journal
  :bind
  (("C-c n n" . org-journal-new-entry)
   ("C-c n s" . org-journal-new-date-entry)))

(setq org-journal-dir (file-truename "~/Archive/Feronomicon/Journals/")
      org-enable-org-journal-support t
      org-journal-find-file #'find-file
      org-journal-enable-cache t
      org-journal-file-header "#+STARTUP: showeverything\n#+LAST_MODIFIED:\n\n"
      org-journal-file-format "%Y%m%d"
      org-journal-date-prefix "#+TITLE: "
      org-journal-date-format "%A  %Y-%m-%d"
      org-journal-time-prefix "* "
      org-journal-time-format "%H:%M"
      org-journal-start-on-weekday 0)

(require 'bibtex)

(setq bibtex-autokey-year-length 4
      bibtex-autokey-name-year-separator "-"
      bibtex-autokey-year-title-separator "-"
      bibtex-autokey-titleword-separator "-"
      bibtex-autokey-titlewords 2
      bibtex-autokey-titlewords-stretch 1
      bibtex-autokey-titleword-length 5
      bibtex-completion-format-citation-functions
  '((org-mode      . bibtex-completion-format-citation-org-title-link-to-PDF)
    (latex-mode    . bibtex-completion-format-citation-cite)
    (markdown-mode . bibtex-completion-format-citation-pandoc-citeproc)
    (default       . bibtex-completion-format-citation-default)))

(define-key bibtex-mode-map (kbd "H-b") 'org-ref-bibtex-hydra/body)

(use-package org-ref)

(setq bibtex-completion-bibliography '("~/Archive/Apocrypha/Org-Files/reference-index.bib")
      bibtex-completion-library-path '("~/Archive/Apocrypha/PDF/")
      bibtex-completion-notes-path '("~/Archive/Grimoire")
      bibtex-completion-pdf-extension '(".pdf" ".djvu", ".jpg")
      bibtex-completion-browser-function 'browser-url-firefox
      bibtex-completion-pdf-field "File"
      bibtex-completion-notes-template-multiple-files "* ${author-or-editor}, ${title}, ${journal}, (${year}) :${=type=}: \n\nSee [[cite:&${=key=}]]\n"
      bibtex-completion-additional-search-fields '(keywords)
      bibtex-completion-display-formats
        '((article       . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} ${journal:40}")
          (inbook        . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} Chapter ${chapter:32}")
          (incollection  . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} ${booktitle:40}")
          (inproceedings . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} ${booktitle:40}")
          (t             . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*}"))
        bibtex-completion-pdf-open-function
        (lambda (fpath)
          (call-process "open" nil 0 nil fpath)))

(use-package pdf-tools)

(require 'org-agenda)

(defun Tn/org-agenda-day ()
   (interactive)
   (let ((org-agenda-span 'day))
        (org-agenda nil "a")))

(defun Tn/org-agenda-week ()
   (interactive)
   (let ((org-agenda-span 'week))
        (org-agenda nil "a")))

(setq org-agenda-files (append (directory-files-recursively "~/Archive/" "\\todo.org$"))
      org-agenda-start-on-weekday 0
      org-agenda-skip-scheduled-if-done t
      org-agenda-skip-deadline-if-done t
      org-agenda-include-deadlines t
      org-agenda-window-setup 'only-window
      org-agenda-block-separator #x2501
      org-agenda-compact-blocks t
      org-agenda-start-with-log-mode t
      org-agenda-start-with-clockreport-mode t
      org-agenda-time-leading-zero t
      org-agenda-time-grid '((daily today require-timed)
 (100 200 300 400 500 600 700 800 900 1000 1100 1200 1300 1400 1500 1600 1700 1800 1900 2000 2100 2200 2300 0)
 " ----- " "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄"))

(define-key org-agenda-mode-map (kbd "n") 'evil-next-line)
(define-key org-agenda-mode-map (kbd "e") 'evil-previous-line)
(define-key org-agenda-mode-map (kbd "n") 'org-agenda-next-line)
(define-key org-agenda-mode-map (kbd "e") 'org-agenda-previous-line)
(define-key org-agenda-mode-map (kbd "j") 'org-agenda-goto-date)
(define-key org-agenda-mode-map (kbd "p") 'org-agenda-capture)
(define-key org-agenda-mode-map (kbd "<SPC>") 'helm-occur)
(define-key org-agenda-mode-map (kbd "s-A") 'org-agenda-exit)

(use-package org-super-agenda)

(org-super-agenda-mode 1)

(setq-default org-icalendar-include-todo t)

(setq org-combined-agenda-icalendar-file "~/Archive/Apocrypha/Org-Files/calendar.ics"
      org-icalendar-combined-name "OrgCal"
      org-icalendar-use-scheduled '(todo-start event-if-todo event-if-not-todo)
      org-icalendar-use-deadline '(todo-due event-if-todo event-if-not-todo)
      org-icalendar-timezone "America/Detroit"
      org-icalendar-store-UID t
      org-icalendar-alarm-time 30
      calendar-date-style 'iso
      calendar-mark-holidays-flag t
      calendar-week-start-day 0
      calendar-mark-diary-entries-flag t)

(use-package scad-mode)

(use-package centered-cursor-mode)

(use-package dmenu)

(use-package ag)

(use-package rg)
(global-set-key (kbd "C-s") #'rg-menu)

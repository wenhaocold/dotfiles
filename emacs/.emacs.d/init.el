;; NOTE: init.el is now generated from Emacs.org.  Please edit that file
;;       in Emacs and init.el will be generated automatically!

;; You will most likely need to adjust this font size for your system!
(defvar efs/default-font-size 130)
(defvar efs/default-variable-font-size 130)

;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

  ;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)



    ;; Make ESC quit prompts
    (global-set-key (kbd "<escape>") 'keyboard-escape-quit)

    (use-package general
      :config
      (general-create-definer rune/leader-keys
	:keymaps '(normal insert visual emacs)
	:prefix ","
	:global-prefix "C-SPC")
      ;; map jk to esc in insert mode
      (general-def 'insert
	    "j" (general-key-dispatch 'self-insert-command
		      :timeout 0.2
		      "k" 'evil-normal-state))
      (rune/leader-keys
	"t"  '(:ignore t :which-key "toggles")
	"tt" '(counsel-load-theme :which-key "choose theme")
	"w" 'save-buffer
	"q" 'kill-buffer))

    (use-package evil
      :init
      (setq evil-want-integration t)
      (setq evil-want-keybinding nil)
      (setq evil-want-C-u-scroll t)
      (setq evil-want-C-i-jump t)
      ;; (setq evil-want-fine-undo 'fine)
      :config
      (evil-mode 1)
      ;;(define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
      (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

      ;; Use visual line motions even outside of visual-line-mode buffers
      (evil-global-set-key 'motion "j" 'evil-next-visual-line)
      (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

      (evil-set-initial-state 'messages-buffer-mode 'normal)
      (evil-set-initial-state 'dashboard-mode 'normal))

    (use-package evil-collection
      :after evil
      :config
      (evil-collection-init))

;;redo undo
(use-package undo-tree
  :ensure t
  :init
  (setq undo-tree-history-directory-alist '(("." . "~/emacs.d/undo")))
  :config
  (global-undo-tree-mode))
(evil-set-undo-system 'undo-tree)

;; _ is not a keyword in word object, the following config can fix it.
(add-hook 'python-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(setq inhibit-startup-message t)

(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 10)        ; Give some breathing room

(menu-bar-mode -1)            ; Disable the menu bar

;; Set up the visible bell
(setq visible-bell nil)

(column-number-mode)
(global-display-line-numbers-mode t)
(setq-default display-fill-column-indicator-column 79)  ; 80 column indicator - Emacs columns are 0-based...
(global-display-fill-column-indicator-mode t)

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
                  term-mode-hook
                  shell-mode-hook
                  eshell-mode-hook
                  treemacs-mode-hook
                  lisp-interaction-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0)))
  (add-hook mode (lambda () (display-fill-column-indicator-mode 0))))
(setq-default display-line-numbers-width 2)

  (use-package hl-fill-column)
  (global-hl-line-mode 1)
  (global-hl-fill-column-mode)

  (set-face-attribute 'hl-line nil :inherit nil :background "gray6")
  (set-face-attribute 'hl-fill-column-face nil :inherit nil :background "gray6")

  (use-package beacon)
  (beacon-mode 1)
  (use-package sublimity)
  (require 'sublimity-scroll)
  (sublimity-mode 1)
  ;; smooth scroll
  (setq sublimity-scroll-weight 10
      sublimity-scroll-drift-length 5)
  (setq scroll-conservatively 101) ; as long as it's > 100
  (setq scroll-preserve-screen-position t)

(set-face-attribute 'default nil :font "Caskaydia Cove Nerd Font" :height efs/default-font-size :weight 'light)

;; Set the fixed pitch face
(set-face-attribute 'fixed-pitch nil :font "Caskaydia Cove Nerd Font" :height efs/default-font-size)

;; Set the variable pitch face
(set-face-attribute 'variable-pitch nil :font "Literata" :height efs/default-font-size :weight 'regular)

(add-to-list 'load-path "~/.emacs.d/elpa/ligature.el") ;; add package path to 'load-path
(use-package ligature
  :load-path "path-to-ligature-repo"
  :config
  ;; Enable the "www" ligature in every possible major mode
  (ligature-set-ligatures 't '("www"))
  ;; Enable traditional ligature support in eww-mode, if the
  ;; `variable-pitch' face supports it
  (ligature-set-ligatures 'eww-mode '("ff" "fi" "ffi"))
  ;; Enable all Cascadia Code ligatures in programming modes
  (ligature-set-ligatures 'prog-mode '("|||>" "<|||" "<==>" "<!--" "####" "~~>" "***" "||=" "||>"
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
  ;; Enables ligature checks globally in all buffers. You can also do it
  ;; per mode with `ligature-mode'.
  (global-ligature-mode t))

(set-frame-parameter (selected-frame) 'alpha '(86 86))
(add-to-list 'default-frame-alist '(alpha 86 86))

(use-package git-gutter
  :hook (prog-mode . git-gutter-mode)
  :config
  (setq git-gutter:update-interval 0.02))

(use-package git-gutter-fringe
  :config
  (define-fringe-bitmap 'git-gutter-fr:added [224] nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:modified [224] nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:deleted [128 192 224 240] nil nil 'bottom))

;;(set-face-attribute 'minibuffer-prompt nil :family "Noto Sans" :height 100)

(use-package command-log-mode)

(use-package doom-themes
  :init (load-theme 'doom-tokyo-night t))

(use-package all-the-icons)

(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 1)))
;;(setq doom-modeline-height 1)
(set-face-attribute 'mode-line nil :family "Noto Sans" :height 100)
(set-face-attribute 'mode-line-inactive nil :family "Noto Sans" :height 100)

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 1))

    (use-package ivy
      :diminish
      :bind (("C-s" . swiper)
             :map ivy-minibuffer-map
             ("TAB" . ivy-alt-done)
             ("C-l" . ivy-alt-done)
             ("C-j" . ivy-next-line)
             ("C-k" . ivy-previous-line)
             :map ivy-switch-buffer-map
             ("C-k" . ivy-previous-line)
             ("C-l" . ivy-done)
             ("C-d" . ivy-switch-buffer-kill)
             :map ivy-reverse-i-search-map
             ("C-k" . ivy-previous-line)
             ("C-d" . ivy-reverse-i-search-kill))
      :config
      (ivy-mode 1))

    (use-package ivy-rich
      :init
      (ivy-rich-mode 1))

    (use-package counsel
      :bind (("C-M-j" . 'counsel-switch-buffer)
             :map minibuffer-local-map
             ("C-r" . 'counsel-minibuffer-history))
      :config
      (counsel-mode 1))

  (use-package helpful
    :custom
    (counsel-describe-function-function #'helpful-callable)
    (counsel-describe-variable-function #'helpful-variable)
    :bind
    ([remap describe-function] . counsel-describe-function)
    ([remap describe-command] . helpful-command)
    ([remap describe-variable] . counsel-describe-variable)
    ([remap describe-key] . helpful-key))

  (use-package hydra)

  (defhydra hydra-text-scale (:timeout 4)
    "scale text"
    ("j" text-scale-increase "in")
    ("k" text-scale-decrease "out")
    ("f" nil "finished" :exit t))

  (rune/leader-keys
    "ts" '(hydra-text-scale/body :which-key "scale text"))

;; (require 'projectile)
;;   (use-package centaur-tabs
;;     :demand
;;     :config
;;     (centaur-tabs-mode t))
;;   (centaur-tabs-group-by-projectile-project)
;;   (define-key evil-normal-state-map (kbd "g t") 'centaur-tabs-forward)
;;   (define-key evil-normal-state-map (kbd "g T") 'centaur-tabs-backward)

(use-package treemacs)
  (use-package treemacs-evil
      :after (treemacs evil)
      :ensure t)
  (use-package treemacs-projectile
    :after (treemacs projectile)
    :ensure t)
  (require 'general)
  (rune/leader-keys
    "e" 'treemacs)

  (defun efs/org-font-setup ()
    ;; Replace list hyphen with dot
    (font-lock-add-keywords 'org-mode
                            '(("^ *\\([-]\\) "
                               (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

    ;; Set faces for heading levels
    (dolist (face '((org-level-1 . 1.2)
                    (org-level-2 . 1.1)
                    (org-level-3 . 1.05)
                    (org-level-4 . 1.0)
                    (org-level-5 . 1.1)
                    (org-level-6 . 1.1)
                    (org-level-7 . 1.1)
                    (org-level-8 . 1.1)))
      (set-face-attribute (car face) nil :font "Literata" :weight 'regular :height (cdr face)))

    ;; Ensure that anything that should be fixed-pitch in Org files appears that way
    (set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
    (set-face-attribute 'org-code nil   :inherit '(shadow fixed-pitch))
    (set-face-attribute 'org-table nil   :inherit '(shadow fixed-pitch))
    (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
    (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
    (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
    (set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch))

(defun efs/org-mode-setup ()
  (org-indent-mode)
  (variable-pitch-mode 1)
  (visual-line-mode 1))

(use-package org
  :hook (org-mode . efs/org-mode-setup)
  :config
  (setq org-ellipsis " ▾")

  (setq org-agenda-start-with-log-mode t)
  (setq org-log-done 'time)
  (setq org-log-into-drawer t)

  (setq org-agenda-files
        '("~/org_note/500-Tools/503-Emacs/Tasks.org"))

  (require 'org-habit)
  (add-to-list 'org-modules 'org-habit)
  (setq org-habit-graph-column 60)

      (setq org-todo-keywords
        '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!)")
          (sequence "BACKLOG(b)" "PLAN(p)" "READY(r)" "ACTIVE(a)" "REVIEW(v)" "WAIT(w@/!)" "HOLD(h)" "|" "COMPLETED(c)" "CANC(k@)")))

      (setq org-refile-targets
        '(("Archive.org" :maxlevel . 1)
          ("Tasks.org" :maxlevel . 1)))

      ;; Save Org buffers after refiling!
      (advice-add 'org-refile :after 'org-save-all-org-buffers)

      (setq org-tag-alist
        '((:startgroup)
           ; Put mutually exclusive tags here
           (:endgroup)
           ("@errand" . ?E)
           ("@home" . ?H)
           ("@work" . ?W)
           ("agenda" . ?a)
           ("planning" . ?p)
           ("publish" . ?P)
           ("batch" . ?b)
           ("note" . ?n)
           ("idea" . ?i)))

      ;; Configure custom agenda views
      (setq org-agenda-custom-commands
       '(("d" "Dashboard"
         ((agenda "" ((org-deadline-warning-days 7)))
          (todo "NEXT"
            ((org-agenda-overriding-header "Next Tasks")))
          (tags-todo "agenda/ACTIVE" ((org-agenda-overriding-header "Active Projects")))))

        ("n" "Next Tasks"
         ((todo "NEXT"
            ((org-agenda-overriding-header "Next Tasks")))))

        ("W" "Work Tasks" tags-todo "+work-email")

        ;; Low-effort next actions
        ("e" tags-todo "+TODO=\"NEXT\"+Effort<15&+Effort>0"
         ((org-agenda-overriding-header "Low Effort Tasks")
          (org-agenda-max-todos 20)
          (org-agenda-files org-agenda-files)))

        ("w" "Workflow Status"
         ((todo "WAIT"
                ((org-agenda-overriding-header "Waiting on External")
                 (org-agenda-files org-agenda-files)))
          (todo "REVIEW"
                ((org-agenda-overriding-header "In Review")
                 (org-agenda-files org-agenda-files)))
          (todo "PLAN"
                ((org-agenda-overriding-header "In Planning")
                 (org-agenda-todo-list-sublevels nil)
                 (org-agenda-files org-agenda-files)))
          (todo "BACKLOG"
                ((org-agenda-overriding-header "Project Backlog")
                 (org-agenda-todo-list-sublevels nil)
                 (org-agenda-files org-agenda-files)))
          (todo "READY"
                ((org-agenda-overriding-header "Ready for Work")
                 (org-agenda-files org-agenda-files)))
          (todo "ACTIVE"
                ((org-agenda-overriding-header "Active Projects")
                 (org-agenda-files org-agenda-files)))
          (todo "COMPLETED"
                ((org-agenda-overriding-header "Completed Projects")
                 (org-agenda-files org-agenda-files)))
          (todo "CANC"
                ((org-agenda-overriding-header "Cancelled Projects")
                 (org-agenda-files org-agenda-files)))))))

      (setq org-capture-templates
        `(("t" "Tasks / Projects")
          ("tt" "Task" entry (file+olp "~/Projects/Code/emacs-from-scratch/OrgFiles/Tasks.org" "Inbox")
               "* TODO %?\n  %U\n  %a\n  %i" :empty-lines 1)

          ("j" "Journal Entries")
          ("jj" "Journal" entry
               (file+olp+datetree "~/Projects/Code/emacs-from-scratch/OrgFiles/Journal.org")
               "\n* %<%I:%M %p> - Journal :journal:\n\n%?\n\n"
               ;; ,(dw/read-file-as-string "~/Notes/Templates/Daily.org")
               :clock-in :clock-resume
               :empty-lines 1)
          ("jm" "Meeting" entry
               (file+olp+datetree "~/Projects/Code/emacs-from-scratch/OrgFiles/Journal.org")
               "* %<%I:%M %p> - %a :meetings:\n\n%?\n\n"
               :clock-in :clock-resume
               :empty-lines 1)

          ("w" "Workflows")
          ("we" "Checking Email" entry (file+olp+datetree "~/Projects/Code/emacs-from-scratch/OrgFiles/Journal.org")
               "* Checking Email :email:\n\n%?" :clock-in :clock-resume :empty-lines 1)

          ("m" "Metrics Capture")
          ("mw" "Weight" table-line (file+headline "~/Projects/Code/emacs-from-scratch/OrgFiles/Metrics.org" "Weight")
           "| %U | %^{Weight} | %^{Notes} |" :kill-buffer t)))

      (define-key global-map (kbd "C-c j")
        (lambda () (interactive) (org-capture nil "jj")))

      (efs/org-font-setup))
;; indentation
(setq org-src-preserve-indentation t)
(add-hook 'org-mode-hook #'company-mode)

  (use-package org-bullets
    :after org
    :hook (org-mode . org-bullets-mode)
    :custom
    (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

  (defun efs/org-mode-visual-fill ()
    (setq visual-fill-column-width 100
          visual-fill-column-center-text t)
    (visual-fill-column-mode 1))

  (use-package visual-fill-column
    :hook (org-mode . efs/org-mode-visual-fill))

  (org-babel-do-load-languages
    'org-babel-load-languages
    '((emacs-lisp . t)
      (python . t)))

  (push '("conf-unix" . conf-unix) org-src-lang-modes)

;; This is needed as of Org 9.2
(require 'org-tempo)

(add-to-list 'org-structure-template-alist '("sh" . "src shell"))
(add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
(add-to-list 'org-structure-template-alist '("py" . "src python"))

  ;; Automatically tangle our Emacs.org config file when we save it
  (defun efs/org-babel-tangle-config ()
    (when (string-equal (buffer-file-name)
                        (expand-file-name "~/.emacs.d/Emacs.org"))
      ;; Dynamic scoping to the rescue
      (let ((org-confirm-babel-evaluate nil))
        (org-babel-tangle))))

  (add-hook 'org-mode-hook (lambda () (add-hook 'after-save-hook #'efs/org-babel-tangle-config)))

(setq org-startup-with-inline-images t)

(use-package org-download)
(setq-default org-download-image-dir "~/MyNote/res/images")
(setq-default org-download-heading-lvl nil)

(setq org-image-actual-width 400)

(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory "~/MyNote/org-roam")
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n g" . org-roam-graph)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture)
         ;; Dailies
         ("C-c n j" . org-roam-dailies-capture-today))
  :config
  (org-roam-db-autosync-mode))
(setq org-roam-node-display-template
      (concat "${title:*} "
              (propertize "${tags:20}" 'face 'org-tag)))

(use-package evil-nerd-commenter
  :bind ("M-/" . evilnc-comment-or-uncomment-lines))

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :init  
  (setq lsp-keymap-prefix "C-c l")
  :config
  (lsp-enable-which-key-integration t))
(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode))
;; (use-package lsp-treemacs
;;   :after lsp)

(use-package dap-mode
  ;; Uncomment the config below if you want all UI panes to be hidden by default!
  ;; :custom
  ;; (lsp-enable-dap-auto-configure nil)
  ;; :config
  ;; (dap-ui-mode 1)
  :commands dap-debug
  :config
  (require 'dap-python))

(use-package typescript-mode
  :mode "\\.ts\\'"
  :hook (typescript-mode . lsp-deferred)
  :config
  (setq typescript-indent-level 2))

(use-package python-mode
  :mode "\\.py\\'"
  :hook (python-mode . lsp-deferred)
  :config
  (setq python-indent-level 4))
(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))  ; or lsp-deferred
(setq lsp-pyright-typechecking-mode nil)

(provide 'lang-python)

(add-hook 'c-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'lsp)

(use-package yaml-mode
  :hook (yaml-mode . git-gutter-mode)
)

(use-package company
  :after lsp-mode
  :hook (lsp-mode . company-mode)
  :bind (:map company-active-map
         ("<tab>" . company-complete-selection))
        (:map company-active-map
         ("C-h" . backward-delete-char))
        ;; (:map lsp-mode-map
        ;;  ("<tab>" . company-indent-or-complete-common))
  :custom
  (company-minimum-prefix-length 3)
  (company-idle-delay 0.0))
;(define-key company-active-map (kbd "C-h") #'backward-delete-char)
(use-package company-box
  :hook (company-mode . company-box-mode))
(require 'general)
;; filename completion
(general-define-key "C-." 'company-files)

  (use-package projectile
    :diminish projectile-mode
    :config (projectile-mode)
    :custom ((projectile-completion-system 'ivy))
    :bind-keymap
    ("C-c p" . projectile-command-map)
    :init
    ;; NOTE: Set this to the folder where you keep your Git repos!
    (when (file-directory-p "~/Projects/Code")
      (setq projectile-project-search-path '("~/Projects/Code")))
    (setq projectile-switch-project-action #'projectile-dired))

  (use-package counsel-projectile
    :config (counsel-projectile-mode))

  (use-package magit
    :custom
    (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

  ;; NOTE: Make sure to configure a GitHub token before using this package!
  ;; - https://magit.vc/manual/forge/Token-Creation.html#Token-Creation
  ;; - https://magit.vc/manual/ghub/Getting-Started.html#Getting-Started
  (use-package forge)

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package tree-sitter) 
(use-package tree-sitter-langs) 
(global-tree-sitter-mode)
(add-hook 'python-mode-hook #'tree-sitter-hl-mode)

(add-to-list 'load-path "~/.emacs.d/elpa/tree-sitter-fold")
(use-package tree-sitter-fold
  :ensure nil)
(rune/leader-keys
    "za" 'tree-sitter-fold-toggle)

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))
(add-hook 'after-init-hook #'global-flycheck-mode)
(setq-default flycheck-indication-mode 'left-margin)
(add-hook 'flycheck-mode-hook #'flycheck-set-indication-mode)

  (use-package conda)
  ;; if you want interactive shell support, include:
  (conda-env-initialize-interactive-shells)
  ;; if you want eshell support, include:
  (conda-env-initialize-eshell)
  ;; if you want auto-activation (see below for details), include:
  (conda-env-autoactivate-mode t)
  ;; if you want to automatically activate a conda environment on the opening of a file:
  (add-hook 'find-file-hook (lambda () (when (bound-and-true-p conda-project-env-path)
                                              (conda-env-activate-for-buffer))))
(custom-set-variables
 '(conda-anaconda-home "~/miniconda3/"))
  (setq conda-env-home-directory (expand-file-name "~/miniconda3/"))

(use-package exec-path-from-shell)
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

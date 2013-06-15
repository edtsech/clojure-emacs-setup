(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(backup-inhibited t t)
 '(column-number-mode t)
 '(delete-selection-mode t)
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(tool-bar-mode nil)
 '(scroll-bar-mode nil))

;; Fix the PATH variable
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (shell-command-to-string "$SHELL -i -c 'echo $PATH'")))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))

;; Package.el customization
(package-initialize)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; PLUGINS

;; Line numbers
;; (global-linum-mode t)

;; Vim-mode (Evil-mode)
;; (require 'evil)
;; (require 'evil-paredit)
;; (evil-mode 1)
;; (setq evil-default-cursor t)

;; Textmate mode
(require 'textmate)
(textmate-mode)

;; Paredit
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'nrepl-mode-hook 'paredit-mode)

;; Highlight-parentheses
(require 'highlight-parentheses)
(define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))

;; Classic Rainbow
;; (custom-set-variables '(hl-paren-colors (quote ("orange" "yellow" "greenyellow" "green" "springgreen" "cyan" "slateblue" "magenta" "purple"))))
;; Eighties Rainbow
;; (custom-set-variables '(hl-paren-colors (quote ("#f2777a" "#f99157" "#ffcc66" "#99cc99" "#009999" "#99cccc" "#cc99cc"))))
;; Night Rainbow
;; (custom-set-variables '(hl-paren-colors (quote ("#cc6666" "#de935f" "#f0c674" "#b5bd68" "#8abeb7" "#81a2be" "#b294bb"))))
;; Bright Rainbow
(custom-set-variables '(hl-paren-colors (quote ("#d54e53" "#e78c45" "#e7c547" "#b9ca4a" "#70c0b1" "#7aa6da" "#c397d8"))))

(add-hook 'clojure-mode-hook 'highlight-parentheses-mode)

;; Nrepl
(setenv "PATH" (concat (getenv "HOME") "/bin:" (getenv "PATH")))
(setq exec-path (cons "~/bin" exec-path))
(add-hook 'nrepl-interaction-mode-hook 'nrepl-turn-on-eldoc-mode)
(setq nrepl-popup-stacktraces nil)
(add-to-list 'same-window-buffer-names "*nrepl*")
(add-hook 'nrepl-mode-hook 'paredit-mode)

;; Super Tab
(require 'smart-tab)
(global-smart-tab-mode 1)

;; Relative line numbers
;; (require 'linum-relative)
;; (set-face-foreground 'linum-relative-current-face nil)
;; (set-face-background 'linum-relative-current-face nil)

;; APPEARENCE

;; Set color-theme
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)     
     (color-theme-sanityinc-tomorrow-night)
     ;; (color-theme-sanityinc-tomorrow-bright)
     ;; (color-theme-sanityinc-tomorrow-blue)
     ;; (color-theme-sanityinc-tomorrow-eighties)
     ))

(set-face-attribute 'default nil :height 120)
(set-cursor-color 'white)

(setq-default indent-tabs-mode nil)
(setq tab-width 2)
(setq-default truncate-lines t)

;; Set parentheses color
(defface esk-paren-face
   '((((class color) (background dark))
      (:foreground "grey40"))
     (((class color) (background light))
      (:foreground "grey55")))
   "Face used to dim parentheses."
   :group 'starter-kit-faces)

(font-lock-add-keywords 'clojure-mode
                        '(("(\\|)" . 'esk-paren-face)))

;; WHITESPACES
;; (require 'whitespace)
;; (add-hook 'after-save-hook 'whitespace-cleanup)
;; (setq whitespace-line-column 90)
;; highlight trainling spaces, empty lines and etc
;; (setq whitespace-style '(face empty tabs lines-tail trailing))
;; (global-whitespace-mode t)

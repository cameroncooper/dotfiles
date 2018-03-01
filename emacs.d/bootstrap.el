;; No splash screen
(setq inhibit-startup-screen t)
(setq initial-scratch-message " ")

;; Make sure packages are installed
(load "~/.emacs.d/packages")

;; Setup theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'seti-minimal t)
(add-to-list 'default-frame-alist '(background-color . "#0d0d0d"))

;; Hide menu bar
(menu-bar-mode -1)

;; Line numbers
(add-hook 'prog-mode-hook 'linum-mode)
(setq linum-format "%4d \u2502 ")

;; Better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" (system-name)))

;; Autocomplete paired brackets
(electric-pair-mode 1)

;; Configure mouse
(xterm-mouse-mode t)
(global-set-key [mouse-4] 'scroll-down-line)
(global-set-key [mouse-5] 'scroll-up-line)

;; Configure backups
(setq backup-directory-alist `(("." . "~/.emacs.saves")))
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

;; Better undo with undo-tree
(require 'undo-tree)
(global-undo-tree-mode 1)
(global-set-key "\C-^" 'redo)

;; Move line/region with M-up/down
(load "~/.emacs.d/move-lines")
(require 'move-lines)
(move-lines-binding)

;; Comment/uncomment with C-/
(defun comment-or-uncomment-line-or-region ()
  "Comments or uncomments the current line or region."
  (interactive)
  (if (region-active-p)
      (comment-or-uncomment-region (region-beginning) (region-end))
    (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    )
  )
(global-set-key "\C-c\C-c" 'comment-or-uncomment-line-or-region)

;; Company mode
(add-hook 'after-init-hook 'global-company-mode)

;; Neotree
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;; Powerline
(add-to-list 'load-path "~/.emacs.d/powerline")
(require 'powerline)
(powerline-default-theme)

;; Setup IDO mode
(require 'ido)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-create-new-buffer 'always)
(defadvice ido-switch-buffer (around no-confirmation activate)
  (let ((confirm-nonexistent-file-or-buffer nil))
    ad-do-it))
(ido-mode t)

;; Multiple cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-M-l") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-M-s") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; Langs setup
(load "~/.emacs.d/langs/go/setup.el")
(load "~/.emacs.d/langs/js/setup.el")

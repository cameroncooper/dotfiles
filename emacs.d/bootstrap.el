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


;; use js2-mode by default
(add-to-list 'auto-mode-alist (cons (rx ".js" eos) 'js2-mode))

;; 2 space indent
(setq-default js2-basic-offset 2)

;; Company Tern
(add-to-list 'company-backends 'company-tern)
(add-hook 'js2-mode-hook (lambda () (tern-mode t)))

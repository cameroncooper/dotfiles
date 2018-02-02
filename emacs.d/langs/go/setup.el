;; Load go-mode

(add-hook 'after-init-hook 'global-company-mode)
(require 'company-go)
(setq gofmt-command "goimports")

(add-hook 'go-mode-hook 'company-mode)
(add-hook 'go-mode-hook (lambda ()
                            (set (make-local-variable 'company-backends) '(company-go))
                            (company-mode)))




(add-hook 'go-mode-hook (lambda ()
			  (add-hook 'before-save-hook #'gofmt-before-save)))


;; Import GOPATH
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH"))

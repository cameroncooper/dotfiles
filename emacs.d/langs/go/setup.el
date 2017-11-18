;; Load go-mode
(add-to-list 'load-path "~/.emacs.d/langs/go/go-mode.el-1.5.0")
(require 'go-mode-autoloads)
;; Company mode backend
(add-to-list 'load-path "~/.emacs.d/langs/go/company-go")
(require 'company-go)
(add-hook 'go-mode-hook (lambda ()
			  (add-hook 'before-save-hook #'gofmt-before-save)
                          (set (make-local-variable 'company-backends) '(company-go))
                          (company-mode)))
;; Import GOPATH
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH"))

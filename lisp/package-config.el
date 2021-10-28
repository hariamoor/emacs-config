;; install and configure packages
(use-package adaptive-wrap
  :bind
  ("C-x a p" . adaptive-wrap-prefix-mode))

(use-package async
  :config
  (setq async-bytecomp-allowed-packages '(all))
  (dired-async-mode 1)
  (async-bytecomp-package-mode 1))

(use-package blackout)

(use-package boon
  :bind
  ("M-SPC" . boon-set-command-state)
  :config
  (require 'boon-qwerty)
  (require 'boon-tutorial)
  :hook (after-init . boon-mode))

(use-package cargo
  :after rust-mode
  :blackout
  :hook
  (rust-mode . cargo-minor-mode)
  :init
  (setq exec-path
	(append exec-path
		'(substitute-in-file-name "$HOME/.cargo/bin"))))

(use-package company
  :ensure t
  :bind
  ("\t" . company-complete)
  :blackout
  :config
  (setq company-idle-delay 0)
  (global-company-mode 1)
  :hook
  (shell-mode . (lambda () my-shell-mode-setup-function
		  (when (and (fboundp 'company-mode)
			     (file-remote-p default-directory))
		    (company-mode -1)))))

(use-package company-lsp
  :config
  (push 'company-lsp company-backends))

(use-package ctrlf
  :blackout
  :config
  (ctrlf-mode))

(use-package dashboard
  :config
  (dashboard-setup-startup-hook)
  (setq initial-buffer-choice
	(lambda () (get-buffer "*dashboard*"))))

(use-package dired+)

(use-package esh-autosuggest
  :hook (eshell-mode . esh-autosuggest-mode))

(use-package eshell-prompt-extras
  :after esh-opt
  :config
  (setq eshell-highlight-prompt nil
	eshell-prompt-function 'epe-theme-dakrone))

(use-package guess-style
  :config
  (global-guess-style-info-mode 1)
  :hook
  (prog-mode . guess-style-guess-all))

(use-package gruvbox-theme
  :config
  (load-theme 'gruvbox-dark-hard))

(use-package lsp-mode
  :ensure t
  :after which-key
  :blackout
  :bind-keymap
  ("C-c C-l" . lsp-command-map))

(use-package lsp-python-ms
  :init (setq lsp-python-ms-auto-install-server t)
  :hook (python-mode . (lambda ()
			 (require 'lsp-python-ms)
                         (lsp))))

(use-package lsp-ui
  :ensure t)

(use-package magit
  :bind
  (("C-x g" . magit-status)
   ("C-x j" . magit-dispatch)))

(use-package org
  :config
  (require 'ox-md))

(use-package perspective
  :bind
  (("C-x b" . persp-switch-to-buffer*)
   ("C-x k" . persp-kill-buffer*))
  :config
  (persp-mode))

(use-package python-mode)

(use-package rg
  :config
  (rg-enable-menu))

(use-package rust-mode
  :after lsp-mode
  :config
  (setq rust-always-locate-project-on-open t
        rust-format-on-save t)
  :hook
  (rust-mode . lsp))

(use-package selectrum-prescient
  :blackout
  :config
  (selectrum-prescient-mode 1)
  (prescient-persist-mode 1)
  :requires selectrum)

(use-package selectrum
  :blackout
  :config
  (selectrum-mode 1))

(use-package smartparens
  :blackout
  :config
  (require 'smartparens-config)
  (smartparens-global-mode 1))

(use-package smart-tabs-mode
  :config
  (setq indent-tabs-mode t))

;; (use-package vterm
;;   :init
;;   (setenv "USE_SYSTEM_LIBVTERM" "no")
;;   :bind
;;   ("C-x p" . vterm-other-window))

(use-package which-key)

(use-package yasnippet
  :ensure t
  :blackout yas-minor-mode
  :hook
  (after-init . yas-global-mode))

(use-package yasnippet-snippets)

(provide 'package-config)

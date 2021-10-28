;; initailize all other files in order
(add-to-list 'load-path
	     (expand-file-name "lisp/" user-emacs-directory))

(defmacro with-system (type &rest body)
  "Evaluate BODY if `system-type' equals TYPE."
  (declare (indent defun))
  `(when (eq system-type ',type)
     ,@body))

(with-system darwin
	     (require 'osx-config))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(require 'bootstrap-straight)

(setq atl-lsp-jar "/Users/hariamoor/atl/atl-lsp/target/atl-lsp-0.53-SNAPSHOT-standalone.jar");
(require 'package-config)

(load "/Users/hariamoor/atl/atl-lsp/emacs/atl-mode.el")
(add-to-list 'auto-mode-alist '("\\.atl\\'" . atl-mode))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("6b5c518d1c250a8ce17463b7e435e9e20faa84f3f7defba8b579d4f5925f60c1" default)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

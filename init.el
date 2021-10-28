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

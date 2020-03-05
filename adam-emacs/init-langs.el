(use-package add-node-modules-path
  :init
  (add-hook 'prog-mode-hook #'add-node-modules-path))
  ;; :hook
  ;; (typescript-mode)
  ;; (rjsx-mode)
  ;; (web-mode))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
  :config
  ;; customize flycheck temp file prefix
  (setq-default flycheck-temp-prefix ".flycheck")
  (setq flycheck-check-syntax-automatically '(save
					      new-line
					      mode-enabled))
  (setq flycheck-idle-change-delay 1)

  (setq-default flycheck-disabled-checkers
		(append flycheck-disabled-checkers
  			'(javascript-jshint json-jsonlint scss-lint emacs-lisp-checkdoc)))
  (flycheck-add-mode 'javascript-eslint 'web-mode))

(use-package json-mode)

(use-package js2-mode
  :config
  (setq js2-mode-show-parse-errors 'nil
        js2-mode-show-strict-warnings 'nil
        js-chain-indent t
        js2-highlight-level 3
	js2-highlight-external-variables t
	;; disable js2-mode warnings and errors since we'll use eslint
	js2-mode-show-parse-errors nil
	js2-mode-show-strict-warnings nil))

;; (use-package indium)

(use-package js2-refactor
  :config
  (js2r-add-keybindings-with-prefix "C-c C-m")
  :hook
  ;; (web-mode . js2-refactor-mode)
  (rjsx-mode . js2-refactor-mode))

(use-package rjsx-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))
  (add-to-list 'interpreter-mode-alist '("node" . rjsx-mode)))

(use-package graphql-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.gql\\'" . graphql-mode)))

(use-package web-mode
  :init
  (add-to-list 'auto-mode-alist '("\\.ts\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
  :config
  (add-hook 'web-mode-hook 'my|web-checkers)

  (defun my|web-checkers ()
    "add lsp and stylelint"
    (interactive)
    (setq-local flycheck-checker 'javascript-eslint))

  (setq-default web-mode-comment-formats
              '(("javascript" . "//")
                ("typescript" . "//"))))

(use-package scss-mode
  :config
  (add-hook 'scss-mode-hook 'my|scss-checkers)

  (defun my|scss-checkers ()
    "add lsp and stylelint"
    (interactive)
    (setq-local flycheck-checker 'scss-stylelint))
    ;; (flycheck-add-next-checker 'lsp 'scss-stylelint)))
  )


;;; parse node.js stack traces in compilation buffer.s
(require 'compile)
(add-to-list 'compilation-error-regexp-alist 'node)
(add-to-list 'compilation-error-regexp-alist-alist
             '(node "^[[:blank:]]*at \\(.*(\\|\\)\\(.+?\\):\\([[:digit:]]+\\):\\([[:digit:]]+\\)" 2 3 4))

(use-package haskell-mode)

;; scala + metals
(use-package scala-mode
  :mode "\\.s\\(cala\\|bt\\)$")

(use-package sbt-mode
  :commands sbt-start sbt-command
  :config
  ;; WORKAROUND: https://github.com/ensime/emacs-sbt-mode/issues/31
  ;; allows using SPACE when in the minibuffer
  (substitute-key-definition
   'minibuffer-complete-word
   'self-insert-command
   minibuffer-local-completion-map)
   ;; sbt-supershell kills sbt-mode:  https://github.com/hvesalai/emacs-sbt-mode/issues/152
   (setq sbt:program-options '("-Dsbt.supershell=false"))
)

(use-package io-mode)

(use-package rust-mode
  :config
  (defun my|rust-cargo-open-docs ()
    "Use cargo to build and open rust docs for current project"
    (interactive)
    (async-shell-command
     (concat "cd " (projectile-project-root " && cargo doc --open")))))

(use-package cargo
  :hook (rust-mode . cargo-minor-mode))

(provide 'init-langs)

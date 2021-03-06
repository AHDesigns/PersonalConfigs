(global-set-key (kbd "C-x C-v") (lambda () (interactive) (find-file (concat user-emacs-directory "/init.el"))))

(setq initial-frame-alist
      `((horizontal-scroll-bars . nil)
	(vertical-scroll-bars . nil)
	(menu-bar-lines . 0)
	(top . 150)
	(left . 400)))

(setq default-frame-alist (copy-alist initial-frame-alist))

;; garbage collection every 100MB (default is every 0.76MB)
(setq gc-cons-threshold (* 100 1000 1000))

(add-hook 'emacs-startup-hook #'my/print-init-time)

(defun my/print-init-time ()
  "Print EMACS load time."
  (message
   "*** Emacs loaded in %s with %d garbage collections."
   (format "%.2f seconds" (float-time
			   (time-subtract after-init-time before-init-time)))
   gcs-done))

(setq user-emacs-directory "~/.emacs.d")

(defvar user-temporary-file-directory
  (concat temporary-file-directory user-login-name "/"))

(unless (file-directory-p user-temporary-file-directory)
  (make-directory user-temporary-file-directory))


;; Local Variables:
;; flycheck-disabled-checkers: (emacs-lisp-checkdoc)
;; End:

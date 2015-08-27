(require 'package)
(push '("marmalade" . "http://marmalade-repo.org/packages/")
	package-archives)
(push '("melpa" . "http://melpa.milkbox.net/packages/")
	package-archives)
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(setq package-list '(evil magit helm cider smartparens auctex))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(require 'evil)
(evil-mode 1)

(load-theme 'tango-dark)	
;(load-theme 'monokai)

(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x c") 'cvs-status)

(require 'helm-config)
(helm-mode 1)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) 

(setq helm-buffers-fuzzy-matching t)
(setq helm-M-x-fuzzy-match t)

(add-to-list 'evil-emacs-state-modes 'cider-repl-mode)
(add-to-list 'evil-emacs-state-modes 'cider-stacktrace-mode)
(add-to-list 'evil-emacs-state-modes 'magit-popup-mode)
(add-to-list 'evil-emacs-state-modes 'magit-popup-sequence-mode)
(add-to-list 'evil-emacs-state-modes 'cvs-mode)
(add-to-list 'evil-emacs-state-modes 'term-mode)

(setq cider-auto-select-error-buffer nil)

(eval-after-load 'cider
  '(progn
     (add-hook 'clojure-mode-hook 'cider-mode)))

(if
    (locate-library "auctex.el")
    (load "auctex.el" nil t t))
(if
    (locate-library "preview-latex.el")
    (load "preview-latex.el" nil t t))

(setq TeX-auto-save t)
(setq TeX-parse-self t)

(setq-default TeX-master nil)
(setq TeX-PDF-mode t)

(add-hook 'LaTeX-mode-hook 'visual-line-mode)

(add-hook 'LaTeX-mode-hook 'flyspell-mode)

(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)

(setq reftex-plug-into-AUCTeX t)

(require 'smartparens-config)
;(smartparens-global-mode t) 
(add-hook 'prog-mode-hook 'turn-on-smartparens-strict-mode)
(add-hook 'cider-repl-mode-hook 'turn-on-smartparens-strict-mode)
(sp-use-smartparens-bindings)
					;
;(custom-set-variables
; ;; custom-set-variables was added by Custom.
; ;; If you edit it by hand, you could mess it up, so be careful.
; ;; Your init file should contain only one such instance.
; ;; If there is more than one, they won't work right.
; '(custom-safe-themes
;   (quote
;    ("05c3bc4eb1219953a4f182e10de1f7466d28987f48d647c01f1f0037ff35ab9a" default))))
;(custom-set-faces
; ;; custom-set-faces was added by Custom.
; ;; If you edit it by hand, you could mess it up, so be careful.
; ;; Your init file should contain only one such instance.
; ;; If there is more than one, they won't work right.
; )

(require 'package)
(setq package-archives '(
			 ("gnu" . "https://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t) ; Org-mode's repository

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package try
  :ensure t)
(use-package which-key
  :ensure t
  :config (which-key-mode))
;;(use-package ox-reveal)
(fset 'yes-or-no-p 'y-or-n-p)
;; (global-set-key (kbd "<f5") 'revert-buffer)
(setq org-reveal-root "http://cdn.jsdelivr.net/reveal.js/3.0.0/")
(setq org-reveal-mathjax t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("4639288d273cbd3dc880992e6032f9c817f17c4a91f00f3872009a099f5b3f84" "d5aec3a39364bc4c6c13f472b2d0cdaebd5cff7a6e4839749be2156fcc075006" default)))
 '(inhibit-startup-screen t)
 '(initial-buffer-choice nil)
 '(package-selected-packages
   (quote
    (evil-god-state auto-complete-rst auto-indent-mode evil-collection yasnippet-snippets yasnippet vdiff-magit unicode-math-input unicode-emoticons unicode-fonts terraform-doc terraform-mode sphinx-mode sphinx-doc smartparens smart-tab rust-mode py-autopep8 pip-requirements ox-nikola ox-html5slide ox-jekyll-md orgtbl-aggregate orgtbl-ascii-plot org-re-reveal-ref org-re-reveal evil-surround evil-org evil-nerd-commenter evil-commentary evil-args dockerfile-mode org-present org-pretty-tags org-bullets org-dotemacs chyla-theme theme-changer flymake-python-pyflakes company-ycmd flycheck company-ycm company-anaconda ruby-additional perl6-mode rope-read-mode ox-reveal org-notebook org-beautify-theme json-reformat evil-numbers evil-paredit org-babel-eval-in-repl django-mode auto-auto-indent all-the-icons ac-html-bootstrap ac-etags anaconda-mode vimish-fold auto-complete org-link-minor-mode ## pabbrev))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(org-babel-do-load-languages
  'org-babel-load-languages
  '((R . t)
  (org . t)
  (latex . t)
  (dot . t)
  (emacs-lisp . t)
  (gnuplot . t)
  (screen . nil)
  (shell . t)
  (sql . t)
  ( python . t)
  (sqlite . t)))
(setq org-to-latex-to-pdf-process
      '("pdflatex %f" "biber %b" "pdflatex %f" "pdflatex %f"))
;(global-set-key (kbd "<menu> v f") #'vimish-fold)
;(global-set-key (kbd "<menu> v v") #'vimish-fold-delete)
(require 'evil)
(evil-mode 1)
(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)
(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
(add-hook 'org-mode-hook 'org-bullets-mode)
(mode-icons-mode)
(require 'evil-args)

;; bind evil-args text objects
(define-key evil-inner-text-objects-map "a" 'evil-inner-arg)
(define-key evil-outer-text-objects-map "a" 'evil-outer-arg)
;; bind evil-forward/backward-args
(define-key evil-normal-state-map "L" 'evil-forward-arg)
(define-key evil-normal-state-map "H" 'evil-backward-arg)
(define-key evil-motion-state-map "L" 'evil-forward-arg)
(define-key evil-motion-state-map "H" 'evil-backward-arg)
;; bind evil-jump-out-args
(define-key evil-normal-state-map "K" 'evil-jump-out-args)
;; evil-sorround tpope
(require 'evil-surround)
(global-evil-surround-mode 1)

(require 'smart-tab)
(global-smart-tab-mode 1)

(require 'unicode-fonts)
(unicode-fonts-setup)

(require 'yasnippet)
(yas-global-mode 1)

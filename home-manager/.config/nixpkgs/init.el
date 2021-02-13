;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package
(require 'use-package)

;; Basic Setup
(setq inhibit-startup-message t)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)
(menu-bar-mode -1)
(column-number-mode)
(global-display-line-numbers-mode t)

(load-theme 'dracula t)

;; Ivy Config
(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
	 :map ivy-minibuffer-map
	 ("TAB" . ivy-alt-done)
	 ("C-n" . ivy-next-line)
	 ("C-p" . ivy-previous-line)
	 :map ivy-switch-buffer-map
	 ("C-n" . ivy-next-line)
	 ("C-p" . ivy-previous-line))
  :config
  (ivy-mode 1))

;; Counsel Config
(use-package counsel
  :config
  (counsel-mode 1))

;; Doom Mode line Config
(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

;; Org
(defun efs/org-mode-setup ()
  (org-indent-mode))

(use-package org
  :pin org
  :hook (org-mode . efs/org-mode-setup)
  :config
  (setq org-ellipsis " ▾"))

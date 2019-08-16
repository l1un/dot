(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (helm evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; start evil mode on launch
(require 'evil)
(evil-mode t)

;; via D.. hide menu
(if (fboundp 'menu-bar-mode)
(menu-bar-mode -1))
(if (and (> emacs-major-version 21) (not (null window-system)))
(progn
(tool-bar-mode -1)

;; (setq-default cursor-in-non-selected-windows nil)
(scroll-bar-mode -1)))

;; testing
(setq inhibit-startup-message t)

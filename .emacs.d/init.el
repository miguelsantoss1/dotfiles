;; UTF-8 please
(set-language-environment "UTF-8") ;; Set input
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

(package-initialize)

(set-frame-font "Monaco 12" nil t)	   ;; Set font
;; Don't load old elc files when el is newer
(setq load-prefer-newer t)

;; initalize all ELPA packages
(require 'package)
(setq package-enable-at-startup nil
      package-archives
      '(("melpa"           . "http://melpa.org/packages/")
        ("gnu" . "http://elpa.gnu.org/packages/")
        ("org" . "http://orgmode.org/elpa/"))
      package-user-dir "~/.emacs.d/elpa/")
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(use-package diminish :ensure t)

(add-to-list 'load-path (expand-file-name "config" user-emacs-directory))
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Highlight each source code identifier based on name
(use-package color-identifiers-mode
  :ensure t
  :defer t)

(use-package avy
  :ensure t
  :diminish avy-mode
  :bind (("C-x C-SPC" . avy-goto-char)
         ("C-x C-x" . avy-goto-word-or-subword-1)
         ("C-x C-l" . avy-goto-line))
  :config
  (setq avy-timeout-seconds 0.6))

(use-package dumb-jump
  :ensure t
  :bind ("C-M-g". dumb-jump-go)
  :config
  (dumb-jump-mode))


(require 'setup-core)
(require 'setup-evil)
(require 'appearance)
;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; For specifics on all options available
;; https://emacsredux.com/blog/2020/12/04/maximize-the-emacs-frame-on-startup/
;; start every frame maximized
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Bevan Stanely"
      user-mail-address "bevanstanely@outlook.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "JetBrains Mono" :size 24)
      doom-big-font (font-spec :family "JetBrains Mono" :size 36)
      doom-variable-pitch-font (font-spec :family "Overpass" :size 24)
      doom-unicode-font (font-spec :family "JuliaMono")
      doom-serif-font (font-spec :family "IBM Plex Mono" :weight 'light))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-vibrant)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")
(setq org-agenda-file-regexp "bucket-list\\.org\\|journal/.+\\.org\\'")
(setq org-journal-file-format "%Y%m%d.org")

;(rx (or "bucket-list.org" (seq "journal/" (+ not-newline)".org")))

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
(setq! citar-bibliography `(,(concat org-directory "ref/references.bib"))
       citar-library-paths `(,(concat org-directory "roam/library/"))
       citar-notes-paths `(,(concat org-directory "roam/library"))
       citar-file-parser-functions '(citar-file--parser-default))

(use-package! keytar)

(use-package! lsp-grammarly
  :after keytar
  :hook (text-mode . (lambda ()
                       (require 'lsp-grammarly)
                       (lsp))))
(use-package! pdf-tools
  :config (pdf-loader-install) ; On demand loading, leads to faster startup time
  (setq-default pdf-view-display-size 'fit-width)
  (define-key pdf-view-mode-map (kbd "C-s") 'isearch-forward))

;; midnite mode hook
(add-hook 'pdf-view-mode-hook (lambda ()
                                (pdf-view-midnight-minor-mode))) ; automatically turns on midnight-mode for pdfs
(use-package! nov
  :init (add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode)))
(use-package! websocket
  :after org-roam)

(use-package! org-roam-ui
  :after org-roam ;; or :after org
  ;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
  ;;         a hookable mode anymore, you're advised to pick something yourself
  ;;         if you don't care about startup time, use
  ;;  :hook (after-init . org-roam-ui-mode)
  :config  (setq
            org-roam-ui-sync-theme t
            org-roam-ui-follow t
            org-roam-ui-update-on-save t
            org-roam-ui-open-on-start t))   ;
;; (use-package! org-roam-bibtex :after org-roam
;;               :custom
;;               (orb-roam-ref-format 'org-cite)
;;               (orb-preformat-keywords '("citekey" "author" "date"))
;;               (org-roam-capture-templates
;;                '(("d" "default" plain "%?" :target
;;                   (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
;;                   :unnarrowed t)
;;                  ("r" "bibliography reference" plain "%?"
;;                   :target
;;                   (file+head "references/${citekey}.org" "#+title: ${title}\n")
;;                   :unnarrowed t))))
(
 defhydra doom-window-resize-hydra (:hint nil)
 "
             _k_ increase height
_h_ decrease width    _l_ increase width
             _j_ decrease height
"
 ("h" evil-window-decrease-width)
 ("j" evil-window-increase-height)
 ("k" evil-window-decrease-height)
 ("l" evil-window-increase-width)

 ("q" nil))
(map!
 (:prefix "w"
  :desc "Hydra resize" :n "/" #'doom-window-resize-hydra/body))
(use-package! rustic
;  :config (add-to-list 'lsp-rust-analyzer-library-directories '("~/.config/cargo/registry/src/")) ;
  :custom (rustic-cargo-bin "~/.config/cargo/bin/cargo")
  (flycheck-rust-cargo-executable rustic-cargo-bin)
  )

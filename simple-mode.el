;;; simple-mode.el --- CS3203 SIMPLE major mode -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2021 Jing Yen Loh
;;
;; Author: Jing Yen Loh <https://github.com/jingyenloh>
;; Maintainer: Jing Yen Loh <lohjingyen@gmail.com>
;; Created: September 28, 2021
;; Modified: September 28, 2021
;; Version: 0.0.1
;; Keywords: languages
;; Homepage: https://github.com/jingyenloh/simple-mode
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  CS3203 SIMPLE major mode
;;
;;; Code:

(defgroup simple-mode-faces ()
  "Faces used by `simple-mode'."
  :group 'simple-mode)

(defconst simple-procedure-name-regexp
  (rx "procedure" (1+ space) (group (seq alpha (* alnum))) (0+ space) "{"))

;; Elisp-fu too weak to merge this with the above regex >.>
(defconst simple-called-procedure-regexp
  (rx "call" (1+ space) (group (seq alpha (* alnum))) (0+ space) ";"))

(defconst simple-font-lock-keywords
  (let* ((simple-maybe-keywords
          '("procedure" "read" "print" "call" "while" "if" "then" "else"))

         ;; Regexes
         (simple-maybe-keywords-regexp
          (regexp-opt simple-maybe-keywords 'words)))

    `((,simple-maybe-keywords-regexp . font-lock-keyword-face)
      (,simple-procedure-name-regexp . (1 font-lock-function-name-face))
      (,simple-called-procedure-regexp . (1 font-lock-function-name-face)))))

(define-derived-mode simple-mode prog-mode "SIMPLE"
  "A major mode for CS3203's SIMPLE."
  (setq font-lock-defaults '((simple-font-lock-keywords))))

(provide 'simple-mode)
;;; simple-mode.el ends here

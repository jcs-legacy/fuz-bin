;;; fuz-bin.el --- Fast and precise fuzzy scoring/matching utils  -*- lexical-binding: t; -*-

;; Copyright (C) 2021  Shen, Jen-Chieh
;; Created date 2021-10-15 01:03:01

;; Author: Shen, Jen-Chieh <jcs090218@gmail.com>
;; Description: Fast and precise fuzzy scoring/matching utils.
;; Keyword: lisp
;; Version: 0.1.0
;; Package-Requires: ((emacs "25.1"))
;; URL: https://github.com/jcs-elpa/fuz-bin

;; This file is NOT part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; Fast and precise fuzzy scoring/matching utils.
;;

;;; Code:

(require 'cl-lib)

(defconst fuz-bin--bin-dir
  (concat (file-name-directory load-file-name) "bin/")
  "Pre-built binaries directory path.")

(defconst fuz-bin--dyn-name "fuz_bin_dyn"
  "Dynamic module name.")

;;
;; (@* "Externals" )
;;

(declare-function fuz-bin-dyn-calc-score-clangd "fuz-bin-dyn")
(declare-function fuz-bin-dyn-calc-score-skim "fuz-bin-dyn")
(declare-function fuz-bin-dyn-find-indices-clangd "fuz-bin-dyn")
(declare-function fuz-bin-dyn-find-indices-skim "fuz-bin-dyn")

;;
;; (@* "Aliases" )
;;

(defalias 'fuz-bin-calc-score-clangd #'fuz-bin-dyn-calc-score-clangd)
(defalias 'fuz-bin-calc-score-skim #'fuz-bin-dyn-calc-score-skim)
(defalias 'fuz-bin-find-indices-clangd #'fuz-bin-dyn-find-indices-clangd)
(defalias 'fuz-bin-find-indices-skim #'fuz-bin-dyn-find-indices-skim)

;;
;; (@* "Utils" )
;;

(defsubst fuz-bin-score-skim (pattern str)
  "Match STR against PATTERN, using skim's algorithm.

Sign: (-> Str Str (Option (Listof Long)))

Return (SCORE . (INDICES)) if matched, otherwise return `nil'."
  (if-let* ((total-score (fuz-calc-score-skim pattern str)))
      (cons total-score (fuz-find-indices-skim pattern str))
    nil))

(defsubst fuz-bin-score-clangd (pattern str)
  "Match STR against PATTERN, using clangd's algorithm.

Sign: (-> Str Str (Option (Listof Long)))

Return (SCORE . (INDICES)) if matched, otherwise return `nil'."
  (if-let* ((total-score (fuz-calc-score-clangd pattern str)))
      (cons total-score (fuz-find-indices-clangd pattern str))
    nil))

;;
;; (@* "Bootstrap" )
;;

;;;###autoload
(defun fuz-bin-load-dyn ()
  "Load dynamic module."
  (interactive)
  (unless (featurep 'fuz-bin-dyn)
    (let* ((dyn-name (cl-case system-type
                       ((windows-nt ms-dos cygwin) (concat fuz-bin--dyn-name ".dll"))
                       (darwin (concat "lib" fuz-bin--dyn-name ".dylib"))
                       (t (concat "lib" fuz-bin--dyn-name ".so"))))
           (dyn-path (concat fuz-bin--bin-dir dyn-name)))
      (module-load dyn-path)
      (message "[INFO] Successfully load dynamic module, `%s`" dyn-name))))

(provide 'fuz-bin)
;;; fuz-bin.el ends here

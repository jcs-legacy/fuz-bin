;;; fuz-bin.el --- Fast and precise fuzzy scoring/matching utils  -*- lexical-binding: t; -*-

;; Copyright (C) 2019 Zhu Zihao
;; Copyright (C) 2021  Shen, Jen-Chieh
;; Created date 2021-10-15 01:03:01

;; Author: Zhu Zihao <all_but_last@163.com>
;;         Shen, Jen-Chieh <jcs090218@gmail.com>
;; URL: https://github.com/jcs-elpa/fuz-bin
;; Version: 1.5.0
;; Package-Requires: ((emacs "26.1"))
;; Keywords: lisp

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
(require 'subr-x)

(defconst fuz-bin--bin-dir
  (concat (file-name-directory load-file-name) "bin/")
  "Pre-built binaries directory path.")

(defconst fuz-bin--dyn-name "fuz_bin_dyn"
  "Dynamic module name.")

;;
;; (@* "Externals" )
;;

(declare-function fuz-bin-dyn-score-clangd "fuz-bin-dyn")
(declare-function fuz-bin-dyn-score-skim "fuz-bin-dyn")
(declare-function fuz-bin-dyn-indices-clangd "fuz-bin-dyn")
(declare-function fuz-bin-dyn-indices-skim "fuz-bin-dyn")

;;
;; (@* "Utils" )
;;

(defsubst fuz-bin-score-skim (pattern str)
  "Match STR against PATTERN, using skim's algorithm.

Sign: (-> Str Str (Option (Listof Long)))

Return (SCORE . (INDICES)) if matched, otherwise return nil."
  (if-let* ((total-score (fuz-bin-dyn-score-skim pattern str)))
      (cons total-score (fuz-bin-dyn-indices-skim pattern str))
    nil))

(defsubst fuz-bin-score-clangd (pattern str)
  "Match STR against PATTERN, using clangd's algorithm.

Sign: (-> Str Str (Option (Listof Long)))

Return (SCORE . (INDICES)) if matched, otherwise return nil."
  (if-let* ((total-score (fuz-bin-dyn-score-clangd pattern str)))
      (cons total-score (fuz-bin-dyn-indices-clangd pattern str))
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

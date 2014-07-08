;; Compile any type of project in Emacs
;; Copyright (C) 2014 Scott Weldon
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

(defvar ultimate-compile-qt-kit-name)

(defun ultimate-compile-qt (project-name build-name)
    """Compile a Qt project. Assumes current directory contains source files."""
    (let* ((build-dir (concat "../build-"
                              project-name "-"
                              ultimate-compile-qt-kit-name "-"
                              build-name)))
        (unless (file-directory-p build-dir)
            (mkdir build-dir))
        (cd build-dir)
        (shell-command (concat "qmake ../" project-name "/" project-name ".pro"))
        (shell-command "make")))

(provide 'ultimate-compile)

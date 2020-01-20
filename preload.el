;;; Если el-get не установлен, его нужно установить
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

;;; Эта часть взята из официальной документации el-get
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

;;; Указываем, где будут храниться "рецепты" (набор параметров
;;; для каждого пакета в терминологии el-get)
(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get/el-get/recipes")
(el-get 'sync) ;;; Получаем список пакетов, доступных для установки

;;; Список пакетов, которые будут установлены через el-get
(setq required-packages
      (append
       '(magit
	 doom-themes
	 whitespace
	 projectile)
       (mapcar 'el-get-as-symbol (mapcar 'el-get-source-name el-get-sources))))

;;; Установка пакетов через el-get
(el-get 'sync required-packages)

;;; Дальше идёт подгрузка из MELPA Stable тех компонентов, которых нет врецептах
;;; el-get, либо установка оттуда нецелесообразна (python-mode лучше ставить
;;; именно из MELPA Stasble, поскольку рецепт для el-get требует наличия в ОС
;;; Bazaar - некогда использовавшейся в Canonical системы контроля версий)
(require 'package)
(require 'cl)

;;; А эти пакеты - из MELPA Stable
(defvar elpa-packages '(evil
			vi-tilde-fringe
			doom-modeline))

(defun prl:install-packages ()
  (let ((pkgs (remove-if #'package-installed-p elpa-packages)))
    (when pkgs
      (message "%s" "Emacs refresh packages database...")
      (package-refresh-contents)
      (message "%s" " done.")
      (dolist (p elpa-packages)
        (package-install p)))))

(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

;;; Обновляем список пакетов, доступных для установки через packages
(package-initialize)

;;; Запускаем процесс установки
(prl:install-packages)

(provide 'preload)

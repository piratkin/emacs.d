(use-package cmake-ide
  :ensure t
  :hook
  ((c-mode c++-mode objc-mode find-file) . rc:cmake-ide-guess-dirs)
  :init
  (defun rc:find-top-cmake (dir)
    "Find the highest level directory above DIR with a CMakeLists.txt file."
    (if (equal "/" dir)
        nil
      (if (rc:find-top-cmake (file-truename (concat dir "/..")))
          (rc:find-top-cmake (file-truename (concat dir "/..")))
        (if (member "CMakeLists.txt" (directory-files dir))
            dir
          nil))))
  (defun rc:cmake-ide-guess-dirs ()
    "Guess the current CMake project directory.
Will set the build and project directories accordingly.
Uses the highest level directory above the current one
containing a CMakeLists.txt file."
    (interactive)
    (setq cmake-ide-project-dir (rc:find-top-cmake default-directory))
    (when cmake-ide-project-dir
      (setq cmake-ide-build-dir (concat (file-name-as-directory cmake-ide-project-dir) "build"))
      (message "cmake-ide-build-dir <- %s" cmake-ide-build-dir)
      (cmake-ide-maybe-run-cmake)
      ;; (irony-cdb-autosetup-compile-options)
      ))
  :config
  (cmake-ide-setup))




(provide 'init-cmake-ide)

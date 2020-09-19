(use-package eglot
  :ensure t
  :init
  ;; (setq eglot-auto-display-help-buffer t)
  ;; (setq eglot-autoreconnect nil)
  ;; (setq eglot-sync-connect t)
  ;; (setq eglot-autoshutdown t)
  :hook
  ((c-mode . eglot-ensure)
   (c++-mode . eglot-ensure))
  :config
;; /wrk/c/bunchd
  ;; (setq ccls-initialization-options
  ;;       '(:compilationDatabaseDirectory "build"
  ;;         :cache (:directory ".ccls-cache")
  ;;         :index (:threads 2)))

  (setq ccls-sem-highlight-method 'font-lock)
  ;; (setq ccls-sem-highlight-method 'overlay)
  ;; (ccls-use-default-rainbow-sem-highlight)

  ;; (add-to-list 'eglot-server-programs '(c-mode . ("clang-query")))
  ;; (add-to-list 'eglot-server-programs '(c++-mode . ("clang-query")))
  ;; (add-to-list 'eglot-server-programs '((c-mode c++-mode) "ccls" "-init={\"compilationDatabaseDirectory\":\"build\", \"compilationDatabaseCommand\":\"/usr/bin/cmake -B build -S . -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=YES\", \"cacheDirectory\":\".ccls-dir-cache\", \"rootPath\":\"/wrk/c/bunchd\"}"))
  ;; `(ccls-initialization-options (quote(compilationDatabaseDirectory :build))))
  ;; (add-to-list 'eglot-server-programs '((c-mode c++-mode) "ccls" "-init={\"compilationDatabaseDirectory\":\"build\"}"))
  ;; (add-to-list 'eglot-server-programs '((c-mode c++-mode) "ccls"))
  ;; (add-to-list 'eglot-server-programs '(c-mode . ("clang-query")))
  ;; (add-to-list 'eglot-server-programs '(c++-mode . ("clang-query")))
  ;; (add-to-list 'eglot-server-programs '((c-mode c++-mode) . ("clangd" "-init={\"compilationDatabaseDirectory\":\"build\"}")))
  (message "Init Eglot"))


(provide 'init-eglot)


;; initializationOptions:
;; {"compilationDatabaseCommand":"",
;; "compilationDatabaseDirectory":"",
;; "cacheDirectory":".ccls-cache",
;; "cacheFormat":"binary",
;; "clang":{"excludeArgs":["-falign-jumps=1","-falign-loops=1","-fconserve-stack","-fmerge-constants","-fno-code-hoisting","-fno-schedule-insns","-fno-var-tracking-assignments","-fsched-pressure","-mhard-float","-mindirect-branch-register","-mindirect-branch=thunk-inline","-mpreferred-stack-boundary=2","-mpreferred-stack-boundary=3","-mpreferred-stack-boundary=4","-mrecord-mcount","-mindirect-branch=thunk-extern","-mno-fp-ret-in-387","-mskip-rax-setup","--param=allow-store-data-races=0","-Wa arch/x86/kernel/macros.s","-Wa -"],
;; "extraArgs":["--gcc-toolchain=/usr"],
;; "pathMappings":[],
;; "resourceDir":""},
;; "client":{"hierarchicalDocumentSymbolSupport":true,
;; "linkSupport":true,
;; "snippetSupport":true},
;; "codeLens":{"localVariables":true},
;; "completion":{"caseSensitivity":2,
;; "detailedLabel":true,
;; "dropOldRequests":true,
;; "duplicateOptional":true,
;; "filterAndSort":true,
;; "include":{"blacklist":["^/usr/(local/)?include/c\\+\\+/[0-9\\.]+/(bits|tr1|tr2|profile|ext|debug)/","^/usr/(local/)?include/c\\+\\+/v1/"],
;; "maxPathSize":30,
;; "suffixWhitelist":[".h",".hpp",".hh",".inc"],
;; "whitelist":[]},
;; "maxNum":100},
;; "diagnostics":{"blacklist":[],"onChange":1000,"onOpen":0,"onSave":0,"spellChecking":true,"whitelist":[]},
;; "highlight":{"largeFileSize":2097152,"lsRanges":false,"blacklist":[],"whitelist":[]},
;; "index":{"blacklist":[],"comments":2,"initialBlacklist":[],"initialWhitelist":[],"multiVersion":0,"multiVersionBlacklist":[],"multiVersionWhitelist":[],"onChange":false,"threads":0,"trackDependency":1,"whitelist":[]},
;; "request":{"timeout":5000},
;; "session":{"maxNum":10},
;; "workspaceSymbol":{"caseSensitivity":1,"maxNum":1000,"sort":true},"xref":{"maxNum":2000}}

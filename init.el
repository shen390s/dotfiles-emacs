;; Require Emacs' package functionality
(require 'package)

;; Add the Melpa repository to the list of package sources
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

;; Initialise the package system.
(package-initialize)

;; Bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package graphene
  :init (setq graphene-default-font "PragmataPro 9"
              graphene-fixed-pitch-font "PragmataPro 9"
              graphene-variable-pitch-font "Droid Sans 10")
  :ensure t)

(use-package monokai-theme
  :ensure t)

(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)))

(use-package haskell-mode
  :ensure t
  :init (progn (setq haskell-tags-on-save t)
        (add-hook 'haskell-mode-hook (lambda () (ghc-init)))))

(use-package ghc
  :ensure t
  :commands ghc-init ghc-debug
  :config (add-hook 'haskell-mode-hook (lambda () (ghc-init))))

(use-package company-ghc
  :ensure t
  :config (progn (add-to-list 'company-backends 'company-ghc)
                 (setq company-ghc-show-info t)))
(cua-mode t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-backends
   (quote
    (company-ghc company-bbdb company-nxml company-css company-eclim company-semantic company-clang company-xcode company-cmake company-capf company-files
                 (company-dabbrev-code company-gtags company-etags company-keywords)
                 company-oddmuse company-dabbrev)))
 '(flycheck-checkers
   (quote
    (ada-gnat asciidoc c/c++-clang c/c++-gcc c/c++-cppcheck cfengine chef-foodcritic coffee coffee-coffeelint coq css-csslint d-dmd dockerfile-hadolint elixir-dogma emacs-lisp emacs-lisp-checkdoc erlang eruby-erubis fortran-gfortran go-gofmt go-golint go-vet go-build go-test go-errcheck go-unconvert groovy haml handlebars haskell-ghc haskell-hlint html-tidy javascript-eslint javascript-jshint javascript-gjslint javascript-jscs javascript-standard json-jsonlint json-python-json less lua-luacheck lua perl perl-perlcritic php php-phpmd php-phpcs processing protobuf-protoc pug puppet-parser puppet-lint python-flake8 python-pylint python-pycompile r-lintr racket rpm-rpmlint markdown-mdl rst-sphinx rst ruby-rubocop ruby-rubylint ruby ruby-jruby rust-cargo rust scala scala-scalastyle scheme-chicken scss-lint sass/scss-sass-lint sass scss sh-bash sh-posix-dash sh-posix-bash sh-zsh sh-shellcheck slim slim-lint sql-sqlint systemd-analyze tex-chktex tex-lacheck texinfo typescript-tslint verilog-verilator xml-xmlstarlet xml-xmllint yaml-jsyaml yaml-ruby)))
 '(safe-local-variable-values
   (quote
    ((2flycheck-disabled-checkers
      (quote
       (haskell-stack-ghc)))
     (flycheck-disabled-checkers . haskell-stack-ghc)
     (Tab-Width . 4)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(add-to-list 'default-frame-alist '(font . "-unknown-PragmataPro-normal-normal-normal-*-12-*-*-*-*-0-iso10646-1"))

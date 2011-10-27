(require 'multi-web-mode)
(setq mweb-default-major-mode 'html-mode)
(setq mweb-tags '((php-mode "<\\?php\\|<\\? \\|<\\?=" "\\?>")
                  (js-mode "<script +\\(type=\"text/javascript\"\\|language=\"javascript\"\\)[^>]*>" "</script>")
                  (css-mode "<style +type=\"text/css\"[^>]*>" "</style>")))
(setq mweb-filename-extensions '("php" "htm" "html" "ctp" "phtml" "php4" "php5"))

;; linum.el case (b/c add-hook-after-load)
(eval-after-load "linum"
  '(progn
     (add-hooks-after-load
      (mapcar #'(lambda (mode)
                (intern
                 (concat (symbol-name mode) "-hook")))
              (cons mweb-default-major-mode
                    (mapcar #'(lambda (x) (car x)) mweb-tags)))
      (lambda () (unless (eq major-mode 'image-mode)
              (linum-mode 1))))))

(multi-web-global-mode 1)

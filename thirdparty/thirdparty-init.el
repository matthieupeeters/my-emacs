(when nil 


                                        ; Easydraw
                                        ; [[https://github.com/misohena/el-easydraw][el-easydraw]]

  (add-to-list 'load-path (concat (file-name-directory (or load-file-name (buffer-file-name))) "./el-easydraw/"))



  (with-eval-after-load 'org
    (require 'edraw-org)
    (edraw-org-setup-default))
  ;; When using the org-export-in-background option (when using the
  ;; asynchronous export function), the following settings are
  ;; required. This is because Emacs started in a separate process does
  ;; not load org.el but only ox.el.

  (with-eval-after-load "ox"
    (require 'edraw-org)
    (edraw-org-setup-exporter)))

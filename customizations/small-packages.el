;; Which-key shows key bindings following an incomplete command. 
(use-package which-key
  :ensure t 
  :config
  (which-key-mode))

(use-package eww-lnum
  :ensure t
  :defer t)

(use-package markdown-mode
  :ensure t
  :defer t)

(use-package helm 
  :ensure t)

(use-package neotree
  :ensure t
  :defer t)


;; Load quite a lot of small packages. 


(defmacro use-multiple-packages (&rest packages)
  "Ensure and defer PACKAGES using `use-package'."
  (declare (indent defun))
  (macroexp-progn
   (mapcar (lambda (package)
             `(use-package ,package :ensure t :defer t))
           packages)))

(use-multiple-packages 
  try)

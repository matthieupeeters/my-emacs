
(use-package org-static-blog
  :ensure t)




(setq org-static-blog-publish-title "Matthieu Peeters' blog")
(setq org-static-blog-publish-url "https://blog.matthieupeeters.nl/")

(setq org-static-blog-publish-directory "/var/www/html/blog.matthieupeeters.nl/")
(setq org-static-blog-posts-directory (concat org-static-blog-publish-directory "posts/"))
(setq org-static-blog-drafts-directory (concat org-static-blog-publish-directory "drafts/"))
(setq org-static-blog-enable-tags t)
(setq org-export-with-toc nil)
(setq org-export-with-section-numbers nil)

;; This header is inserted into the <head> section of every page:
;;   (you will need to create the style sheet at
;;    static/style.css
;;    and the favicon at
;;    static/favicon.ico)
(setq org-static-blog-page-header
"<meta name=\"author\" content=\"Matthieu Peeters\">
<meta name=\"referrer\" content=\"no-referrer\">
<link href= \"static/style.css\" rel=\"stylesheet\" type=\"text/css\" />
<link rel=\"icon\" href=\"static/favicon.ico\">")

;; This preamble is inserted at the beginning of the <body> of every page:
;;   This particular HTML creates a <div> with a simple linked headline
(setq org-static-blog-page-preamble 
      (concat 
       "<div class=\"header\">
  <a href=\"" org-static-blog-publish-url "\">" org-static-blog-publish-title "</a></div>"))

;; This postamble is inserted at the end of the <body> of every page:
;;   This particular HTML creates a <div> with a link to the archive page
;;   and a licensing stub.
(setq org-static-blog-page-postamble
      (concat  "<div id=\"archive\">
<!--  <a href=\"" org-static-blog-publish-url "archive.html\">Other posts</a> -->
  </div>
  <center>
  &#169; " (format-time-string "%Y") " Matthieu Peeters</center>"
))

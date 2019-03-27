(TeX-add-style-hook
 "beamerthememacquarie"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("textpos" "absolute" "overlay")))
   (TeX-run-style-hooks
    "textpos")
   (TeX-add-symbols
    "placefig"))
 :latex)


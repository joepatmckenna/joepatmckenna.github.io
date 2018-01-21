(TeX-add-style-hook
 "cv"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("cv" "11pt")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("inputenc" "utf8") ("fontenc" "T1") ("ulem" "normalem")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "cv11"
    "inputenc"
    "fontenc"
    "graphicx"
    "grffile"
    "longtable"
    "wrapfig"
    "rotating"
    "ulem"
    "amsmath"
    "textcomp"
    "amssymb"
    "capt-of"
    "hyperref")
   (LaTeX-add-labels
    "sec:org9041fb0"
    "sec:orgee26511"
    "sec:org130747b"
    "sec:orgab23e8e"
    "sec:org50156cf"
    "sec:orgd2ada5f"
    "sec:orge83225e"
    "sec:org7c2fcf6"
    "sec:orga9331ef"
    "sec:org8fcd3ff"
    "sec:org33b2d4d"
    "sec:orgbddb817"
    "sec:org21c1c69"
    "sec:org66cd460"
    "sec:org2295ee3"
    "sec:org2a8d679"
    "sec:org35ecd32"
    "sec:orga24de46"
    "sec:org86b69a4"
    "sec:org5fb559a"
    "sec:org7f71b59"
    "sec:org62e73a8"
    "sec:orgf3fa30e"
    "sec:orgd3edfb2"
    "sec:orgff525f8"
    "sec:org282be8c"))
 :latex)


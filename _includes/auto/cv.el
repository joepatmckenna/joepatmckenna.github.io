(TeX-add-style-hook
 "cv"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("cv" "11pt")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("inputenc" "utf8") ("fontenc" "T1") ("ulem" "normalem")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
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
    "sec:orga781e8d"
    "sec:orga02a735"
    "sec:org5e931a5"
    "sec:org373e84b"
    "sec:org781d516"
    "sec:org81b44c1"
    "sec:org5630bcf"
    "sec:orgcfb9616"
    "sec:orgdfe71c8"
    "sec:orgbd19d3c"
    "sec:orga4bbe18"
    "sec:org96a7679"
    "sec:orgdffa697"
    "sec:org0178a17"
    "sec:org68ab790"
    "sec:orgcc8f6e5"
    "sec:orgabcf682"
    "sec:org24eece8"
    "sec:org849558f"
    "sec:org0db88f8"
    "sec:orge87e890"
    "sec:org65352f4"
    "sec:orgd2ab3c2"
    "sec:org74d3eb0"
    "sec:org4bf1152"
    "sec:org3445bda"
    "sec:org977c013"))
 :latex)


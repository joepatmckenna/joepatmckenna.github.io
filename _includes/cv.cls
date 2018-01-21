\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv}[2016/07/04 Custom cv LaTeX class]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClassWithOptions{article}
% \RequirePackage{color}
% \RequirePackage[options]{Package}[date]
\renewcommand{\normalsize}{\fontsize{10pt}{12pt}\selectfont}
\setlength{\textwidth}{5in}
\setlength{\textheight}{8in}
% sans font 
\renewcommand{\familydefault}{\sfdefault}
% margins
\RequirePackage{geometry}
\geometry{margin=1in}
% output of \maketitle
\makeatletter
\def\maketitle{
  \begin{center}
    {\LARGE\@title\par}
  \end{center}
  \par 
  \vskip 1.5em}
\fi
\makeatother
% section title appearance and spacing
\RequirePackage{titlesec}
\titleformat{\section}{\large\raggedright\compact}{}{0pt}{}[\hrule]
\titleformat{\subsection}{\big\raggedright\compact}{}{0pt}{}
\titlespacing*{\section}{0em}{0em}{1em}{}
\titlespacing*{\subsection}{0em}{0em}{1em}{}
% list spacing
\RequirePackage{enumitem}
\setlist[itemize]{noitemsep,nosep}
% itemize bullet size
\renewcommand\labelitemi{\tiny$\bullet$}
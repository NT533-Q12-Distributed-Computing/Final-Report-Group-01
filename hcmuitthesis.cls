% ========= Config paper and font =============
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hcmuitthesis}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions\relax
\LoadClass[14pt,a4paper]{memoir}
% ========== Require package to setup paper, link, language
\RequirePackage[utf8]{inputenc}
\RequirePackage[T5]{fontenc}
\RequirePackage{anyfontsize,mathptmx}
\RequirePackage{geometry,graphicx,indentfirst,setspace}
\RequirePackage{tikz}
\RequirePackage[center]{caption}
\PassOptionsToPackage{bookmarks=false}{hyperref}
\RequirePackage{hyperref}
\RequirePackage[vietnamese,english]{babel}
\RequirePackage[utf8]{vietnam}
\RequirePackage{listings}
\PassOptionsToPackage{nowarn}{tracklang}
\RequirePackage[nolangwarn,noredefwarn]{glossaries}
\RequirePackage{placeins}
\RequirePackage{amsfonts,amssymb,amsmath,mathtools}
\RequirePackage{textcomp}
\RequirePackage{lineno}
\RequirePackage{tabularx,booktabs,longtable}
\RequirePackage{lscape}
\RequirePackage[autopunct=false]{csquotes}
\RequirePackage[sorting=nyt,language=english]{biblatex}
\DeclareLanguageMapping{vietnamese}{english}
\RequirePackage{makecell}
\RequirePackage{subcaption}
\RequirePackage{float}
\RequirePackage{adjustbox}
\RequirePackage{multirow}
\RequirePackage{rotating}
\usetikzlibrary{calc}

% Define color and column type
\hypersetup{
  colorlinks=true,
  linkcolor=black,
  citecolor=blue,
  urlcolor=blue,
  hypertexnames=false
}
\definecolor{dkgreen}{rgb}{0,0.6,0}
\definecolor{gray}{rgb}{0.5,0.5,0.5}
\definecolor{mauve}{rgb}{0.58,0,0.82}
\newcolumntype{C}[1]{>{\centering\arraybackslash}m{#1}}
% Config figure path
\graphicspath{ {./graphics} }

% Chapter title spacing (memoir-native)
\setlength{\beforechapskip}{2cm}
\setlength{\afterchapskip}{20pt}


% Config for math in quantum computin
\DeclarePairedDelimiter\bra{\langle}{\rvert}
\DeclarePairedDelimiter\ket{\lvert}{\rangle}
\DeclarePairedDelimiterX\braket[2]{\langle}{\rangle}{#1 \delimsize\vert#2}

% Config listings 
\lstset{
  frame=tb,
  aboveskip=3mm,
  belowskip=3mm,
  showstringspaces=false,
  columns=fullflexible,
  basicstyle={\small\ttfamily},
  numbers=left,
  numberstyle=\tiny\color{gray},
  keywordstyle=\color{blue},
  commentstyle=\color{dkgreen},
  stringstyle=\color{mauve},
  breaklines=true,
  postbreak=\mbox{\textcolor{red}{$\hookrightarrow$}\space},
  tabsize=4
}

% ===========Set command to provide param ===========
\newcommand{\@upperuniname}{}
\newcommand{\upperuniname}[1]{\renewcommand{\@upperuniname}{#1}}
\newcommand{\@uniname}{}
\newcommand{\uniname}[1]{\renewcommand{\@uniname}{#1}}
\newcommand{\@deptname}{}
\newcommand{\deptname}[1]{\renewcommand{\@deptname}{#1}}
\newcommand{\@reporttype}{}
\newcommand{\reporttype}[1]{\renewcommand{\@reporttype}{#1}}
\newcommand{\@stumajor}{}
\newcommand{\stumajor}[1]{\renewcommand{\@stumajor}{#1}}
\newcommand{\@titleen}{}
\newcommand{\titleen}[1]{\renewcommand{\@titleen}{#1}}
\newcommand{\@defcouncil}{Council}
\newcommand{\defcouncil}[1]{\renewcommand{\@defcouncil}{#1}}
\newcommand{\@supervisor}{}
\newcommand{\supervisor}[1]{\renewcommand{\@supervisor}{#1}}
\newcommand{\@supervisorname}{}
\newcommand{\supervisorname}[1]{\renewcommand{\@supervisorname}{#1}}
\newcommand{\@secretary}{Secretary}
\newcommand{\secretary}[1]{\renewcommand{\@secretary}{#1}}
\newcommand{\@instruction}{}
\newcommand{\instruction}[1]{\renewcommand{\@instruction}{#1}}
\newcommand{\@stuname}{}
\newcommand{\stuname}[1]{\renewcommand{\@stuname}{#1}}
\newcommand{\@stunamewithid}{}
\newcommand{\stunamewithid}[1]{\renewcommand{\@stunamewithid}{#1}}
\newcommand{\@reportplace}{}
\newcommand{\reportplace}[1]{\renewcommand{\@reportplace}{#1}}


% =========== Overwrite exist command to custom project ============
\renewcommand{\@title}{}
\renewcommand{\large}{\fontsize{15}{15}\selectfont}
\renewcommand{\Large}{\fontsize{20}{20}\selectfont}
\renewcommand{\arraystretch}{1.2}
\renewcommand*{\lstlistingname}{Đoạn mã}
\renewcommand\lstlistlistingname{Danh sách đoạn mã}

\renewcommand*{\glossarysection}[2][]{%
  \chapter*{Danh sách các từ viết tắt}
  \addcontentsline{toc}{chapter}{Danh sách các từ viết tắt}
}


% ==========Setup paper margin and footer==========
\geometry{
  paper=a4paper,
  left=3cm,
  right=2cm,
  vmargin=2cm,
  includeheadfoot=true,
  headheight=30pt
}
\OnehalfSpacing
\raggedbottom
\setlength{\emergencystretch}{2em}

% Numbering depth for sections and table of contents
\setsecnumdepth{subsubsection}
\settocdepth{subsubsection}

% Subsubsection heading style (memoir-native)
\setsubsubsecheadstyle{\normalfont\normalsize\bfseries}


% Set numwidths
\setlength{\cfttablenumwidth}{3em}
\setlength{\cftfigurenumwidth}{3em}

% ========== Page style ==========
\makepagestyle{thesis}
\makeheadrule{thesis}{\textwidth}{0.3pt}
\makeevenhead{thesis}{\bfseries\rightmark}{}{}
\makeoddhead{thesis}{}{}{\bfseries\rightmark}
\makeevenfoot{thesis}{}{\thepage}{}
\makeoddfoot{thesis}{}{\thepage}{}
\nouppercaseheads
\aliaspagestyle{chapter}{thesis}
\pagestyle{thesis}

% first cover page
\def\coverpage{
  \pagestyle{empty}
  \large\bfseries
  \begin{tikzpicture}[remember picture,overlay]
    \draw[line width=3pt](
    $(current page.north west) + (3.0cm,-2.0cm)$
    ) rectangle (
    $(current page.south east) + (-2.0cm,2.0cm)$
    );
    \draw[line width=1pt](
    $(current page.north west) + (2.9cm,-1.9cm)$
    ) rectangle (
    $(current page.south east) + (-1.9cm,1.9cm)$
    );
  \end{tikzpicture}
  \vspace*{-3\baselineskip}
  \begin{center}
    \uppercase{\@upperuniname} \\
    \uppercase{\@uniname} \\
    \uppercase{\@deptname} \\
    \vfill
    \uppercase{\@stuname}
    \vfill
    \uppercase{\@reporttype}
    \vfill
    {\Large{\parbox[c]{0.9\linewidth}{\centering\@title}}} \\
    \vfill
    {\Large{\parbox[c]{0.8\linewidth}{\centering\@titleen}}}
    \vfill
    \uppercase {\@stumajor}
  \end{center}
  \vfill
  \vfill
  \mdseries
  \begin{center}
    \uppercase{\@reportplace \the\year{}}
  \end{center}
  \normalsize
  \cleardoublepage
  \pagestyle{thesis}
}

%Second Cover page
\def\secondcoverpage{
  \pagestyle{empty}
  \large\bfseries
  \begin{tikzpicture}[remember picture,overlay]
    \draw[line width=3pt](
    $(current page.north west) + (3.0cm,-2.0cm)$
    ) rectangle (
    $(current page.south east) + (-2.0cm,2.0cm)$
    );
    \draw[line width=1pt](
    $(current page.north west) + (2.9cm,-1.9cm)$
    ) rectangle (
    $(current page.south east) + (-1.9cm,1.9cm)$
    );
  \end{tikzpicture}
  \vspace*{-3\baselineskip}
  \begin{center}
    \uppercase{\@upperuniname} \\
    \uppercase{\@uniname} \\
    \uppercase{\@deptname} \\
    \vfill
    \uppercase{\@stunamewithid}
    \vfill
    \uppercase{\@reporttype}
    \vfill
    {\Large{\parbox[c]{0.9\linewidth}{\centering\@title}}} \\
    \vfill
    {\Large{\parbox[c]{0.8\linewidth}{\centering\@titleen}}}
    \vfill
    \uppercase {\@stumajor}
    \vfill
    \uppercase{\@supervisor} \\
    \uppercase{\@supervisorname}
  \end{center}
  \vfill
  \vfill
  \mdseries
  \begin{center}
    \uppercase{\@reportplace \the\year{}}
  \end{center}
  \normalsize
  \cleardoublepage
  \pagestyle{thesis}
}

\def\mainthesis {
  \counterwithin{equation}{chapter}
  \counterwithin{table}{chapter}
  \counterwithin{figure}{chapter}
  \setcounter{secnumdepth}{3}
  \mainmatter
  \pagestyle{thesis}
}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{yapbook}[2010/10/04 Yet Another Project''s book class]

%------------------------------------------------------------------------------
% useful for tex programming
%------------------------------------------------------------------------------
\RequirePackage{needspace}
\RequirePackage[usenames,dvipsnames]{color}
\RequirePackage{kvoptions}

\SetupKeyvalOptions{
    family=YAPBOOK,
    prefix=YAPBOOK@
}
\DeclareStringOption[phpro]{style}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}

\ProcessKeyvalOptions*
\ProcessOptions

\LoadClass{book}
%------------------------------------------------------------------------------
%environment specific
%------------------------------------------------------------------------------
%do the right thing on each driver
\RequirePackage{ifxetex}

\ifxetex
    \RequirePackage{fontspec}
    \RequirePackage{xunicode}
    \defaultfontfeatures{Mapping=tex-text} % To support LaTeX quoting style
    \defaultfontfeatures{Ligatures=TeX}
    \setmainfont[%ItalicFont={Neuton},
        SlantedFont={Charis SIL},
        SlantedFeatures={FakeSlant=0.3}
    ]{Charis SIL}
    % japanese
    \RequirePackage{xeCJK}
    \setCJKmainfont{DejaVu Sans Mono}
    \setCJKfamilyfont{sf}{Kozuka Mincho Pr6N:style=R,Regular}
    \setCJKfamilyfont{tt}{DejaVu Sans Mono}
\else
    \RequirePackage[utf8]{inputenc}
    \RequirePackage[T1]{fontenc}
\fi

%------------------------------------------------------------------------------
%Semantic structure (and structure in general)
%------------------------------------------------------------------------------

\newcommand{\@subtitle}{}
\newcommand{\subtitle}[1]{
   \renewcommand{\@subtitle}{#1}
   \def\thesubtitle{{#1}} %TODO: make useful \thesubtitle, not {\thesubtitle}
}

\newcommand*\cleartoleftpage{%
  \clearpage
  \ifodd\value{page}\hbox{}\newpage\fi
}
\newenvironment{dedication}
    {\cleartoleftpage}
    {\clearpage}

\RequirePackage{styles/\YAPBOOK@style/titlepage}
\renewcommand*{\maketitle}{
    \@maketitle
    \def\thetitle{{\@title}} %TODO: make useful \thetitle, not {\thetitle}
    %\global\let\@subtitle\@empty
    %\global\let\subtitle\relax
%ORIGINAL book.cls definition:
%  \begingroup
    %\renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    %\def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    %\long\def\@makefntext##1{\parindent 1em\noindent
            %\hb@xt@1.8em{%
                %\hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    %\if@twocolumn
      %\ifnum \col@number=\@ne
        %\@maketitle
      %\else
        %\twocolumn[\@maketitle]%
      %\fi
    %\else
      %\newpage
      %\global\@topnum\z@   % Prevents figures from going at top of page.
      %\@maketitle
    %\fi
    %\thispagestyle{plain}\@thanks
  %\endgroup
  %\setcounter{footnote}{0}%
  %\global\let\thanks\relax
  %\global\let\maketitle\relax
  %\global\let\@maketitle\relax
  %\global\let\@thanks\@empty
  %\global\let\@author\@empty
  %\global\let\@date\@empty
  %\global\let\@title\@empty
  %\global\let\title\relax
  %\global\let\author\relax
  %\global\let\date\relax
  %\global\let\and\relax
}

\RequirePackage{styles/\YAPBOOK@style/copyrightpage}
\newcommand*\makecopyright{
    \@makecopyright
}
\renewcommand*\frontmatter{%
    \cleardoublepage
    \pagestyle{empty}
  \@mainmatterfalse
  \pagenumbering{roman}}

\renewcommand*\mainmatter{%
    \cleardoublepage
    \pagestyle{fancy}
  \@mainmattertrue
  \pagenumbering{arabic}}

%The introductory chapter, which does not really contain information on the
%matter at stake
\newcommand*{\introduction}[1]{\cleardoublepage\chapter*{#1}\phantomsection\addcontentsline{toc}{chapter}{#1}}

%chapter intros
\RequirePackage{framed}
%\definecolor{shadecolor}{rgb}{0.95,0.20,0.20}% red{0,0,0}% black
\newenvironment{chapsummary}%
{\vskip -15pt\begin{leftbar}\begin{quotation}\begin{itshape}}%
{\end{itshape}\end{quotation}\end{leftbar}}%

%japanese text
\newcommand{\jptext}[1]{\sffamily#1\rmfamily}

%interesting blocks
\let\checkmark\relax
\RequirePackage{dingbat}
\newcommand{\attention}[1]{\vskip 1em\begin{Large}\leftpointright\end{Large}\parbox{14cm}{#1} \vskip 1em}
\newcommand{\good}[1]{\vskip 1em\begin{Large}\leftthumbsup\end{Large}\parbox{14cm}{#1}\vskip 1em}
\newcommand{\bad}[1]{\vskip 1em\begin{Large}\leftthumbsdown\end{Large}\parbox{14cm}{#1}\vskip 1em}

%exercises
\RequirePackage{exercise}
\renewcommand{\ExerciseName}{Exercițiu}
\renewcommand{\ExePartName}{{\goodbreak}Partea}
\renewcommand{\ExerciseHeader}{\needspace{5\baselineskip} \vskip .5em\hrule\vskip 1em\centerline{\textbf{\large\smallpencil
\ExerciseHeaderNB\ExerciseHeaderTitle%
\ExerciseHeaderDifficulty\ExerciseHeaderOrigin\medskip}}}
\makeatletter\def\endExerciseEnv{\termineliste{1}\@EndExeBox\nobreak\vskip .5em\hrule\vskip 1em\needspace{-10\baselineskip}}\makeatother

%indexes
\RequirePackage{multind} %TODO

%listings
\RequirePackage{listings}
\lstdefinelanguage{pseudocode}{%
keywords={daca,atunci,altfel,start,sfarsit,citeste,afiseaza},%
basicstyle=\ttfamily,%
keywordstyle=\bfseries,%
showstringspaces=false,%
extendedchars}[keywords] 
\lstset{%
    basicstyle=\footnotesize\ttfamily,
    numbers=left,
    numberstyle=\tiny,
    numbersep=5pt,
    tabsize=4,
    extendedchars=true,
    breaklines=true,
    frame=b,
    showtabs=false,
    xleftmargin=17pt,
    showspaces=false,
    showstringspaces=false,
    keywordstyle=\color{Red},
    stringstyle=\color{OliveGreen},
    identifierstyle=\color{Blue},
    frame=shadowbox,
    rulesepcolor=\color{Gray},
    escapeinside={\%*}{*)},     % if you want to add a comment within your code
    mathescape=false
}

%php syntax highlight
\RequirePackage[chapter]{minted}
\definecolor{mintedbackground}{rgb}{0.95,0.95,0.95}
\newmintedfile[phpfile]{php}{
    bgcolor=mintedbackground,
    fontfamily=tt,
    linenos=true,
    numberblanklines=true,
    numbersep=12pt,
    numbersep=5pt,
    gobble=0,
    frame=leftline,
    framerule=0.4pt,
    framesep=2mm,
    funcnamehighlighting=true,
    tabsize=4,
    obeytabs=false,
    mathescape=false
    samepage=false, %with this setting you can force the list to appear on the same page
    showspaces=false,
    showtabs =false,
    texcl=false,
}

%------------------------------------------------------------------------------
%Visuals (hard-coded for all YAP books)
%------------------------------------------------------------------------------
\RequirePackage[left=3cm,top=3cm,right=2cm,bottom=2cm]{geometry}
\RequirePackage[ocgcolorlinks,unicode]{hyperref} %TODO: ocgcolorlinks does not work, TODO: pass arg "xetex"
\hypersetup{%
 %   bookmarks=true,         % show bookmarks bar?
    unicode=true,          % non-Latin characters in Acrobat’s bookmarks
    pdftoolbar=true,        % show Acrobat’s toolbar?
    pdfmenubar=true,        % show Acrobat’s menu?
    pdffitwindow=false,     % window fit to page when opened
    pdfstartview={FitH},    % fits the width of the page to the window
    pdftitle={Dezvoltare web cu PHP},    % title TODO: make it use \@title
    pdfauthor={Flavius Aspra},     % author
    pdfsubject={Programare},   % subject of the document
    pdfcreator={pdflatex},   % creator of the document
    pdfproducer={pdflatex}, % producer of the document
    pdfkeywords={programare php}, % list of keywords
    pdfnewwindow=true,      % links in new window
    colorlinks=false,       % false: boxed links; true: colored links
    linkcolor=red,          % color of internal links
    citecolor=green,        % color of links to bibliography
    filecolor=magenta,      % color of file links
    urlcolor=red,           % color of external links
    linkbordercolor={1 0 0}
}
%%numbering segments in Verbatim
\RequirePackage{fancyvrb}
\makeatletter%
\newcommand{\nl}[1]{\hbox to\z@{%
\hss(#1)\kern3pt}}%
\makeatother

%indent first paragraph
\RequirePackage{indentfirst}

%headings
%\usepackage{titlesec}
\tolerance=1
\emergencystretch=\maxdimen
\hyphenpenalty=10000
\hbadness=10000
\usepackage{fancyhdr}
\pagestyle{fancy}
\setlength{\headheight}{10pt}

\fancyhf{}
\fancyhead[RO]{\leftmark}
\fancyhead[LE]{\rightmark}
\fancyfoot[CO,CE]{\thepage}

%\rhead{\markright}
%\renewcommand{\chaptermark}[1]{\markright{#1}{}}
%\renewcommand{\sectionmark}[1]{\markright{#1}{}}
%\fancyhead[LO,L]{Dezvoltare web cu PHP}
%\fancyhead[RO,R]{\rightmark}
%\fancyfoot[CO,C] {}
%\titleformat{\section}{\huge}{}{0em}{}
%%%% some fixes for underfull/overfull caused by this
%------------------------------------------------------------------------------
%Misc. Packages
%------------------------------------------------------------------------------
\RequirePackage[Lenny]{fncychap}
\RequirePackage{listings}
\let\sups\relax
\RequirePackage{tipa}
\RequirePackage{keystroke}
\RequirePackage{float}
\RequirePackage{alltt}

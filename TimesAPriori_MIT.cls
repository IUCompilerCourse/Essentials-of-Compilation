\newcommand\classname{TimesAPriori_MIT}
\newcommand\lastmodifieddate{2020/07/23}
\newcommand\versionnumber{0.1}

% Are we printing crop marks?
\newif\if@cropmarkson \@cropmarksontrue
\newif\ifsixbynine \sixbyninetrue%6x9 inches, fixed by default
\newif\ifsevenbyten%7x9
\newif\ifsevenbytenwide%7x9
\newif\ifeightbyten%8x9
\newif\ifappendon%
\newif\ifthmcountchapter%
\newif\ifthmcountcont%

\newif\if@aheadpresent\global\@aheadpresentfalse%used for unnumbered heads
\newif\if@bheadpresent\global\@bheadpresentfalse%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{\classname}[\lastmodifieddate\space\versionnumber]

\setlength{\paperheight}{9truein}%
\setlength{\paperwidth}{6truein}%

\DeclareOption{draft}{\PassOptionsToPackage{draft}{graphicx}}
\DeclareOption{a4paper}{\PassOptionsToPackage{a4}{crop}}
\DeclareOption{centre}{\PassOptionsToPackage{center}{crop}}
\DeclareOption{crop}{\PassOptionsToPackage{cam}{crop}\global\@cropmarksontrue}
\DeclareOption{nocrop}{\PassOptionsToPackage{off}{crop}\global\@cropmarksonfalse}
\DeclareOption{info}{\PassOptionsToPackage{info}{crop}}
\DeclareOption{noinfo}{\PassOptionsToPackage{noinfo}{crop}}
%%Trim Sizes%%
\DeclareOption{6x9}{\global\sixbyninetrue}
\DeclareOption{7x10}{\global\sevenbytentrue}
\DeclareOption{7x10wide}{\global\sevenbytenwidetrue}
\DeclareOption{8x10}{\global\eightbytentrue%
\PassOptionsToPackage{width=9truein,height=11truein,cam}{crop}%
}%
%%Numbers like Theorem 1.1, Lemma 1.1, etc.
\DeclareOption{thmnumcontwithchapter}{\global\thmcountchaptertrue}
%%Numbers like Theorem 1.1, Lemma 1.2, etc.
\DeclareOption{thmnumcont}{\global\thmcountconttrue}%

\ExecuteOptions{a4paper,crop,centre,info}

\ProcessOptions

\ifsixbynine%
\setlength{\paperheight}{9truein}%
\setlength{\paperwidth}{6truein}%
\fi%

\ifsevenbyten%
\setlength{\paperheight}{10truein}%
\setlength{\paperwidth}{7truein}%
\fi%

\ifsevenbytenwide%
\setlength{\paperheight}{10truein}%
\setlength{\paperwidth}{7truein}%
\fi%

\ifeightbyten%
\setlength{\paperheight}{10truein}%
\setlength{\paperwidth}{8truein}%
\fi%

% Load all necessary packages
\usepackage{ifxetex,ifluatex}%
\RequirePackage[T1]{fontenc}%
\ifxetex\relax\else%
\RequirePackage{times}%
\RequirePackage[defaultmathsizes,italic]{mathastext}\fi%
\ifluatex\relax\else%
\RequirePackage{times}%
\RequirePackage[defaultmathsizes,italic]{mathastext}\fi%
\RequirePackage{crop,graphicx,amsmath,amsthm,amsfonts,makeidx,array,floatpag}%
\RequirePackage{framed,stfloats,courier}%
\RequirePackage[figuresright]{rotating}%
\RequirePackage{adjustbox}%
\RequirePackage{titlecaps}%
\Addlcwords{the of into that for in and a with in}%%

%\usepackage{ifluatex}%
%\usepackage{ifxetex}%
%\ifxetex%

% Not sure if needed.
\newcommand\@ptsize{0}

% Set twoside printing
\@twosidetrue

% Marginal notes are on the outside edge
\@mparswitchtrue

% Default font sizes
\def\aboveskip{%
\abovedisplayskip=0pt%
\abovedisplayshortskip=0pt%
}%

\renewcommand\normalsize{%
   \@setfontsize\normalsize{10\p@}{13\p@}%
   \abovedisplayskip 7\p@%
   \abovedisplayshortskip \z@%
   \belowdisplayshortskip 3.5\p@%
   \belowdisplayskip 7\p@%
   \let\@listi\@listI}%
\normalsize%
\let\@bls\baselineskip%

\newcommand\small{%
   \@setfontsize\small{9\p@}{11\p@}%
   \abovedisplayskip 8.5\p@%
   \abovedisplayshortskip \z@%
   \belowdisplayshortskip 4\p@%
   \def\@listi{\leftmargin\leftmargini
               \topsep 4\p@%
               \parsep 2\p@%
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}

\newcommand\footnotesize{%
   \@setfontsize\footnotesize{8\p@}{9.5\p@}%
   \abovedisplayskip 6\p@%
   \abovedisplayshortskip \z@%
   \belowdisplayshortskip 3\p@%
   \def\@listi{\leftmargin\leftmargini
               \topsep 3\p@%
               \parsep 2\p@%
               \itemsep \parsep}%
   \belowdisplayskip 6\p@
}

\newcommand\scriptsize{\@setfontsize\scriptsize\@viipt\@viiipt}
\newcommand\tiny{\@setfontsize\tiny\@vpt\@vipt}
%\newcommand\little{\@setfontsize\tiny\@ixpt\@ixpt}
\newcommand\large{\@setfontsize\large\@xiipt{14}}
\newcommand\Large{\@setfontsize\Large\@xivpt{18}}
\newcommand\LARGE{\@setfontsize\LARGE\@xviipt{22}}
\newcommand\huge{\@setfontsize\huge\@xxpt{25}}
\newcommand\Huge{\@setfontsize\Huge\@xxvpt{30}}

\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}

% Line spacing
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}

% Paragraph dimensions and inter-para spacing
\setlength\parskip{0\p@}
\setlength\parindent{10\p@}

% Set inter-para skips
\setlength\smallskipamount{3.25\p@}
\setlength\medskipamount{6.5\p@}
\setlength\bigskipamount{13\p@}

% Page break penalties
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301

% Disallow widows and orphans
\clubpenalty 10000
\widowpenalty 10000

% Disable page breaks before equations, allow pagebreaks after
% equations and discourage widow lines before equations.
\displaywidowpenalty 100
\predisplaypenalty   10000
\postdisplaypenalty  0

% Allow breaking the page in the middle of a paragraph
\interlinepenalty 0

% Disallow breaking the page after a hyphenated line
\brokenpenalty 10000

% Hyphenation; don't split words into less than three characters
\lefthyphenmin=3
\righthyphenmin=3

\ifxetex
\RequirePackage{mathptmx}%
\usepackage{fontspec}%
\defaultfontfeatures{Ligatures=TeX}%
\setmainfont[Mapping=tex-text,Path = ./fonts/ ,
UprightFont= TimesLTStd-Roman,
BoldFont= TimesLTStd-Bold,
ItalicFont=TimesLTStd-Italic,
BoldItalicFont=TimesLTStd-BoldItalic
]{TimesLTStd-Roman}%
\setsansfont[Mapping=tex-text,Path = ./fonts/ ,
%Scale=MatchLowercase,
UprightFont= SyntaxLTStd-Roman,
BoldFont=SyntaxLTStd-Bold,
ItalicFont=SyntaxLTStd-Italic,
]{SyntaxLTStd-Roman}
\fi

\ifluatex
\RequirePackage{mathptmx}%
\usepackage{fontspec}%
\defaultfontfeatures{Ligatures=TeX}%
\setmainfont[Mapping=tex-text,Path = ./fonts/ ,
UprightFont= TimesLTStd-Roman,
BoldFont= TimesLTStd-Bold,
ItalicFont=TimesLTStd-Italic,
BoldItalicFont=TimesLTStd-BoldItalic
]{TimesLTStd-Roman}%
\setsansfont[Mapping=tex-text,Path = ./fonts/ ,
%Scale=MatchLowercase,
UprightFont= SyntaxLTStd-Roman,
BoldFont=SyntaxLTStd-Bold,
ItalicFont=SyntaxLTStd-Italic,
]{SyntaxLTStd-Roman}
\fi

\usepackage{tikz}%
\def\slant#1#2{%
  \tikz[baseline=(X.base), xslant=tan(#1)]%
    \node[inner sep=0pt, xslant=tan(#1)](X){#2};%
}%
\newcommand{\sfbfit}[1]{\slant{15}{\fontsize{9}{13}\selectfont\sansbold{#1}}}%15 degree slant

%%Sansbold definitions
\newcommand{\sansbold}[1]{\textbf{\textsf{#1}}}%
%%

%
% Set page layout dimensions
%
\setlength\headheight{8\p@}         % height of running head
\setlength\topmargin{34\p@}         % head margin
\addtolength\topmargin{-1in}        % subtract out the 1 inch driver margin

\setlength\topskip{10\p@}           % height of first line of text
\AtBeginDocument{\setlength{\topskip}{\fontcharht\font`T}}%
\setlength\headsep{40\p@}           % space below running head --
\addtolength\headsep{-\topskip}     %   base to base with first line of text

\setlength\footskip{\z@}            % space above footer line
\setlength\maxdepth{.5\topskip}     % pages can be short or deep by half a line?

\ifsixbynine
\setlength\textwidth{26pc}          % text measure excluding margins
\fi

\ifsevenbyten%
\setlength\textwidth{30pc}          % text measure excluding margins
\fi

\ifsevenbytenwide
\setlength\textwidth{30pc}          % text measure excluding margins
\fi

\ifeightbyten%
\setlength\textwidth{30pc}          % text measure excluding margins
\fi

\ifsixbynine
\setlength\textheight{39\baselineskip} % 40 lines on a full page,
\addtolength\textheight{\topskip}      %    including the first
\fi                                       %    line on the page

\ifsevenbyten
\setlength\textheight{44\baselineskip} % 45 lines on a full page,
\addtolength\textheight{\topskip}      %    including the first
\fi                                       %    line on the page

\ifsevenbytenwide
\setlength\textheight{44\baselineskip} % 45 lines on a full page,
\addtolength\textheight{\topskip}      %    including the first
\fi                                       %    line on the page

\ifeightbyten
\setlength\textheight{44\baselineskip} % 45 lines on a full page,
\addtolength\textheight{\topskip}      %    including the first
\fi                                       %    line on the page

% Set the margins
% Margin paras are not required. Set lengths to zero.
\ifsixbynine
\setlength\marginparsep{18\p@}
\setlength\marginparpush{6\p@}
\setlength\marginparwidth{40\p@}
\fi

\ifsevenbyten
\setlength\marginparsep{\z@}%
\setlength\marginparpush{\z@}%
\setlength\marginparwidth{48\p@}%
\fi

\ifsevenbytenwide
\setlength\marginparsep{18\p@}
\setlength\marginparpush{6\p@}
\setlength\marginparwidth{40\p@}
\fi

\ifeightbyten
\setlength\marginparsep{\z@}
\setlength\marginparpush{\z@}
\setlength\marginparwidth{72\p@}
\fi

%%%
\ifsixbynine
\setlength\oddsidemargin{5pc}
\addtolength\oddsidemargin{-1in}    % subtract out the 1 inch driver margin
\setlength\@tempdima{\paperwidth}
\addtolength\@tempdima{-\textwidth}
\addtolength\@tempdima{-5pc}
\setlength\evensidemargin{\@tempdima}
\addtolength\evensidemargin{-1in}
\fi

\ifsevenbyten
\setlength\oddsidemargin{6pc}
\addtolength\oddsidemargin{-1in}    % subtract out the 1 inch driver margin
\setlength\@tempdima{\paperwidth}
\addtolength\@tempdima{-\textwidth}
\addtolength\@tempdima{-6pc}
\setlength\evensidemargin{\@tempdima}
\addtolength\evensidemargin{-1in}
\fi

\ifsevenbytenwide%
\setlength\oddsidemargin{6pc}
\addtolength\oddsidemargin{-1in}    % subtract out the 1 inch driver margin
\setlength\@tempdima{\paperwidth}
\addtolength\@tempdima{-\textwidth}
\addtolength\@tempdima{-6pc}
\setlength\evensidemargin{\@tempdima}
\addtolength\evensidemargin{-1in}
\fi

\ifeightbyten%
\setlength\oddsidemargin{9pc}
\addtolength\oddsidemargin{-1in}    % subtract out the 1 inch driver margin
\setlength\@tempdima{\paperwidth}
\addtolength\@tempdima{-\textwidth}
\addtolength\@tempdima{-9pc}
\setlength\evensidemargin{\@tempdima}
\addtolength\evensidemargin{-1in}
\fi

\setlength\columnsep{0\p@}          % space between columns for double-column text
\setlength\columnseprule{0\p@}      % width of rule between two columns

% Footnotes
\setlength\footnotesep{8\p@}     % space between footnotes
% space between text and footnote
\setlength{\skip\footins}{18\p@}%

% Float placement parameters

% The total number of floats that can be allowed on a page.
\setcounter{totalnumber}{10}
% The maximum number of floats at the top and bottom of a page.
\setcounter{topnumber}{5}
\setcounter{bottomnumber}{5}
% The maximum part of the top or bottom of a text page that can be
% occupied by floats. This is set so that at least four lines of text
% fit on the page.
\renewcommand\topfraction{.921}
\renewcommand\bottomfraction{.921}
% The minimum amount of a text page that must be occupied by text.
% This should accomodate four lines of text.
\renewcommand\textfraction{.079}
% The minimum amount of a float page that must be occupied by floats.
\renewcommand\floatpagefraction{.887}

% The same parameters repeated for double column output
\renewcommand\dbltopfraction{.88}
\renewcommand\dblfloatpagefraction{.88}

% Space between floats
\setlength\floatsep    {12\p@}
% Space between floats and text
\setlength\textfloatsep{20\p@}
% Space above and below an inline figure
\setlength\intextsep   {18\p@}

% For double column floats
\setlength\dblfloatsep    {12\p@}% \@plus 2\p@ \@minus 2\p@}
\setlength\dbltextfloatsep{20\p@}% \@plus 2\p@ \@minus 4\p@}

% Space left at top, bottom and inbetween floats on a float page.
\setlength\@fptop{0\p@}         % no space above float page figures
\setlength\@fpsep{12\p@}% \@plus 2fil}
\setlength\@fpbot{0\p@}% \@plus 1fil}

% The same for double column
\setlength\@dblfptop{0\p@}
\setlength\@dblfpsep{12\p@}% \@plus 1fil}
\setlength\@dblfpbot{0\p@}% \@plus 2fil}

% Page styles
%\sodef\track{}{.15em}{0.333em}{0pt}

  \def\ps@headings{%
      \let\@oddfoot\@empty\let\@evenfoot\@empty
      \def\@evenhead{%
\fontsize{8\p@}{8\p@}\selectfont{\sansbold{\thepage}}\hfill{%
\if@mainmatter{\sansbold{\chaptername~\thechapter}}\else\sansbold{\leftmark\vphantom{y}}\fi}}%
      \def\@oddhead{\fontsize{8\p@}{8\p@}\selectfont{\sansbold{\vphantom{y}\rightmark}}\hfill{\sansbold{\thepage}}
}%
      \let\@mkboth\markboth
    \def\chaptermark##1{\markboth{##1}{##1}}%
}

\def\ps@plain{%
\let\@oddfoot\relax \let\@evenfoot\relax
%  \def\@oddfoot{\hfill{{\fontsize{10\p@}{12\p@}\selectfont\thepage}}}%
  \let\@evenfoot\@oddfoot%
  \let\@oddhead\relax \let\@evenhead\relax}%

%
% Sectional units
%

% Lowest level heading that takes a number by default
\setcounter{secnumdepth}{3}

% Counters
\newcounter{part}
\newcounter{chapter}
\newcounter{section}[chapter]
\newcounter{subsection}[section]
\newcounter{subsubsection}[subsection]
\newcounter{paragraph}[subsubsection]
\newcounter{subparagraph}[paragraph]
\newcounter{figure}[chapter]
\newcounter{table}[chapter]


% Form of the numbers
\newcommand\thepage{\arabic{page}}
\renewcommand\thepart{\Roman{part}}
\renewcommand\thechapter{\arabic{chapter}}
\renewcommand\thesection{\thechapter.\arabic{section}}
\renewcommand\thesubsection{\thesection.\arabic{subsection}}
\renewcommand\thesubsubsection{\thesubsection.\arabic{subsubsection}}%
\renewcommand\theparagraph{\thesubsubsection.\arabic{paragraph}}
\renewcommand\thesubparagraph{\theparagraph.\arabic{subparagraph}}
\renewcommand\theequation{\thechapter.\arabic{equation}}
\newcommand\@chapapp{\chaptername}

% Form of the words
\newcommand\contentsname{Contents}
\newcommand\listfigurename{List of Figures}
\newcommand\listtablename{List of Tables}
\newcommand\partname{Part}
\newcommand\chaptername{Chapter}
\newcommand\appendixname{Application}
\newcommand\abstractname{Abstract}
\newcommand\refname{References}
\newcommand\bibname{Bibliography}
\newcommand\indexname{Index}
\newcommand\figurename{Figure}
\newcommand\tablename{Table}

% Clearemptydoublepage should really clear the running heads too
\newcommand{\clearemptydoublepage}{\newpage{\pagestyle{empty}\cleardoublepage}}

% Frontmatter, mainmatter and backmatter

\newif\if@mainmatter \@mainmattertrue

\newcommand\frontmatter{%
  \clearpage
  \@mainmatterfalse
  \pagenumbering{roman}}

\newcommand{\HalfTitle}[1]{\thispagestyle{empty}\bgroup\parindent\z@\raggedright%
\null\vspace{-12\p@}%
\fontsize{12\p@}{14\p@}\selectfont%
\sansbold{#1}\par%
\egroup\clearpage}%

\newcommand{\halftitlepage}{}%

\def\seriespage{\thispagestyle{empty}\parindent=0pt\parskip=0pt
\def\title##1{\vskip6pt{\it##1}}
\def\author##1{\vskip1sp{\rm ##1}}
}
\def\endseriespage{\newpage}
\def\seriestitle#1{{\normalsize\sansbold{MIT PRESS BOOK SERIES}\\[12pt] \sansbold{#1}}}
\def\serieseditor#1{\vskip1sp{\normalsize\rm  #1}\vspace{7\p@}}

\newcommand{\Title}[1]{\thispagestyle{empty}\bgroup\parindent\z@\raggedright%
\fontsize{12\p@}{14\p@}\selectfont%
\sansbold{#1\vphantom{y}}\par%
\egroup}%

\newcommand{\Booksubtitle}[1]{\thispagestyle{empty}\bgroup\parindent\z@\raggedright%
\fontsize{10\p@}{14\p@}\selectfont%
\sansbold{#1\vphantom{y}}\par%
\egroup}%

\newcommand{\edition}[1]{\bgroup\parindent\z@\raggedright%
\vspace{7.5\p@}%
\normalsize%
\sansbold{#1\vphantom{y}}\par%
\egroup}%

\newcommand{\BookAuthor}[1]{\bgroup\parindent\z@\raggedright%
%\vspace{58\p@}%
\vspace{96\p@}%
\normalsize%
\sansbold{#1\vphantom{y}}\par%
\egroup}

\newcommand{\imprint}[1]{\bgroup\parindent\z@\raggedright%
\vfill%
\small\sf#1\par%
\egroup\newpage}%

\newenvironment{copyrightpage}{\thispagestyle{empty}\bgroup\parindent\z@%
\raggedright%
\fontsize{8\p@}{9.5\p@}\selectfont%
\null\vspace{122\p@}\setlength{\parskip}{12.5\p@}%
}{\par\egroup\newpage}%

\newcommand{\dedication}[1]{\thispagestyle{empty}\bgroup\parindent\z@\raggedright%
\null\vspace{132\p@}%
\normalsize%
#1\par%
\egroup}

\def\startonoddpage{\clearpage
\ifodd\c@page\else\null\thispagestyle{empty}\newpage\fi}

\newenvironment{epigraphpage}{\thispagestyle{empty}%
\startonoddpage\bgroup%
\null\vspace{125\p@}%
\small%
}{\egroup\thispagestyle{empty}\newpage}%

\def\epigraph#1#2{\vskip8pt\noindent{\small#1\vphantom{y}}\vskip1sp%
\noindent{\small\rm ---#2}\vskip1pt}%

\def\endchapepigraph{\vspace{2\baselineskip}\@afterheading\@afterindentfalse}%

\newif\iftwocolcontributors
\def\contributors{\@ifnextchar[{\global\twocolcontributorstrue
\addcontentsline{toc}{fmbm}{Contributors}%
\xcontributors}{\ycontributors}}

\def\ycontributors{\startonoddpage\parindent=0pt\parskip=3pt\thispagestyle{empty}
\chapter*{Contributors}%
}

\def\endcontributors{\vskip1sp
\iftwocolcontributors\def\go{\end{multicols}}\else\let\go\relax\fi\go
\newpage}

\def\contrib#1\\{\vskip1sp{\sansbold{#1}}\\
}

\def\xcontributors[#1]{\startonoddpage\parindent=0pt\parskip=3pt\thispagestyle{empty}
\chapter*{Contributors}
\columnsep=1pc
\hyphenpenalty=10000
\raggedright
\begin{multicols}{2}[\vspace*{-12\p@}]}

%%%
\newcommand\mainmatter{%
  \clearpage
  \@mainmattertrue
  \pagenumbering{arabic}}

\newcommand\backmatter{%
  \clearpage
  \@mainmatterfalse}

\def\part{\clearpage\thispagestyle{empty}\global\@topnum\z@
  \secdef\@part\@spart}

\def\@part[#1]#2{%
  \ifnum \c@secnumdepth >\m@ne
    \refstepcounter{part}
%    \typeout{^^J\@chapapp\space\arabic{chapter}:}
    \addcontentsline{toc}{part}{\protect\numberline{\thepart}#2}
  \else
    \addcontentsline{toc}{part}{#2}
  \fi
  \@makeparthead{#2}
  \@afterindentfalse
  \@afterheading}

\def\@spart#1{%
  \thispagestyle{empty}
  \@makesparthead{#1}
  \@afterindentfalse
  \@afterheading}

\def\chapter{\clearpage\startonoddpage\thispagestyle{plain}\global\@topnum\z@
  \secdef\@chapter\@schapter}

\def\@chapter[#1]#2{%
  \ifnum \c@secnumdepth >\m@ne
    \refstepcounter{chapter}
    \typeout{^^J\@chapapp\space\arabic{chapter}:}
    \addcontentsline{toc}{chapter}{\protect\numberline{\thechapter}#2}
  \else
    \addcontentsline{toc}{chapter}{#2}
  \fi
  \chaptermark{#1}
  \@makechapterhead{#2}
  \@afterindentfalse
  \@afterheading\chapterauthor{}\notenum=0%
}

\def\@schapter#1{%
  \chaptermark{#1}
  \thispagestyle{plain}
  \@makeschapterhead{#1}
  \@afterindentfalse
  \@afterheading}

\def\@makeparthead#1{%
  \begingroup%
    \parindent\z@\raggedright%
\null\vspace{-10.5\p@}%
\adjustbox{valign=t}{%
\begin{tabular}[t]{@{}l@{}}
\fontsize{31.4\p@}{31.4\p@}\selectfont\sansbold{\thepart}%
\end{tabular}}\ignorespaces\hspace{22\p@}\ignorespaces%
\adjustbox{valign=t}{%
\begin{tabular}[t]{@{}P{270\p@}@{}}%
\noalign{\vskip-1.5\p@}%
    {\fontsize{11\p@}{14\p@}\selectfont\sansbold{\uppercase{#1}}\par}%
\end{tabular}}%
  \endgroup
  \@afterindentfalse
  \@afterheading
\clearemptydoublepage%
}

\def\partintro{\startonoddpage%
\bgroup%
\setcounter{secnumdepth}{0}%
\thispagestyle{empty}%
\normalsize%
}

\def\endpartintro{\egroup\newpage%
\setcounter{secnumdepth}{3}%
}%

\def\partintrotitle#1{\section*{#1}%
\addcontentsline{toc}{section}{#1}%
}

\let\@chapterauthor\@empty%
\def\chapterauthor#1{\def\@chapterauthor{#1}}%

\def\@makechapterhead#1{%
  \begingroup%
    \parindent\z@\raggedright%
\null\vspace{-7.5\p@}%
\vbox to 138\p@{%
\adjustbox{valign=t}{%
\begin{tabular}[t]{@{}l@{}}%
\fontsize{31\p@}{31\p@}\selectfont\sansbold{\thechapter}%
\end{tabular}}\ignorespaces\hspace{21\p@}\ignorespaces%
\adjustbox{valign=t}{%
\begin{tabular}[t]{@{}P{270\p@}@{}}%
\noalign{\vskip-1.5\p@}%
    {\fontsize{11\p@}{14\p@}\selectfont\sansbold{#1}\vphantom{y}\par}\\%
\ifx\@chapterauthor\@empty\relax\else%
\noalign{\vskip1\p@}\addcontentsline{toc}{contributor}{\@chapterauthor}\fi%
 {\fontsize{9\p@}{14\p@}\selectfont\sansbold{\@chapterauthor\vphantom{y}}\par}%
\end{tabular}}\par%
%\medskip
%    {\fontsize{11}{13}\selectfont\centering\@subtitle\par}%
%\bigskip%
%    {\fontsize{11}{13}\fontshape{it}\selectfont\centering\@author\par}%
\vfill}%
  \endgroup%
  \@afterindentfalse
  \@afterheading}

\def\abstract{\vskip9pt\bgroup\small\noindent{\sansbold{Abstract.}}\ignorespaces\hspace{9\p@}\ignorespaces}%
\def\endabstract{\vskip1sp\egroup\vskip9pt}%

%%%%Appendix Chapter Title
\def\@makeappchapterhead#1{%
  \begingroup%
    \parindent\z@\raggedright%
\null\vspace{-7.5\p@}%
\vbox to 138\p@{%
\adjustbox{valign=t}{%
\begin{tabular}[t]{@{}l@{}}%
\fontsize{31\p@}{31\p@}\selectfont\sansbold{\thechapter}%
\end{tabular}}\ignorespaces\hspace{24\p@}\ignorespaces%
\adjustbox{valign=t}{%
\begin{tabular}[t]{@{}P{255\p@}@{}}%
    {\fontsize{11\p@}{14\p@}\selectfont\sansbold{#1}\vphantom{y}\par}\\%
\ifx\@chapterauthor\@empty\relax\else%
\noalign{\vskip1\p@}\addcontentsline{toc}{contributor}{\@chapterauthor}\fi%
 {\fontsize{9\p@}{14\p@}\selectfont\sansbold{\@chapterauthor\vphantom{y}}\par}%
\end{tabular}}\par%
%\medskip
%    {\fontsize{11}{13}\selectfont\centering\@subtitle\par}%
%\bigskip%
%    {\fontsize{11}{13}\fontshape{it}\selectfont\centering\@author\par}%
\vfill}%
  \endgroup%
  \@afterindentfalse
  \@afterheading}


  \def\@makeschapterhead#1{%
  \begingroup\parindent\z@\raggedright%
\null\vspace{-6.5\p@}%
\vbox to 137.5\p@{%
    {\fontsize{11\p@}{14\p@}\selectfont\sansbold{#1\vphantom{y}}\par}%
\vfill}%
  \endgroup%
  \@afterindentfalse%
  \@afterheading}%


% Section macros

% \@sect redefined to write the long entry to the TOC
\def\@sect#1#2#3#4#5#6[#7]#8{%
  \ifnum #2>\c@secnumdepth
    \let\@svsec\@empty
  \else
    \refstepcounter{#1}%
    \protected@edef\@svsec{\@seccntformat{#1}\relax}%
  \fi
  \@tempskipa #5\relax
  \ifdim \@tempskipa>\z@
    \ifnum#2=1%
    \begingroup
      #6{%
        \@hangfrom{\hskip #3\relax\@svsec}%
          \interlinepenalty \@M \sansbold{#8} \@@par}%
    \endgroup\else
    \begingroup
      #6{%
        \@hangfrom{\hskip #3\relax\@svsec}%
          \interlinepenalty \@M \sansbold{#8} \@@par}%
    \endgroup\fi
    \csname #1mark\endcsname{#7}%
    \addcontentsline{toc}{#1}{%
      \ifnum #2>\c@secnumdepth \else
        \protect\numberline{\csname the#1\endcsname}%
      \fi
      #8}%
  \else
    \def\@svsechd{%
      #6{\hskip #3\relax
      \@svsec #8}%
      \csname #1mark\endcsname{#7}%
      \addcontentsline{toc}{#1}{%
        \ifnum #2>\c@secnumdepth \else
          \protect\numberline{\csname the#1\endcsname}%
        \fi
        #8}}%
  \fi
  \@xsect{#5}}

\def\@ssect#1#2#3#4#5{\@tempskipa #3\relax
   \ifdim \@tempskipa>\z@
     \begingroup
         %\ifnum#1=3%
%         #4\@hangfrom{\hskip #1}%
%         {\interlinepenalty \@M {#5}\par}
%         \else%
         \if@aheadpresent\global\@aheadpresenttrue%
         #4\@hangfrom{\hskip #1}%
         {\interlinepenalty \@M {{\sansbold{#5}}\par}}
         \else
         \if@bheadpresent\global\@bheadpresenttrue%
         #4\@hangfrom{\hskip #1}%
         {\interlinepenalty \@M {{\sansbold{#5}}}\par}
         \else
         #4\@hangfrom{\hskip #1}%
         {\interlinepenalty \@M \sansbold{#5}\par}
         \fi%
         \fi%
%         \fi%
         \endgroup%
   \else
      \def\@svsechd{#4\hskip #1\relax #5\@afterhead}\fi
    \@xsect{#3}\global\@aheadpresentfalse\global\@bheadpresentfalse}

\newdimen\bsecdimen%
\bsecdimen=13pt%%%

\newdimen\asecdimen%
\asecdimen=13pt%

\renewcommand{\@seccntformat}[1]{{\sansbold{\csname the#1\endcsname}\ignorespaces\hspace{9pt}\ignorespaces}}
\newcommand\section{\@startsection {section}{1}{\z@}%
                                   {-\bsecdimen}%
                                   {\asecdimen}
{\fontsize{9\p@}{13\p@}\selectfont\raggedright}}

\newdimen\bsubsecdimen% B and C level above spaces are same
\bsubsecdimen=13pt%%

\newdimen\asubsecdimen%
\asubsecdimen=0.01pt%%

\newcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-\bsubsecdimen}%
                                     {\asubsecdimen}%
{\fontsize{9\p@}{13\p@}\selectfont\raggedright}}

\newcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-\bsubsecdimen}%
                                     {\asubsecdimen}%
{\fontsize{9\p@}{13\p@}\selectfont\raggedright}}

\newcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                     {-7\p@}%
                                     {-9\p@}%
{%\fontsize{10\p@}{13\p@}
\fontsize{9}{13}\sansbold\selectfont\raggedright}}

\newcommand\subparagraph{\@startsection{subparagraph}{5}{\z@}%
                                     {-7\p@}%
                                     {-9\p@}%
{\fontsize{9\p@}{13\p@}\selectfont\raggedright}}

\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{6\p@}
\setlength\belowcaptionskip{\z@}

\long\def\@makecaption#1#2{\vspace{\abovecaptionskip}%
\fontsize{8\p@}{9.5\p@}\selectfont%
  \setbox\@tempboxa=\hbox{#1\ignorespaces\hspace{1em}\ignorespaces#2}%
  {\sansbold{#1}}\par\vspace{2pt}#2%
}

\long\def\@tablecaption#1#2{\fontsize{8\p@}{9\p@}\selectfont%
{\sansbold{#1}}\par{#2\strut}\par
  \vspace{\belowcaptionskip}}

\newcommand{\tabfont}{\fontsize{8}{12}\selectfont}%

\newcommand{\notename}{Notes{\em:}}

% Top rule
\RequirePackage{threeparttable,booktabs}%

\def\hrulefill{\leavevmode\leaders\hrule height .50pt\hfill\kern\z@}

\def\thefigure{\thechapter.\@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename~\thefigure}
\def\figure{\@float{figure}}
\def\endfigure{\end@float}
\@namedef{figure*}{\@dblfloat{figure}}
\@namedef{endfigure*}{\end@dblfloat}
\def\thetable{\thechapter.\@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename~\thetable}
\def\table{\let\@makecaption\@tablecaption\@float{table}}
\let\endtable\end@float
\@namedef{table*}{\let\@makecaption\@tablecaption\@dblfloat{table}}
\@namedef{endtable*}{\end@dblfloat}

\newif\if@rotate \@rotatefalse
\newif\if@rotatecenter \@rotatecenterfalse
\def\rotatecenter{\global\@rotatecentertrue}
\def\rotateendcenter{\global\@rotatecenterfalse}
\def\rotate{\global\@rotatetrue}
\def\endrotate{\global\@rotatefalse}
\newdimen\rotdimen
\def\rotstart#1{\special{ps: gsave currentpoint currentpoint translate
    #1 neg exch neg exch translate}}
\def\rotfinish{\special{ps: currentpoint grestore moveto}}
\def\rotl#1{\rotdimen=\ht#1\advance\rotdimen by \dp#1
    \hbox to \rotdimen{\vbox to\wd#1{\vskip \wd#1
    \rotstart{270 rotate}\box #1\vss}\hss}\rotfinish}
\def\rotr#1{\rotdimen=\ht #1\advance\rotdimen by \dp#1
    \hbox to \rotdimen{\vbox to \wd#1{\vskip \wd#1
    \rotstart{90 rotate}\box #1\vss}\hss}\rotfinish}

\newdimen\tempdime
\newbox\temptbox
\newenvironment{processtable}[3]{\setbox\temptbox=\hbox{\fontsize{9\p@}{11\p@}\selectfont{#2}}%
\tempdime\wd\temptbox\@processtable{#1}{#2}{#3}{\tempdime}}
{\relax}

\newenvironment{@processtable}[4]{%
\if@rotate
\setbox4=\vbox to \textwidth{\vss\hbox to \textheight{\hss%
\begin{minipage}{#4}%
\fontsize{9\p@}{10\p@}\selectfont
\caption{#1}{#2}%
\vskip4pt\noindent
\parbox{#4}{\fontsize{8\p@}{10\p@}\selectfont #3\par}%
\end{minipage}}\vss}%
\else
\setbox4=\hbox to \textwidth{\vbox{\begin{center}\begin{minipage}[t]{#4}%
\fontsize{9\p@}{10\p@}\selectfont
\caption{#1}{#2}%
\vskip4pt\noindent
\parbox{#4}{\fontsize{8\p@}{10\p@}\selectfont #3\par}%
\end{minipage}\end{center}}}%
\fi
\if@rotate\rotl{4}\else\box4\fi}
{\relax}

\newcolumntype{P}[1]{>{\raggedright\arraybackslash}p{#1}}%

\newcommand{\colhead}[1]{\bgroup\selectfont#1\egroup}%

% ******************************
% List numbering and lettering *
% ******************************
\def\labelenumi{{\rm\arabic{enumi}.}}
\def\theenumi{\arabic{enumi}}
\def\labelenumii{{\rm \roman{enumii}.}}
\def\theenumii{a\alph{enumii}}
\def\p@enumii{\theenumi}
\def\labelenumiii{({\rm\roman{enumiii}})}
\def\theenumiii{\roman{enumiii}}
\def\p@enumiii{\theenumi(\theenumii)}
\def\labelenumiv{({\rm\Alph{enumiv}})}
\def\theenumiv{\Alph{enumiv}}
\def\p@enumiv{\p@enumiii\theenumiii}

\newcommand{\alphlist}{%
\def\labelenumi{{\rm\alph{enumi}}}%
\def\theenumi{\alph{enumi}}%
}

\newcommand{\Alphlist}{%
\def\labelenumi{{\rm\Alph{enumi}}}%
\def\theenumi{\Alph{enumi}}%
}

\newcommand{\romanlist}{%
\def\labelenumi{{\rm\roman{enumi}}}%
\def\theenumi{\roman{enumi}}%
}

\newcommand{\Romanlist}{%
\def\labelenumi{{\rm\Roman{enumi}}}%
\def\theenumi{\Roman{enumi}}%
}

\def\labelitemi{\tiny\raise1.25pt\llap{$\bullet$}}%
\def\labelitemii{--}%
\def\labelitemiii{$\ast$}%
\def\labelitemiv{$\cdot$}%


\setlength\leftmargini   {\z@}%
\leftmargin  \leftmargini
\setlength\leftmarginii  {\z@}
\setlength\leftmarginiii {\z@}
\setlength\leftmarginiv  {\z@}
\setlength\leftmarginv   {\z@}
\setlength\leftmarginvi  {\z@}

\setlength\partopsep{\z@}
\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}

\def\@listi{\leftmargin\leftmargini
            %\parsep 4\p@ \@plus2\p@ \@minus\p@
            \topsep 7\p@%
            %\itemsep4\p@ \@plus2\p@ \@minus\p@
            }
\let\@listI\@listi
\@listi
\def\@listii {\leftmargin\leftmarginii
              \labelwidth\leftmarginii
              \advance\labelwidth-\labelsep
              \topsep   1\p@% 4\p@ \@plus2\p@ \@minus\p@
              \parsep    \z@%
              \itemsep   \parsep}
\def\@listiii{\leftmargin\leftmarginiii
              \labelwidth\leftmarginiii
              \advance\labelwidth-\labelsep
              \topsep    \z@%
              \parsep    \z@
              \partopsep \p@%
              \itemsep   \topsep}
\def\@listiv {\leftmargin\leftmarginiv
              \labelwidth\leftmarginiv
              \advance\labelwidth-\labelsep}
\def\@listv  {\leftmargin\leftmarginv
              \labelwidth\leftmarginv
              \advance\labelwidth-\labelsep}
\def\@listvi {\leftmargin\leftmarginvi
              \labelwidth\leftmarginvi
              \advance\labelwidth-\labelsep}

\def\enumargs{%
   \partopsep     \z@
   \itemsep       1\p@
   \parsep        \z@
   \labelsep      0.5em
   \rightmargin   \z@
   \listparindent \parindent
   \itemindent    \z@}

\def\enumerate{%
    \@ifnextchar[{\@numerate}{\@numerate[0.]}}

\def\@numerate[#1]{%
     \ifnum \@enumdepth >3 \@toodeep\else
     \advance\@enumdepth \@ne
     \edef\@enumctr{enum\romannumeral\the\@enumdepth}
     \list{\csname label\@enumctr\endcsname}{%
       \enumargs
       \setlength{\leftmargin}{\csname leftmargin\romannumeral\the\@enumdepth\endcsname}
       \usecounter{\@enumctr}
       \settowidth\labelwidth{#1}
       \addtolength{\leftmargin}{\labelwidth}
       \addtolength{\leftmargin}{\labelsep}
       \def\makelabel##1{\hss\llap{##1}}}%
     \fi
   }
\let\endenumerate\endlist


% Changes to the list parameters for itemize
\def\itemargs{%
   \partopsep     \z@
   \itemsep       1\p@
   \parsep        \z@
   \labelsep      0.5em
   \rightmargin   \z@
   \listparindent \parindent
   \itemindent    \z@}

\def\itemize{%
   \@ifnextchar[{\@itemize}{\@itemize[$\bullet$]}}

\def\@itemize[#1]{%
     \ifnum \@itemdepth >3 \@toodeep\else
     \advance\@itemdepth \@ne
     \edef\@itemctr{item\romannumeral\the\@itemdepth}
     \list{\csname label\@itemctr\endcsname}{%
       \itemargs
       \setlength{\leftmargin}{\csname leftmargin\romannumeral\the\@itemdepth\endcsname}
       \settowidth\labelwidth{#1}
       \addtolength{\leftmargin}{\labelwidth}
       \addtolength{\leftmargin}{\labelsep}
       \def\makelabel##1{\hss \llap{##1}}}%
     \fi
   }
\let\enditemize\endlist

\def\unargs{%
   \partopsep     \z@
   \itemsep       \z@
   \labelwidth    \z@
   \parsep        \z@
   \labelsep      \z@
   \rightmargin   \z@
   \listparindent \parindent
   \leftmargin 12pt
   \itemindent -6pt}

\newenvironment{unlist}{%
\begin{list}{}{%
  \unargs%
  }}{\end{list}}

\newenvironment{description}
               {\list{}{\leftmargin10\p@\itemsep1\p@\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}
\newcommand*\descriptionlabel[1]{\hspace\labelsep
                                \normalfont\sansbold{#1}}
\newenvironment{verse}
               {\let\\\@centercr
                \list{}{\itemsep      \z@
                        \itemindent   -1.5em%
                        \listparindent\itemindent
                        \rightmargin  \leftmargin
                        \advance\leftmargin 1.5em}%
                \item\relax}
               {\endlist}
\newenvironment{quotation}
               {\list{}{\listparindent 1.5em%
                        \itemindent    \listparindent
                        \rightmargin   \leftmargin
                        \parsep        \z@}%
                \item\relax}
               {\endlist}
\def\extitemargs{%
\topsep 9\p@%
   \partopsep     \z@%
   \itemsep       5\p@%
   \parsep        \z@%
   \labelsep      0.5em%
   \rightmargin   \z@%
   \listparindent \parindent%
   \itemindent    \z@}%

\newenvironment{quote}
               {\list{}{\topsep4\p@\leftmargin15pt\rightmargin15\p@\itemindent-5.25\p@\listparindent9\p@}%
                \small\let\itemargs\extitemargs%
                \item\relax}%
               {\endlist}
\let\extract\quote%
\let\endextract\endquote%

\newenvironment{enotequote}
               {\list{}{\topsep4\p@\leftmargin18pt\rightmargin15\p@\itemindent-5.25\p@\listparindent9\p@\parsep\z@}%
                \footnotesize\let\itemargs\extitemargs%
                \item\relax}%
               {\endlist}

\newenvironment{appquote}
               {\list{}{\topsep2\p@\leftmargin15pt\rightmargin15\p@\itemindent-5.25\p@}%
                \fontsize{8\p@}{9.5\p@}\selectfont%
                \item\relax}%
               {\endlist}

\skip\@mpfootins = \skip\footins
\fboxsep=6\p@
\fboxrule=1\p@

%%Boxed text%%
%% Boxed Text
\newcounter{boxtextnum}
\@addtoreset{boxtextnum}{chapter}


\def\bsection#1{\global\advance\c@section by 1
\vskip1sp\vspace{4\p@}\noindent{\fontsize{8}{9}\selectfont\sansbold{\thesection}\hskip4pt
\sansbold{#1}}\\ }

\def\csection#1{\vskip1sp\noindent{\fontsize{8}{9}\selectfont\sansbold{#1}}\\ }
\def\csubsection#1{\vskip1sp\noindent{\fontsize{8}{9}\selectfont\sansbold{#1}}\\ }
\def\csubsubsection#1{\vskip1sp\noindent{\fontsize{8}{9}\selectfont\sansbold{#1}}\\ }

\def\bsubsection#1{\global\advance\c@subsection by 1
\vskip1sp\vspace{4\p@}\noindent{\fontsize{8}{9}\selectfont\sansbold{\thesubsection}\hskip4pt
\sansbold{#1}}\\ }

\def\bsubsubsection#1{\global\advance\c@subsubsection by 1
\vskip1sp\vspace{4\p@}\noindent{\fontsize{8}{9}\selectfont\sansbold{\thesubsubsection}\hskip4pt
\sansbold{#1}}\\ }

\def\xstar{*}

\def\boxedtext#1{%
\vskip12pt
\def\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {-1sp}%
                                    {-1em}%
                               {\reset@font\small\bfseries}}
\c@section=0
\c@subsection=0
\c@subsubsection=0
%%
\def\thesection{\arabic{section}}
\def\thesubsection{\thesection.\arabic{subsection}}
\def\thesubsubsection{\thesubsection.\arabic{subsubsection}}
\let\section\bsection
\let\subsection\bsubsection
\let\subsubsection\bsubsubsection
\let\small\footnotesize%
%%
\def\section##1{\def\one{##1}\ifx\one\xstar\let\go\csection\else\def\go{\bsection{##1}}\fi\go}
\def\subsection##1{\def\one{##1}\ifx\one\xstar\let\go\csubsection\else\def\go{\bsubsection{##1}}\fi\go}
\def\subsubsection##1{\def\one{##1}\ifx\one\xstar\let\go\csubsubsection\else\def\go{\bsubsubsection{##1}}\fi\go}
%%
\def\extract{\vskip1sp\leftskip=12pt \rightskip\leftskip}
\def\endextract{\vskip5pt}

\global\advance\c@boxtextnum by 1
\fboxsep=1pc \fboxrule=.5pt \framed\footnotesize
\parskip=6pt \parindent=0pt
\sansbold{Box \arabic{chapter}.\arabic{boxtextnum}\\
#1
\vskip3pt
}}

\def\endboxedtext{\endframed}
%%%

\definecolor{shadecolor}{cmyk}{0,0,0,0.20}%
\newenvironment{shdadeboxedtext}{\begingroup%
\begin{shaded}%
\advance\hsize by -2\FrameSep%
\@afterheading%
}{\end{shaded}\endgroup}%

%%
\newenvironment{thebibliography}[1]
     {\chapter*{\refname}%
\addcontentsline{toc}{fmbm}{\refname}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \clubpenalty10000
      \@clubpenalty \clubpenalty
      \widowpenalty10000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
\let\@openbib@code\@empty%

\newenvironment{unnumbibliography}[1]{%
 \chapter*{\refname}%
\addcontentsline{toc}{fmbm}{\refname}%
\normalsize\list{}{%
  \usecounter{enumi}%
  \leftmargin 1em\itemindent -1em\parsep \z@
    \itemsep\z@%
 }}%
{\endlist}%


\RequirePackage{multicol}

\newif\if@restonecol
\def\theindex{\@mainmatterfalse
%  \addcontentsline{toc}{chapter}{Index}
  \columnseprule \z@
  \columnsep 12pt\begin{multicols*}{2}[\chapter*{\indexname}\vspace{-10\p@}]
                                %Subject or Author here
  \markboth{\indexname}{\indexname}%
  \parskip\z@\relax\let\item\idxitem\fontsize{8\p@}{9.5\p@}\selectfont}
\def\idxitem{\par\noindent\raggedright\hangindent20\p@}%
\def\subitem{\par\noindent\raggedright\hangindent20\p@\hspace*{10\p@}}%
\def\subsubitem{\par\noindent\raggedright\hangindent20\p@\hspace*{15\p@}}%
\def\endtheindex{\end{multicols*}}
\def\indexspace{\par \vskip 12\p@\relax}
\AtBeginDocument{%
\def\printindex#1#2{\@restonecoltrue\if@twocolumn\@restonecolfalse\fi
  \columnseprule \z@ \columnsep 12pt%
  \newpage\startonoddpage %\twocolumn[{\Large\bf #2 \vskip4ex}]
\begin{multicols*}{2}[\chapter*{#2}\vspace{-10\p@}]%
  \addcontentsline{toc}{fmbm}{#2}
  \@input{#1.ind}\end{multicols*}}
%%
\def\theindex{\@mainmatterfalse
%  \addcontentsline{toc}{chapter}{Index}
  \columnseprule \z@
  \columnsep 12pt%\begin{multicols*}{2}[\chapter*{\indexname}]
                                %Subject or Author here
  \markboth{\indexname}{\indexname}%
  \parskip\z@\relax\let\item\idxitem\fontsize{8\p@}{9.5\p@}\selectfont}%
\def\idxitem{\par\noindent\raggedright\hangindent20\p@}%
\def\subitem{\par\noindent\raggedright\hangindent20\p@\hspace*{10\p@}}%
\def\subsubitem{\par\noindent\raggedright\hangindent20\p@\hspace*{15\p@}}%
\def\endtheindex{}%\end{multicols*}}
\def\indexspace{\par \vskip 10\p@\relax}
%%
}%

% ***********
% Footnotes *
% ***********

\renewcommand\footnoterule{\hbox to 12.5pc{\hrulefill}\par\removelastskip\nointerlineskip\vskip3.5pt\nointerlineskip}%

\usepackage[splitrule]{footmisc}%
  \def\splitfootnoterule{\kern-3\p@ \hbox to 0.5\textwidth{\hrulefill} \kern3.6\p@}

\AtBeginDocument{\renewcommand\@makefntext[1]{%
    \fontsize{8\p@}{9.5\p@}\selectfont\def\@textsuperscript{}%\global\baselineskip=9pt%
    \parindent10pt%
    \noindent\ignorespaces%\hspace*{10pt}\ignorespaces
    \hbox{\@makefnmark.}\ignorespaces\hspace{4\p@}\ignorespaces#1}
}%
\def\@makefnmark{\hbox{\smash{\@textsuperscript{\normalfont\@thefnmark}}}}

%%End Note Definition%%%
\newcount\notenum
\newcount\endnotenum

\def\enotenumstyle{$^{\the\notenum}$}%
\long\def\endnote#1{%%%% For notes at end of chapter
\global\advance\notenum by 1\relax\leavevmode\enotenumstyle%\ [\the\notenum]%
\global\advance\endnotenum by 1\relax%
\long\expandafter\gdef\csname note\the\notenum\endcsname{%
{\leftskip=1.5pc\small\hsize=\textwidth\relax%
\noindent\llap{\hbox to 1.5pc{\the\notenum.\hfill}}%
#1\strut\vskip1sp}\vskip1pt}%
%%%% now for endnotes:
\ifnum\notenum=1\relax%
\immediate\write\@auxout{\string\expandafter\string\gdef\string\csname\space
chapendnote\the\endnotenum\string\endcsname{%
%% The commented out part Might be good, but malfunctioned on first small test.
\ifnum\c@chapter>2 \string\newpage\fi
\string\goodbreak\string\vskip14pt\string\penalty-8000%
{\string\small\space %Notes for
\ifnum\c@chapter>0
\string\sansbold \string {\@chapapp \space
\ifappendon\Alph{chapter}\else\arabic{chapter}\fi\string }%
\else Frontmatter\fi}\string\vskip6pt\global\notenum=1}}\fi%
\long\expandafter\gdef\csname endnote\the\endnotenum\endcsname{%
{\leftskip=1.5pc\small\hsize=\textwidth\relax%
\noindent\llap{\hbox to 1.5pc{\the\notenum.\hfill}}%
#1\strut\vskip1sp}\vskip1pt}}

\def\chapternotes{\ifnum\notenum>0
\section*{\small\bfseries\itshape %Notes for
Chapter \arabic{chapter}}%
%\markright{Notes for Chapter \arabic{chapter}}%
\addcontentsline{toc}{section}{\protect\numberline{}Chapter Notes}%
\parindent=0pt%
\parskip=4pt%
\notenum=0%
\noindent\loop\global\advance\notenum by1\relax%
\expandafter\ifx\csname note\the\notenum\endcsname\relax%
\else%
\csname note\the\notenum\endcsname\relax%
\expandafter\gdef\csname note\the\notenum\endcsname{\relax}%
\repeat%
\fi%
\global\notenum=0\relax%
\vskip1sp%
\leftskip=0pt\relax}%

\def\theendnotes{\chapter*{Notes}%
\addcontentsline{toc}{fmbm}{Notes}%
\vspace{-19\p@}%
\def\enotenumstyle{\ [\the\notenum]}%
\markboth{Notes}{Notes}%
\let\quote\enotequote%
\let\endquote\endenotequote%
\parindent=0pt%
\parskip=4pt%
\endnotenum=0%
\noindent\loop\global\advance\endnotenum by1\relax%
\global\advance\notenum by 1%
\expandafter\ifx\csname endnote\the\endnotenum\endcsname\relax%
\else%
\expandafter\csname chapendnote\the\endnotenum\endcsname%
\expandafter\csname endnote\the\endnotenum\endcsname%
\repeat%
\vskip1sp%
\leftskip=0pt\relax}%

%%%%

\usepackage[natbib,authordate,backend=biber]{biblatex-chicago}%
\AtEveryBibitem{\global\undef\bbx@lasthash}%
\setlength{\bibhang}{5\p@}%
\setlength{\bibitemsep}{3.5\p@}%
%\setlength{\biblabelsep}{-10\p@}%
\def\bibfont{\footnotesize}%
%\setlength{\bibhang}{1cm}
%%%
\newlength{\bibleftadd}%
\setlength{\bibleftadd}{-5\p@}%
%%
\defbibenvironment{bibliography}
  {\vspace{-2\p@}\markboth{\bibname}{\bibname}\list%
     {}%
     {\setlength{\topsep}{\z@}\setlength{\leftmargin}{\bibhang}%
      \setlength{\itemindent}{-\leftmargin}%
      \addtolength{\leftmargin}{\bibleftadd}%
      \setlength{\itemsep}{\bibitemsep}%
      \setlength{\parsep}{\bibparsep}}}
  {\endlist}
  {\item}

%Math parameters

\setlength{\jot}{7\p@}

\def\frenchspacing{\sfcode`\.\@m \sfcode`\?\@m \sfcode`\!\@m
  \sfcode`\:\@m \sfcode`\;\@m \sfcode`\,\@m}

\def\@mathmargin{1.5pc}
\vbadness=9999
\tolerance=9999
\doublehyphendemerits=10000
\doublehyphendemerits 640000   % corresponds to badness 800
\finalhyphendemerits  1000000  % corresponds to badness 1000

% Table and array parameters
\setlength\arraycolsep{.5em}
\setlength\tabcolsep{.5em}
\setlength\arrayrulewidth{.25pt}
\setlength\doublerulesep{2.5pt}
\renewcommand\arraystretch{1}

\def\@fmbmdottedtocline#1#2#3#4#5{%
  \renewcommand\@dotsep{1000}
  \ifnum #1>\c@tocdepth \else
    \vskip \z@ %
    {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
     \parindent #2\relax\@afterindenttrue
     \interlinepenalty\@M
     \leavevmode
     \@tempdima #3\relax
     \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
     {\fontsize{9\p@}{13\p@}\selectfont\sf#4}\nobreak
     \leaders\hbox{$\m@th \mkern \@dotsep mu\hbox{.}\mkern \@dotsep
        mu$}\hfill
     \nobreak
     \hb@xt@\@pnumwidth{\hfil\normalcolor\fontsize{9\p@}{13\p@}\selectfont\sf#5}%
     \par}%
  \fi}

\def\@dottedtocline#1#2#3#4#5{%
  \renewcommand\@dotsep{1000}%
  \ifnum #1>\c@tocdepth \else%
    \vskip \z@ %
    {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip%
     \parindent #2\relax\@afterindenttrue%
     \interlinepenalty\@M%
     \leavevmode%
     \@tempdima #3\relax%
     \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip%
\fontsize{9}{13}\selectfont%
     {\fontsize{9}{13}\selectfont#4}\nobreak%
     \leaders\hbox{$\m@th \mkern \@dotsep mu\hbox{.}\mkern \@dotsep%
        mu$}\hfill%
     \nobreak%
     \hb@xt@\@pnumwidth{\hfil\normalcolor\fontsize{9}{13}\selectfont#5}%%
     \par}%%
  \fi}%


\def\@contributordottedtocline#1#2#3#4#5{%
    \renewcommand\@dotsep{1000}
  \ifnum #1>\c@tocdepth \else
    \vskip 0\p@ %
    {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
     \parindent #2\relax\@afterindenttrue
     \interlinepenalty\@M
     \leavevmode
     \@tempdima #3\relax
     \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
     {#4}\nobreak
     \leaders\hbox{$\m@th \mkern \@dotsep mu\hbox{.}\mkern \@dotsep
        mu$}\hfill
  \nobreak
     \hb@xt@\@pnumwidth{\hfil\normalcolor\normalsize}%
     \par}%
%\vspace{6pt}
  \fi}


\def\@chapterdottedtocline#1#2#3#4#5{%
  \begingroup
\def\numberline##1{\hb@xt@\@tempdima{{\sansbold{##1}}\hfil}}
  \renewcommand\@dotsep{1000}
  \ifnum #1>\c@tocdepth \else
    \vskip 13pt\goodbreak
    {\leftskip #2\relax   \rightskip \@tocrmarg \parfillskip -\rightskip
     \parindent #2\relax\@afterindenttrue
     \interlinepenalty\@M
     \leavevmode
     \@tempdima #3\relax
     \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
\fontsize{9}{13}\selectfont%
     {\fontsize{9}{13}\selectfont\sansbold{#4}}\nobreak
     \leaders\hbox{$\m@th         \mkern \@dotsep mu\hbox{.}\mkern \@dotsep
        mu$}\hfill
      \nobreak
     \hb@xt@\@pnumwidth{\hfil\normalcolor{\fontsize{9}{13}\selectfont#5}}%
     \par}%
  \endgroup
  \fi}

\def\@appendixdottedtocline#1#2#3#4#5{%
  \begingroup
  \renewcommand\@dotsep{1000}
  \ifnum #1>\c@tocdepth \else
    \vskip 9pt\goodbreak
    {\leftskip #2\relax   \rightskip \@tocrmarg \parfillskip -\rightskip
     \parindent #2\relax\@afterindenttrue
     \interlinepenalty\@M
     \leavevmode
     \@tempdima #3\relax
     \null\nobreak\hskip -\leftskip
     {\bfseries #4}\nobreak
     \leaders\hbox{$\m@th         \mkern \@dotsep mu\hbox{.}\mkern \@dotsep
        mu$}\hfill
     \nobreak
     \hb@xt@\@pnumwidth{\hfil\normalcolor\normalsize {\bfseries #5}}%
     \par}%
  \endgroup
  \fi}

\def\@partdottedtocline#1#2#3#4#5{%
  \begingroup
  \def\numberline##1{\hbox to 24\p@{{##1\hss}}}
  \renewcommand\@dotsep{1000}
  \ifnum #1>\c@tocdepth \else
    \vskip 11pt\goodbreak
    {\leftskip #2\relax   \rightskip \@tocrmarg \parfillskip -\rightskip
     \parindent #2\relax\@afterindenttrue
     \interlinepenalty\@M
     \leavevmode
     \@tempdima #3\relax
\advance\leftskip \@tempdima%%added
     \null\nobreak\hskip -\leftskip
     {\fontsize{9\p@}{13\p@}\selectfont\sansbold{\uppercase{#4}}}\nobreak
     \leaders\hbox{$\m@th         \mkern \@dotsep mu\hbox{.}\mkern \@dotsep
        mu$}\hfill
     \nobreak
     \hb@xt@\@pnumwidth{\hfil\normalcolor{}}%\fontsize{9\p@}{13\p@}\selectfont\sansbold#5
     \par\vspace{2\p@}}%
  \endgroup
  \fi}

\def\@figtabdottedtocline#1#2#3#4#5{%
  \renewcommand\@dotsep{1000}%
  \ifnum #1>\c@tocdepth \else%
\def\numberline##1{\hb@xt@\@tempdima{{\fontsize{8.5}{13}\selectfont\sansbold{##1}}\hfil}}
    \vskip \z@ %
    {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip%
     \parindent #2\relax\@afterindenttrue%
     \interlinepenalty\@M%
     \leavevmode%
     \@tempdima #3\relax%
     \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip%
\fontsize{9}{13}\selectfont%
     {\fontsize{9}{13}\selectfont\sf#4}\nobreak%
     \leaders\hbox{$\m@th \mkern \@dotsep mu\hbox{.}\mkern \@dotsep%
        mu$}\hfill%
     \nobreak%
     \hb@xt@\@pnumwidth{\hfil\normalcolor\fontsize{9}{13}\selectfont\sf#5}%%
     \par\vspace{3\p@}}%%
  \fi}%

\newcommand\@pnumwidth{1.5pc}
\newcommand\@tocrmarg{2.55em plus 1fil}
\newcommand\@dotsep{1}             %%% <-- very large value so we don't get any dots
\newcommand\tableofcontents{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi

    \chapter*{Contents}
\markboth{Contents}{Contents}
    \chaptermark{Contents}       %% <-- check the running heads in all \chapter*
    \@starttoc{toc}%                    %%      Code manually with \markboth{}{}
    \if@restonecol\twocolumn\fi
    }

\newcommand\listoffigures{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listfigurename}%
\addcontentsline{toc}{fmbm}{\listfigurename}
      \@mkboth{\MakeUppercase\listfigurename}%
              {\MakeUppercase\listfigurename}%
    \@starttoc{lof}%
    \if@restonecol\twocolumn\fi
    }
\newcommand*\l@figure{\@figtabdottedtocline{1}{\z@}{23.5\p@}}%
\newcommand\listoftables{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listtablename}%
\addcontentsline{toc}{fmbm}{\listtablename}
      \@mkboth{%
          \MakeUppercase\listtablename}%
         {\MakeUppercase\listtablename}%
    \@starttoc{lot}%
    \if@restonecol\twocolumn\fi
    }
\let\l@table\l@figure

\setcounter{tocdepth}{2}%

\newcommand*\l@book[1]{{\vspace{\bigskipamount}\vspace{\medskipamount}\noindent{\large\bfseries #1}}}
\newcommand*\l@part{\@partdottedtocline{0}{0em}{24pt}}
\newcommand*\l@fmbm{\@fmbmdottedtocline{0}{24\p@}{0pt}}
\newcommand*\l@chapter{\@chapterdottedtocline{1}{0pt}{24pt}}
\newcommand*\l@section{\@dottedtocline{2}{24pt}{24pt}}
\newcommand*\l@contributor{\@contributordottedtocline{2}{24pt}{24pt}}
\newcommand*\l@subsection{\@dottedtocline{3}{48pt}{30pt}}
\newcommand*\l@subsubsection{\@dottedtocline{4}{76.5pt}{35pt}}
\newcommand*\l@paragraph{\@dottedtocline{5}{114pt}{40pt}}
\newcommand*\l@subparagraph{\@dottedtocline{5}{154.5pt}{50pt}}
\newcommand*\l@appendix{\@appendixdottedtocline{2}{0em}{17pt}}
\newcommand*\l@appsection{\@dottedtocline{2}{17pt}{23pt}}
\newcommand*\l@endmatter{\@chapterdottedtocline{2}{0em}{0em}}


\flushbottom%
\frenchspacing%
\ps@headings%
\onecolumn%
\fnbelowfloat%

\graphicspath{{g:/artwork/oup/Jork/}}

\hyphenation{Figure Figures Table Tables Section Sections}

% Reset eqnarray to avoid to avoid \arraycolsep between
% columns. Take from a post on comp.text.tex
% by Fred Bartlett <fbartlet@optonline.net>
\newif\if@alignpoint
\def\eqnarray{%
  \stepcounter{equation}%
  \def\@currentlabel{\p@equation\theequation}%
  \global\@eqnswtrue
  \m@th
  \global\@eqcnt\z@
  \tabskip\@centering
  \let\\\@eqncr
  $$\everycr{}\halign to\displaywidth\bgroup
    \hskip\@centering$\displaystyle\tabskip\z@skip{##}$\@eqnsel
  &\global\@eqcnt\@ne\hfil\setbox\z@\hbox{$\displaystyle{{}##{}}$}%
    \global\ifdim\wd\z@>\z@\@alignpointtrue\else\@alignpointfalse\fi
    \box\z@\hfil
  &\global\@eqcnt\tw@$\displaystyle{\if@alignpoint\else{}\fi##}$\hfil
    \tabskip\@centering
  &\global\@eqcnt\thr@@ \hb@xt@\z@\bgroup\hss##\egroup
         \tabskip\z@skip
  \cr}


\def\th@definition{%
  \thm@headsep 1em minus\p@\relax
%%  \let\thm@indent\noindent % no indent
\thm@headfont{\bfseries}% heading font is bold
%%  \thm@notefont{}% same as heading font
\thm@headpunct{}% no period after heading
%%  \let\thm@swap\@gobble
\thm@preskip\bigskipamount
%%  \thm@postskip\theorempreskipamount
  \itshape % body font
}

%%%Appendix%%
\newenvironment{chapappendix}[1][\relax]{\bgroup%
\vspace{11pt}%%%
\noindent{\fontsize{10\p@}{13\p@}\selectfont\mathversion{bold}\raggedright\sansbold{#1}\par}%
\let\section\appsection%
\let\subsection\appsubsection%
\let\subsubsection\appsubsubsection%
\let\paragraph\appparagraph%
\let\subparagraph\appsubparagraph%
\renewcommand{\thechapter}{\Alph{chapter}}%
\setcounter{chapter}{1}%
\setcounter{section}{0}%
\setcounter{subsection}{0}%
\setcounter{subsubsection}{0}%
%\fontsize{8}{10}\selectfont
\footnotesize%
}{\par\egroup}%

\newcommand\appsection{\@startsection {section}{1}{\z@}%
                                     {-11\p@}%
                                     {11\p@}%
{\fontsize{9\p@}{13\p@}\selectfont\mathversion{bold}\raggedright}}

\newcommand\appsubsection{\@startsection{subsection}{2}{\z@}%
                                     {-11\p@}%
                                     {0.01\p@}%
{\fontsize{9\p@}{13\p@}\selectfont\mathversion{bold}\raggedright}}

\newcommand\appsubsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-11\p@}%
                                     {-9\p@}%
{\fontsize{9\p@}{13\p@}\selectfont\mathversion{bold}\raggedright}}

\newcommand\appparagraph{\@startsection{paragraph}{4}{\z@}%
                                     {-11\p@}%
                                     {-9\p@}%
{\fontsize{9\p@}{13\p@}\selectfont\raggedright}}

\newcommand\appsubparagraph{\@startsection{subparagraph}{5}{\z@}%
                                     {-11\p@}%
                                     {-9\p@}%
{\fontsize{9\p@}{13\p@}\selectfont\raggedright}}

%%%Appendix%%
\newcounter{appcounter}%
\setcounter{appcounter}{0}
%\refstepcounter{appcounter}%
\renewcommand{\theappcounter}{\Alph{appcounter}}%

\def\appendix{\par%
\global\appendontrue%
\let\@makechapterhead\@makeappchapterhead%
\renewcommand{\chaptername}{Appendix}%
  \renewcommand{\thechapter}{\Alph{chapter}}%
        \setcounter{chapter}{0}%
        \setcounter{section}{0}%
        \setcounter{table}{0}%
        \setcounter{figure}{0}%
        \setcounter{equation}{0}%
        \setcounter{subsection}{0}%
\let\section\appsection%
\let\subsection\appsubsection%
\let\subsubsection\appsubsubsection%
\let\paragraph\appparagraph%
\let\subparagraph\appsubparagraph%
%        \appendtrue
\def\chaptername{Appendix}%
\footnotesize%
}


\newtheoremstyle{common}
    {9pt}% above space (default)
    {9pt}% below space
    {\small\itshape}% body
    {0em}% indent
    {\bfseries}% head
    {}% punct
    {9\p@}% space
%    {}% custom
{\thmname{\sansbold{#1}}\thmnumber{\@ifnotempty{\sansbold{#1}}{ }{\sansbold{#2}}}%
 \thmnote{ {\sansbold{(#3)}}}}% theorem head
\theoremstyle{common}

\newtheoremstyle{boxcommon}
    {8pt}% above space (default)
    {8pt}% below space
    {\footnotesize\itshape}% body
    {0em}% indent
    {\bfseries}% head
    {}% punct
    {9\p@}% space
%    {}% custom
{\thmname{\sansbold{#1}}\thmnumber{\@ifnotempty{\sansbold{#1}}{ }{\sansbold{#2}}}%
 \thmnote{ {\sansbold{(#3)}}}}% theorem head


%%%With Chapter Number
\ifthmcountchapter
\newtheorem{theorem}{Theorem}[chapter]%
\newtheorem{corollary}{Corollary}[chapter]%
\newtheorem{example}{Example}[chapter]%
\newtheorem{lemma}{Lemma}[chapter]%
\newtheorem{definition}{Definition}[chapter]%
\newtheorem{proposition}{Proposition}[chapter]%
\newtheorem{assumption}{Assumption}[chapter]%
\newtheorem{remark}{Remark}[chapter]%
\else
\ifthmcountcont
\newtheorem{theorem}{Theorem}%
\newtheorem{corollary}[theorem]{Corollary}%
\newtheorem{example}[theorem]{Example}%
\newtheorem{lemma}[theorem]{Lemma}%
\newtheorem{definition}[theorem]{Definition}%
\newtheorem{proposition}[theorem]{Proposition}%
\newtheorem{assumption}[theorem]{Assumption}%
\newtheorem{remark}[theorem]{Remark}%
\else
\newtheorem{theorem}{Theorem}%
\newtheorem{corollary}{Corollary}%
\newtheorem{example}{Example}%
\newtheorem{lemma}{Lemma}%
\newtheorem{definition}{Definition}%
\newtheorem{proposition}{Proposition}%
\newtheorem{assumption}{Assumption}%
\newtheorem{remark}{Remark}%
\fi\fi

%%%Proof%%
\renewenvironment{proof}[1][\proofname]{\par%
  \pushQED{\qed}%
  \normalfont \topsep6\p@\relax%
  \trivlist%
\itemindent\z@  \item[\hskip\labelsep%
        \itshape%
    #1\@addpunct{.}\hspace{2.5\p@}]\ignorespaces%
}{%
  \popQED\endtrivlist\@endpefalse%
}%

\let\cal\mathcal

\makeindex

% Author queries
\newcommand{\query}[2][0pt]{%
  \marginpar{\vspace*{#1}%
    \fbox{\parbox{6pc}{%
     \raggedright\small
        AQ: #2}}}}

%%only for MIT
\font\ldotsfnt=psyr scaled 1000%Donot change this, fixed as per client requirement
\def\ldots{\,\hbox{\ldotsfnt\char188}\,\allowbreak}%

\AtBeginDocument{%
\thinmuskip=3mu%
\medmuskip=3mu%
\thickmuskip=3mu%
}%

\RequirePackage[bookmarks=true,bookmarksnumbered=true,bookmarksopenlevel=1,colorlinks=false,breaklinks,linkcolor=black,citecolor=black,urlcolor=black,hidelinks]{hyperref}%
\ifxetex\relax\else\usepackage{breakurl}\fi%
%\ifluatex\relax\else\usepackage{breakurl}\fi%
\urlstyle{rm}%
\def\url@acsstyle{%
  \def\UrlSpecials{%
    \do\/{\penalty\UrlBreakPenalty\mathchar`/}%
    \do\~{\penalty\UrlBreakPenalty\mathchar`~}%
    \do\.{\penalty\UrlBreakPenalty\mathchar`.}%
    \do\,{\penalty\UrlBreakPenalty\mathchar`,}%
    \do\-{\penalty\UrlBreakPenalty\mathchar`-}%
    \do\_{\penalty\UrlBreakPenalty\mathchar`_}%
    \do\?{\penalty\UrlBreakPenalty\mathchar`?}%
    \do\#{\penalty\UrlBreakPenalty\mathchar"23}%
    \do\%{\Url@percent}%
    \do\={\penalty\UrlBreakPenalty\mathchar`=\penalty\UrlBreakPenalty}%
    \do\&{\penalty\UrlBreakPenalty\mathchar`&\penalty\UrlBreakPenalty}%
    \do\ {\Url@space}\do\^^M{\Url@space}%
    \Url@force@Tilde}%
}
\urlstyle{acs}%

\def\blankline{\vskip13pt\noindent\ignorespaces}

\newcounter{exercise}
\newcounter{subexercise}
\newcounter{subsubexercise}

\def\exercises{\section*{Exercises}\vspace{-12pt}\footnotesize%
\addcontentsline{toc}{section}{\protect\numberline{}Exercises}%
\setcounter{exercise}{0}%
\parindent=2pc%
\parskip=4pt%
}

\def\endexercises{}

\long\def\exer#1{\vskip3pt\global\advance\c@exercise by 1
\global\c@subexercise=0
{\leftskip=1pc
\noindent\hskip-1pc\hbox to 1pc{\bf \arabic{exercise}.\hfill}\ignorespaces#1
\vskip1sp}
}

\long\def\subexer#1{\vskip3pt\global\advance\c@subexercise by 1
\global\c@subsubexercise=0
{\leftskip=27.5\p@%
\noindent\hskip-15.5\p@\hbox to
15.5\p@{\sansbold{(\alph{subexercise})}\hfill}\ignorespaces#1\vskip1sp}}

\long\def\subsubexer#1{\vskip3pt\global\advance\c@subsubexercise by 1
{\leftskip=3pc
\noindent\hskip-1pc\hbox to 1pc{\bf\roman{subsubexercise}.\hfill}\ignorespaces#1\vskip1sp}}

\def\sidebysidesubexer#1#2{\vskip3pt\centerline{\hskip1pc\vtop{\global\advance\c@subexercise by 1
\advance\hsize -14\p@ \hsize=.5\hsize
\noindent\hbox to 14\p@{\sansbold{(\alph{subexercise})}\hfill}
#1}\hfill\vtop{\global\advance\c@subexercise by 1
\advance\hsize -1pc \hsize=.5\hsize
\noindent\hbox to 14\p@{\sansbold{(\alph{subexercise})}\hfill} #2}}}

\def\sidebysidesubsubexer#1#2{\vskip3pt\centerline{\hskip27.5\p@\vtop{\global\advance\c@subsubexercise
by 1\relax%
\advance\hsize -27.5\p@ \hsize=.5\hsize
\noindent\hbox to 15.5\p@{\sansbold{\roman{subsubexercise}.}\hfill}#1}\hfill\vtop{\global\advance\c@subsubexercise by 1
\advance\hsize -27.5\p@ \hsize=.5\hsize
 \noindent\hbox to 15.5\p@{\sansbold{\roman{subsubexercise}.}\hfill}#2}}}

\def\endbookexercises{\chapter*{Exercises}%\addcontentsline{toc}{fmbm}{Exercises}%
\footnotesize
\vspace{-5\p@}%
%\def\tabular{\blankline\footnotesize\savetabular}
%\@namedef{tabular*}##1{\blankline\def\@halignto{to##1}
%\footnotesize\@tabular}
%\markright{Exercises}
\setcounter{exercise}{0}
\parindent=2pc
\parskip=4pt
}

\def\endendbookexercises{}

%%%%


\usepackage{algorithm} %%
\usepackage{algorithmicx}
\usepackage{algpseudocode}

%% Glossary
\def\glossary{\chapter*{Glossary}\addcontentsline{toc}{fmbm}{Glossary}\bgroup\footnotesize%
\vspace{3\p@}%
\parindent=0pt
}
\def\endglossary{\vskip1sp\egroup}

\long\def\term#1#2{\noindent\hbox to
.8in{\vtop{\raggedright\hsize=.7in\footnotesize%
\sansbold{#1}}}\vtop{\footnotesize\advance\hsize-.8in
#2}\vskip10pt}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Notation
\def\notation{\vskip7pt\bgroup\parskip=0pt
\noindent{\fontsize{9}{13}\selectfont\sansbold{Notation}}
\vskip1pt
\let\\=\cr
\halign\bgroup##\hfill\hskip10pt\vrule depth 6pt width0pt height 10pt&##\hfill\\
}
\def\endnotation{\crcr\egroup\egroup\vskip8pt
\global\everypar={\noindent\hskip-\parindent\global\everypar={}}}

\def\dialogue{\vskip4pt}
\def\enddialogue{\vskip7pt}
\def\speaker#1{\vskip-\parskip\vskip3pt\noindent{\it #1}\hskip10pt\relax}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\endinput

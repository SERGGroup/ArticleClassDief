% Filename: steamiron.cls
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dief_article_class}[DIEF class for generating articles]
\LoadClass{elsarticle}
\biboptions{numbers,sort&compress}

% Load required packages
\RequirePackage{geometry}
\RequirePackage{titlesec}
\RequirePackage{fancyhdr}
\RequirePackage{graphicx}
\RequirePackage{amsmath, amssymb}
\RequirePackage{caption}
\RequirePackage{setspace}
\RequirePackage{hyperref}
\RequirePackage{framed} % Framing content
\RequirePackage{multicol} % Multiple columns environment
\RequirePackage{nomencl} % Nomenclature package
\RequirePackage{eurosym}

\makenomenclature
\setlength{\nomitemsep}{-0.8\parskip} % Baseline skip between items
\renewcommand*\nompreamble{\begin{multicols}{2}}
\renewcommand*\nompostamble{\end{multicols}}

% Page layout
\geometry{a4paper, margin=1in}

% Capture Abstract
\makeatletter
\newcommand{\@abstracttxt}{}
\renewenvironment{abstract}{%
    \global\let\@abstracttxt\@empty % Clear previous abstract content
    \global\long\def\add@abstracttxt##1{\gdef\@abstracttxt{##1}} % Define helper macro to capture content
    \collect@body\add@abstracttxt % Collect the body of the abstract environment
}{}

\newcommand{\@keywords}{} % Initialize the macro for the keywords content
\renewenvironment{keyword}{%
    \global\let\@keywords\@empty % Clear any previous keywords content
    \global\long\def\add@keywords##1{\gdef\@keywords{##1}} % Define helper macro to capture keywords content
    \collect@body\add@keywords % Collect the body of the keywords environment
}{}

% Title and Author formatting
\renewcommand{\maketitle}{
    \noindent{\huge \textbf{\@title}}\\[0.5cm]
    \noindent{\large \elsauthors}\\
    
    \elsaddress
    
    \vspace{0.25cm}
    \noindent{\normalsize \@date}\\
    \rule{\textwidth}{0.5pt}
    
    \noindent
    \begin{minipage}[t]{0.25\textwidth}
        \vspace{0.05cm}
        {\large ARTICLE INFO}\\
        \rule{\textwidth}{1pt}\newline
        \textit{Keywords:}
        \newline
        \begingroup
            \def\sep{\newline}  
            \@keywords
        \endgroup
    \end{minipage}%%
    \hfill
    \begin{minipage}[t]{0.7\textwidth}
        \vspace{0.05cm}
        {\large ABSTRACT}\\
        \rule{\textwidth}{1pt}\newline
        \@abstracttxt
    \end{minipage}%%
    
}

% Section formatting
\titleformat{\section}{\normalfont\Large\bfseries}{\thesection}{1em}{}
\titleformat{\subsection}{\normalfont\large\bfseries}{\thesubsection}{1em}{}
\titleformat{\subsubsection}{\normalfont\normalsize\bfseries}{\thesubsubsection}{1em}{}

% Header and Footer
\DeclareRobustCommand\degree[1]{\gdef\@degree{#1}}
\DeclareRobustCommand\accademicyear[1]{\gdef\@accademicyear{#1}}

\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\fancyhead[L]{\small \@degree }
\fancyhead[R]{\small \@accademicyear }
\fancyfoot[C]{\thepage}

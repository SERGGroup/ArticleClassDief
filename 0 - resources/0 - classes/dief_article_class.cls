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

% Colors Definition
\usepackage[most]{tcolorbox} % For creating colored boxes
\RequirePackage{xcolor}
\definecolor{UNIFIblue}{RGB}{0, 65, 128} 
\definecolor{UNIFIred}{RGB}{210, 43, 37} 
\definecolor{lightgray}{gray}{0.95} % Define light gray color

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

% Header and Footer
\DeclareRobustCommand\degree[1]{\gdef\@degree{#1}}
\DeclareRobustCommand\accademicyear[1]{\gdef\@accademicyear{#1}}
\DeclareRobustCommand\tutor[1]{\gdef\@tutor{#1}}

\degree{L.M. Ingegneria Energetica \\ \textbf{\large \color{UNIFIred} Laboratorio di Termodinamica e Termoeconomia per le Macchine}}
\accademicyear{A.A. 2024-2025}

% Title and Author formatting
\renewcommand{\maketitle}{
    
    \begin{minipage}[t]{0.20\textwidth}
        \includegraphics[width=\textwidth]{unifi-logo.png}
    \end{minipage}%%
    \hfill
    \begin{minipage}[t]{0.7\textwidth}
        \begin{tcolorbox}[
            colback=lightgray,   % Background color
            colframe=lightgray,  % Border color
            valign=center,
            boxrule=0.01pt,       % Border thickness
            arc=0mm,             % No rounded corners
            width=\textwidth,    % Full text width
            height=0.30\textwidth,
            left=2mm,            % Left padding
            right=2mm,           % Right padding
            top=2mm,             % Top padding
            bottom=2mm           % Bottom padding
        ]
            \noindent{\@degree}\\[0.25cm]        \noindent{\small\textit{\@accademicyear}}
        \end{tcolorbox}
    \end{minipage}
    
    \vspace{0.25cm}
    \noindent{\rule{\textwidth}{2pt}}
    \vspace{0.25cm}

    \noindent{\color{UNIFIblue} \huge \textbf{\@title}}\\[0.5cm]
    \noindent{\large \elsauthors}\\
    
    \elsaddress
    
    \vspace{0.25cm}
    \noindent{\normalsize Tutor: \@tutor}\\
    \noindent{\normalsize \@date}\\
    \rule{\textwidth}{1pt}
    
    \noindent
    \begin{minipage}[t]{0.25\textwidth}
        \vspace{0.05cm}
        {\color{UNIFIblue} \Large \textbf{Article Info}}\\
        \rule{\textwidth}{0.5pt}\newline
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
        {\color{UNIFIblue} \Large \textbf{Abstract}}\\
        \rule{\textwidth}{0.5pt}\newline
        \@abstracttxt
    \end{minipage}%%
    
    \vspace{0.5cm}
    \noindent\rule{\textwidth}{1pt}

}

% Section formatting
\titleformat{\section}{\color{UNIFIblue}\normalfont\Large\bfseries}{\thesection}{1em}{}
\titleformat{\subsection}{\normalfont\large\bfseries}{\thesubsection}{1em}{}
\titleformat{\subsubsection}{\normalfont\normalsize\bfseries}{\thesubsubsection}{1em}{}


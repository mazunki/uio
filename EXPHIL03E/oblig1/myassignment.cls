%%
%% This is file `assignment.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% assignment.dtx
%% Copyright (C) 2004 Madhusudan Singh.
%% This material is subject to the LaTeX Project Public License. See http://www.ctan.org/tex-archive/help/Catalogue/licenses.lppl.html for the details of that license.

\ProvidesClass{myassignment}[Rolf Vidar Hoksaas]
\NeedsTeXFormat{LaTeX2e}[1999/09/01]

\DeclareOption{twoside}{\PassOptionsToPackage{twoside}{article}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}\typeout{Delegating option ``\CurrentOption'' to the standard LaTeX2e article class, I hope you know what you are doing.}}

\ProcessOptions

\LoadClass[10pt,a4paper]{article}
% haha im lazy
\usepackage[margin=1in]{geometry}
\usepackage{amsmath}
\usepackage{amsthm}
\usepackage[utf8]{inputenc}
\usepackage{lmodern}
\usepackage{todonotes}
\usepackage[bottom]{footmisc}
% citing stuff
\usepackage[
    style=apa
]{biblatex}
\addbibresource{mybib.bib}
\setlength\bibitemsep{1.75\itemsep}
\setlength\bibinitsep{1.75\itemsep}
% custom paragraph sizes
\setlength\parskip{1.75ex}


\newcommand\Season{%
    \ifnum\month=1\relax Winter, \the\year \fi%%
    \ifnum\month=2\relax Winter, \the\year \fi%%
    \ifnum\month=3\relax Spring, \the\year \fi%%
    \ifnum\month=4\relax Spring, \the\year \fi%%
    \ifnum\month=5\relax Spring, \the\year \fi%%
    \ifnum\month=6\relax Summer, \the\year \fi%%
    \ifnum\month=7\relax Summer, \the\year \fi%%
    \ifnum\month=8\relax Summer, \the\year \fi%%
    \ifnum\month=9\relax Autumn, \the\year \fi%%
    \ifnum\month=10\relax Autumn, \the\year \fi%%
    \ifnum\month=11\relax Autumn, \the\year \fi%%
    \ifnum\month=12\relax Winter, \the\year \fi%%
}


\RequirePackage{ifthen}
\setlength{\textwidth}{6.0in}
\pagestyle{empty}
\newcommand{\@coursetitle}{{\em No course title specified}}
\newcommand{\@courselabel}{{\em No course label specified}}
\newcommand{\@exercisesheet}{{\em No exercise sheet title specified}}
\newcommand{\@ExerciseSheet}{{\em NO EXERCISE SHEET TITLE SPECIFIED}}
\newcommand{\@semester}{{\em \Season }}
\newcommand{\@student}{{\em Rolf Vidar Hoksaas}}
\newcommand{\@subject}{}
\newcommand{\@university}{Universitetet i Oslo}
\newcommand{\@school}{Institutt for Informatikk}
\newcommand{\solutionstext}{\bfseries (Solutions)}
\newcommand{\coursetitle}[1]{\renewcommand{\@coursetitle}{{#1}}}
\newcommand{\courselabel}[1]{\renewcommand{\@courselabel}{{#1}}}
\newcommand{\exercisesheet}[2]{%
\renewcommand{\@exercisesheet}{#1}%
\renewcommand{\@ExerciseSheet}{\protect\uppercase{#1}}%
\renewcommand{\@subject}{#2}%
}
\newcommand{\semester}[1]{\renewcommand{\@semester}{{#1}}}
\newcommand{\student}[1]{\renewcommand{\@student}{{#1}}}
\newcommand{\university}[1]{\renewcommand{\@university}{#1}}
\newcommand{\school}[1]{\renewcommand{\@school}{#1}}
\newcommand{\department}[1]{}
\newcommand{\PB}{{\bfseries Problem}}
\newcounter{problem}
\renewcommand{\theequation}{\arabic{problem}-\arabic{equation}}
\newcommand{\e}{\epsilon}
\newcommand{\asgimplies}{\Rightarrow}
\newcommand   {\boxit}[1]     {$$\fbox{$#1$}$$}

\newcommand{\pbitem}{
\ifthenelse{\equal{\the\@enumdepth}{0}}{\item}{}
\ifthenelse{\equal{\the\@enumdepth}{1}}{\item[\PB\ \addtocounter{enumi}{1}\labelenumi]}{}
\ifthenelse{\equal{\the\@enumdepth}{2}}{\item[\PB\ \addtocounter{enumii}{1}\labelenumii]}{}
\ifthenelse{\equal{\the\@enumdepth}{3}}{\item[\PB\ \addtocounter{enumiii}{1}\labelenumiii]}{}
\ifthenelse{\equal{\the\@enumdepth}{4}}{\item[\PB\ \addtocounter{enumiv}{1}\labelenumiv]}{}
}

\newenvironment{problemlist}%
{%
\advance\@enumdepth by 1%
\ifthenelse{\equal{\the\@enumdepth}{1}}{\setcounter{enumi}{0}}{}%
\ifthenelse{\equal{\the\@enumdepth}{2}}{\setcounter{enumii}{0}}{}%
\ifthenelse{\equal{\the\@enumdepth}{3}}{\setcounter{enumiii}{0}}{}%
\ifthenelse{\equal{\the\@enumdepth}{4}}{\setcounter{enumiv}{0}}{}%
\begin{list}{%
\phantom{\CW}\
\ifthenelse{\equal{\the\@enumdepth}{1}}{\addtocounter{enumi}{1}\labelenumi}{}%
\ifthenelse{\equal{\the\@enumdepth}{2}}{\addtocounter{enumii}{1}\labelenumii}{}%
\ifthenelse{\equal{\the\@enumdepth}{3}}{\addtocounter{enumiii}{1}\labelenumiii}{}%
\ifthenelse{\equal{\the\@enumdepth}{4}}{\addtocounter{enumiv}{1}\labelenumiv}{}%
}%
{%
}
}%
{%
\end{list}%
\advance\@enumdepth by -1%
}

\newenvironment{problem}%
{%
\color{gray!60!black}
\addtocounter{problem}{1}
\addtocounter{equation}{-\arabic{equation}}
\phantom{\PB}\
\itshape
\ignorespaces
{%
\color{gray!90}\Huge“}
}%
{%
\color{gray!90}\hfill\begin{Huge}”\end{Huge}
\vspace*{2\baselineskip}
}

\newenvironment{answer}%
{%
\vspace{0.1 in}
\begin{boldmath}
\begin{emph}
{%
}
}%
{%
\end{emph}
\end{boldmath}
\qed
}

\let\ifshowanswers=\iffalse

\AtBeginDocument{%
\begin{flushright}
\sf{\@student} \\
\emph{\@school} \\
{\protect\emph{\@university}}\\[0.5\baselineskip]
\bf{\@date}
\end{flushright}\hfill\\
{
\bfseries\@ExerciseSheet%
\ifthenelse{\equal{\@subject}{}}{}{\ --- \@subject}%
\ifshowanswers\ \solutionstext \fi
}%

\renewcommand{\@oddfoot}%
{%
\noindent\parbox{0.99\textwidth}{\em%
\@courselabel\ \@exercisesheet\hfill\@semester}%
\hspace{-0.99\textwidth}%
\parbox{0.99\textwidth}{\centering\thepage}
}
}
\AtEndDocument{\vfill\noindent \sl{Submitted by \@student\ on \@date.}}
\endinput
%%
%% End of file `assignment.cls'.

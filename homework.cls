\NeedsTeXFormat{LaTeX2e}                                                        % what even is 2e
\LoadClassWithOptions{article}                                                  % load? or not? with options? or not?
\ProvidesClass{homework}[2022/04/01 Homework class]

% ==================== packages ==================== %

\RequirePackage[T1]{fontenc}                                                    % so fonts/accents work? idk
\RequirePackage[utf8]{inputenc}                                                 % dont know what exactly this does either
\RequirePackage[margin = 1in]{geometry}                                         % just copying over from template... maybe i can guess what this does
\RequirePackage{newpxtext}                                                      % palatino?
\RequirePackage{newpxmath}                                                      % palatino.
\RequirePackage{amsmath}                                                        % of course
\RequirePackage{amssymb}                                                        % this gives `\mathbb` and internally loads `amsfonts` and maybe does other stuff
\RequirePackage{esint}                                                          % fancy integrals
\RequirePackage{enumitem}                                                       % https://tinyurl.com/use-enumitem
\RequirePackage{graphicx}                                                       % for `\includegraphics`
\RequirePackage{fancyhdr}                                                       % for header
\RequirePackage{hyperref}                                                       % for links
\RequirePackage{microtype}                                                      % for good spacing
\RequirePackage{xcolor}                                                         % for colors
\RequirePackage{xifthen}                                                        % for conditionals and `\isempty`
\RequirePackage{tikz-cd}
\usetikzlibrary{arrows, automata, positioning}
\RequirePackage{pgfplots}
\pgfplotsset{compat = 1.17}

% ==================== page setup ==================== %

\linespread{1.2}                                                                % this is more comfortable
\setlength{\parindent}{0pt}                                                     % dont need em
\setlength{\parskip}{0.8ex}                                                     % wow i didnt know default for `\parskip` was 0
\let \olditemize \itemize
\let \endolditemize \enditemize
\renewenvironment{itemize}{\begin{olditemize}[topsep = 0pt]}{\end{olditemize}}
\let \oldenumerate \enumerate
\let \endoldenumerate \endenumerate
\renewenvironment{enumerate}{\begin{oldenumerate}[topsep = 0ex]}{\end{oldenumerate}}

% ==================== variables ==================== %

\newcommand{\var}[2]{                                                           % ok now this is definitely hacking
  \expandafter\providecommand\expandafter{\csname #1\endcsname}[1]%
    {\expandafter\renewcommand\expandafter{\csname @#1\endcsname}{##1}}
  \expandafter\providecommand\expandafter{\csname @#1\endcsname}{#2}
}

\newcommand{\varcommand}[2]{
  \expandafter\providecommand\expandafter{\csname #1\endcsname}[1]%
    {\expandafter\renewcommand\expandafter{\csname @#1\endcsname}%
    {\csname ##1\endcsname}}
  \expandafter\providecommand\expandafter{\csname @#1\endcsname}%
    {\csname #2\endcsname}
}

\var{class}{Class}
\var{type}{Homework}
\var{num}{\#}
\var{name}{Name}
\var{solutionColor}{black}
\varcommand{problemLabelStyle}{arabic}
\varcommand{subproblemLabelStyle}{alph}

% ==================== header ==================== %

\pagestyle{fancy}                                                               % fancy = good :sunglasses:

\lhead{\@class{}}                                                               % actual header content
\chead{\@type{} \@num{}}
\rhead{\@name{}}

% ==================== title ==================== %

\renewcommand{\maketitle}{
  \thispagestyle{plain}                                                         % no header on this page
  
  \begin{center}
    { \Large \@class{}: \@type{} \@num{} }

    \@name{}

    \today
  \end{center}
}

\AtBeginDocument{\maketitle}                                                    % force make title at top of document

% ==================== problem ==================== %

\newcounter{problem_counter}                                                    % snake case or camel case?
\newcounter{subproblem_counter}[problem_counter]

\providecommand{\problem}[1][]{
  \stepcounter{problem_counter}

  \ifnum \value{problem_counter} > 1                                            % new page for each problem except the first one
    \newpage
  \fi
  
  { 
    \large 
    \textbf{Problem \@problemLabelStyle{problem_counter}%
      \ifthenelse{\isempty{#1}}{}{ (#1)}.}
  }
  
  % problem statement on a new line
}

\providecommand{\subproblemLabel}{
  \ifthenelse{
    \equal{\@problemLabelStyle{problem_counter}}{\arabic{problem_counter}}%     % special case when both problem counter and subproblem counter are arabic... woah this is ugly
      \AND \equal{\@subproblemLabelStyle{subproblem_counter}}%
      {\arabic{subproblem_counter}}}%
      {\textbf{\arabic{problem_counter}.\arabic{subproblem_counter}}
  }{
    \textbf{(\@subproblemLabelStyle{subproblem_counter})}
  }
}

\newenvironment{subproblems}{
  \begin{oldenumerate}[topsep = 0ex, itemsep = 0ex, label = \protect \subproblemLabel]
}{
  \end{oldenumerate}
}

\providecommand{\subproblem}{
  \stepcounter{subproblem_counter}
  
  \item
}

% ==================== solution ==================== %

\providecommand{\solution}{
  \vspace{1.5ex}                                                                % need a bit of space
  { \color{\@solutionColor} \textbf{\textit{Solution.}}}
  \newline                                                                      % solution on a new line
}
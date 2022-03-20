\NeedsTeXFormat{LaTeX2e}                                                        % what even is 2e
\LoadClassWithOptions{article}                                                  % load? or not? with options? or not?
\ProvidesClass{homework}[2022/03/19 Homework class]

% ==================== Packages ==================== %

\RequirePackage[T1]{fontenc}                                                    % so fonts/accents work? idk
\RequirePackage[utf8]{inputenc}                                                 % dont know what exactly this does either
\RequirePackage[margin = 1in]{geometry}                                         % just copying over from template... maybe i can guess what this does

\RequirePackage{amsmath}                                                        % of course
\RequirePackage{amssymb}                                                        % this gives `\mathbb` and internally loads `amsfonts` and maybe does other stuff
\RequirePackage{esint}                                                          % fancy integrals

\RequirePackage{enumitem}                                                       % https://tinyurl.com/use-enumitem

\RequirePackage{graphicx}                                                       % for `\includegraphics`

\RequirePackage{fancyhdr}                                                       % for header

\RequirePackage{hyperref}                                                       % for links

\RequirePackage{xifthen}                                                        % for conditionals and `\isempty`

% ==================== Page Setup ==================== %

\linespread{1.2}                                                                % this is more comfortable
\setlength{\parindent}{0pt}                                                     % dont need em

% ==================== Variables ==================== %

\newcommand{\var}[2]{                                                           % ok now this is definitely hacking
  \expandafter\providecommand\expandafter{\csname #1\endcsname}[1]
    {\expandafter\renewcommand\expandafter{\csname @#1\endcsname}{##1}}
  \expandafter\providecommand\expandafter{\csname @#1\endcsname}{#2}
}

\var{class}{Class}
\var{type}{Homework}
\var{num}{\#}
\var{name}{Name}

% ==================== Header ==================== %

\pagestyle{fancy}                                                               % fancy = good :sunglasses:

\lhead{\@class{}}                                                               % actual header content
\chead{\@type{} \@num{}}
\rhead{\@name{}}

% ==================== Title ==================== %

\renewcommand{\maketitle}{
  \thispagestyle{plain}                                                         % no header on this page
  
  \begin{center}
    { \Large \@class{}: \@type{} \@num{} }

    \@name{}

    \today
  \end{center}
}

\AtBeginDocument{\maketitle}                                                    % force make title at top of document

% ==================== Problem ==================== %

\newcounter{problem_counter}                                                    % snake case or camel case?

\providecommand{\problem}[1][]{
  \stepcounter{problem_counter}

  \ifnum \value{problem_counter} > 1                                            % new page for each problem except the first one
    \newpage
  \fi
  
  { 
    \large 
    \textbf{Problem \arabic{problem_counter}\ifthenelse{\isempty{#1}}{}{ (#1)}.}
  }
  \newline                                                                      % problem statement on a new line
}
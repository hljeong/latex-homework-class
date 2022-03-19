\NeedsTeXFormat{LaTeX2e}                                                       % what even is 2e
\LoadClassWithOptions{article}                                                 % load? or not? with options? or not?
\ProvidesClass{homework}[2022/03/19 Homework class]

% ==================== Packages ==================== %

\RequirePackage[T1]{fontenc}                                                   % so fonts/accents work? idk
\RequirePackage[utf8]{inputenc}                                                % dont know what exactly this does either
\RequirePackage[margin = 1in]{geometry}                                        % just copying over from template... maybe i can guess what this does

\RequirePackage{amsmath}                                                       % of course
\RequirePackage{amssymb}                                                       % this gives `\mathbb` and internally loads `amsfonts` and maybe does other stuff
\RequirePackage{esint}                                                         % fancy integrals

\RequirePackage{enumitem}                                                      % https://tinyurl.com/use-enumitem

\RequirePackage{graphicx}                                                      % for `\includegraphics`

\RequirePackage{fancyhdr}                                                      % for header

\RequirePackage{hyperref}                                                      % for links

% ==================== Header ==================== %

\newcommand{\class}[1]{\renewcommand{\@class}{#1}}
\newcommand{\@class}{Class}

\newcommand{\hw}[1]{\renewcommand{\@num}{#1}}
\newcommand{\@num}{\#}

\newcommand{\name}[1]{\renewcommand{\@name}{#1}}
\newcommand{\@name}{Name}

\pagestyle{fancy}

\lhead{\@class{}}
\chead{Homework \@num{}}
\rhead{\@name{}}
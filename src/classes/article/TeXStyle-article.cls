\ProvidesClass{TeXStyle-article}

\LoadClassWithOptions{article}

\RequirePackageWithOptions{TeXStyle}

%--------------------------------------------------
% Dependencies

  % Paragraph indent and skip control
    \RequirePackage{parskip}

  % Margin notes
    \RequirePackage{marginnote}

  % Document dimensions
    \RequirePackage{geometry}  

  % Header control
    \RequirePackage{fancyhdr}
    \pagestyle{fancy}
%--------------------------------------------------

%--------------------------------------------------
% Document Settings

  % Paragraph sizing
    \setlength{\parskip}{1.5\baselineskip}
    \setlength{\parindent}{5pt}

  % Link design
    \hypersetup
    {
      colorlinks=true,
      linkcolor=blue,
      filecolor=magenta,
      urlcolor=cyan,
    }
    \urlstyle{same}
%--------------------------------------------------

%--------------------------------------------------
% Draft version Preparation

  % Initialise draft option
    \newif\ifDraftOn

    \DeclareOption{draft}{\DraftOntrue}
    \ProcessOptions\relax

    \ifDraftOn
      % Paper sizes for draft versions
      \geometry{b4paper, total={18cm,26cm}, inner=1.5cm, top=2cm, heightrounded, marginparsep=2cm}
      %, outer=8cm, inner=2cm, heightrounded, marginparwidth=5cm, marginparsep=2cm

      % Emphasis and margin notes
      \newcommand{\marEmp}[3]{#1\marginnote{\emph{#1}:#2}[#3]}
      \newcommand{\marNote}[2]{\marginnote{#1}[#2]}
    \else
      % Paper sizes for non-draft versions
      \geometry{a4paper, total={18cm,25cm}, inner=1.5cm, top=2cm, heightrounded, marginparwidth=0cm, marginparsep=0cm}

      % Emphasis and margin notes are discouraged in non-draft versions
      \newcommand{\marEmp}[3]{
        #1
        \PackageWarning{MyStyle}{Emphasis margin note:\MessageBreak
        \space \space \"#1: #2\" \MessageBreak
        not removed, consider removing for final draft.}
      }

      \newcommand{\marNote}[2]{
        \PackageWarning{MyStyle}{Margin note:\MessageBreak
        \space \space \"#1\" \MessageBreak
        not removed, consider removing for final draft.}
      }
    \fi
%--------------------------------------------------

%--------------------------------------------------
% Document Styling

  % Section Title styles
    \renewcommand\thesubsection{\arabic{section}.\arabic{subsection}}
    \renewcommand\thesection{\textsection\arabic{section}}
%--------------------------------------------------

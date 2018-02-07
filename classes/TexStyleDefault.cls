\ProvidesClass{TeXStyle-Default}

\RequirePackage{TexStyle}

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
    \DeclareOption{draft}{

      % Paper sizes for draft versions
      \geometry{b4paper, total={18cm,26cm}, inner=1.5cm, top=2cm, heightrounded, marginparsep=2cm}
      %, outer=8cm, inner=2cm, heightrounded, marginparwidth=5cm, marginparsep=2cm

    \OptionNotUsed

      % Paper sizes for non-draft versions
      \geometry{a4paper, total={18cm,25cm}, inner=1.5cm, top=2cm, heightrounded, marginparwidth=0cm, marginparsep=0cm}

    }
    \ProcessOptions\relax
%--------------------------------------------------

%--------------------------------------------------
% Document Styling

  % Section Title styles
    \renewcommand\thesubsection{\arabic{section}.\arabic{subsection}}
    \renewcommand\thesection{\textsection\arabic{section}}
%--------------------------------------------------

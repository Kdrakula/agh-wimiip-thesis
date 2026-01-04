% thesis.cls - prosta klasa dla pracy inżynierskiej
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis}[2025/01/01 Simple thesis class]

% Bazujemy na klasie report
\LoadClass[12pt,a4paper,twoside]{report}

% ==============================================================================
% 1. KODOWANIE, JĘZYK I CZCIONKI
% ==============================================================================
\RequirePackage[utf8]{inputenc}  % Kodowanie pliku wejściowego
\RequirePackage[T1]{fontenc}     % Kodowanie fontów (obsługa polskich znaków)
\RequirePackage{lmodern}         % Nowoczesna czcionka wektorowa
\RequirePackage{tgheros}
\RequirePackage{inconsolata}     % Ładna czcionka monospaced do kodu
\RequirePackage[polish]{babel}   % Polskie zasady typograficzne i nazewnictwo
\RequirePackage{csquotes}        % Poprawne cudzysłowy (wymagane przez biblatex)


\RequirePackage{microtype}       % Mikro-typografia (lepsze odstępy, mniej wdów/sierot)
\RequirePackage{indentfirst}     % Wcięcie w pierwszym akapicie rozdziału (standard w PL)

% ==============================================================================
% 2. GEOMETRIA I UKŁAD STRONY
% ==============================================================================
\RequirePackage{geometry}
\geometry{
    left=2cm,
    right=2cm,
    top=2cm,
    bottom=2cm,
    headheight=15pt
    % headsep=10mm,
    % footskip=12mm
}

\RequirePackage{setspace}
\onehalfspacing                  % Interlinia 1.5

\RequirePackage{titlesec}        % Wygląd nagłówków rozdziałów
\titleformat{\chapter}[hang]{\normalfont\huge\bfseries}{\thechapter.}{1em}{}
\titlespacing*{\chapter}{0pt}{10pt}{20pt}

\RequirePackage{fancyhdr}        % Nagłówki i stopki
\pagestyle{fancy}
\fancyhf{}
\fancyhead[LE,RO]{\thepage}      % Numery stron na zewnątrz
\fancyhead[RE]{\nouppercase{\leftmark}} % Rozdział na lewej stronie
\fancyhead[LO]{\nouppercase{\rightmark}} % Sekcja na prawej stronie

% ==============================================================================
% 3. MATEMATYKA I JEDNOSTKI
% ==============================================================================
\RequirePackage{amsmath,amssymb} % Podstawowe pakiety matematyczne
\RequirePackage{siunitx}         % Jednostki fizyczne (SI)
\sisetup{
    range-phrase = --,
    range-units = single,
    output-decimal-marker = {,}  % Przecinek jako separator dziesiętny (standard PL)
}

% ==============================================================================
% 4. GRAFIKA, TABELE I LISTY
% ==============================================================================
\RequirePackage{graphicx}        % Obsługa grafik
\RequirePackage{float}           % Wymuszanie pozycji [H]
\RequirePackage{caption}         % Podpisy
\RequirePackage{subcaption}      % Podpisy do pod-rysunków
\RequirePackage{longtable}       % Długie tabele (na wiele stron)
\RequirePackage{enumitem}        % Lepsze listy punktowane
\RequirePackage{tikz}
\usetikzlibrary{shapes, arrows.meta, positioning}

\RequirePackage{pdfpages}
% ==============================================================================
% 5. BIBLIOGRAFIA
% ==============================================================================
\RequirePackage[
  backend=biber,
  style=numeric,
  sorting=ynt
]{biblatex}
\DeclareLanguageMapping{polish}{polish}

% ==============================================================================
% 6. LISTINGI KODU (KONFIGURACJA)
% ==============================================================================
\RequirePackage{listings}
\RequirePackage{xcolor}

% Spolszczenie nazw
\renewcommand{\lstlistingname}{Kod źródłowy}
\renewcommand{\lstlistlistingname}{Spis kodów źródłowych}

% Kolory do kodu
\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}
\definecolor{backcolour}{rgb}{0.95,0.95,0.92}

% Styl listingu
\lstdefinestyle{mystyle}{
    backgroundcolor=\color{backcolour},   
    commentstyle=\color{codegreen},
    keywordstyle=\color{magenta},
    numberstyle=\tiny\color{codegray},
    stringstyle=\color{codepurple},
    basicstyle=\ttfamily\scriptsize, % Scriptsize, żeby kod się mieścił
    breakatwhitespace=false,         
    breaklines=true,                 % Łamanie długich linii
    postbreak=\mbox{\textcolor{red}{$\hookrightarrow$}\space}, % Strzałka przy złamaniu
    captionpos=b,                    
    keepspaces=true,                 
    numbers=left,                    
    numbersep=5pt,                  
    showspaces=false,                
    showstringspaces=false,
    showtabs=false,                  
    tabsize=2,
    frame=single,
    % Obsługa polskich znaków w kodzie
    literate={ą}{{\k{a}}}1 {ć}{{\'c}}1 {ę}{{\k{e}}}1 {ł}{{\l{}}}1 {ń}{{\'n}}1 {ó}{{\'o}}1 {ś}{{\'s}}1 {ź}{{\'z}}1 {ż}{{\.z}}1 {Ą}{{\k{A}}}1 {Ć}{{\'C}}1 {Ę}{{\k{E}}}1 {Ł}{{\L{}}}1 {Ń}{{\'N}}1 {Ó}{{\'O}}1 {Ś}{{\'S}}1 {Ź}{{\'Z}}1 {Ż}{{\.Z}}1
}
\lstset{style=mystyle}

% --- Definicja języka AS (Kawasaki Robotics) ---
\lstdefinelanguage{ASLang}{
  % Słowa kluczowe (Instrukcje ruchu, logiczne, IO)
  morekeywords={
    PROGRAM, END, 
    JMOVE, LMOVE, CMOVE, JAPPRO, LAPPRO, JDEPART, LDEPART, HOME,
    SPEED, ACCURACY, ACCEL, DECEL, BREAK, TWAIT,
    OPEN, CLOSE, RELAX,
    WAIT, SIG, SIGNAL, SWAIT, PULSE, BITS,
    IF, THEN, ELSE, GOTO, CALL, RETURN, STOP, ONE,
    FOR, NEXT, DO, UNTIL, WHILE,
    PRINT, TYPE, PROMPT,
    TOOL, BASE, WEIGHT
  },
  sensitive=false, % Język AS nie rozróżnia wielkości liter (case-insensitive)
  morecomment=[l]{;}, % Komentarze zaczynają się od średnika
  morestring=[b]", % Stringi są w cudzysłowach
  % Stylistyka (KIDE style)
  keywordstyle=\color{blue}\bfseries, % Słowa kluczowe: Niebieskie pogrubione
  commentstyle=\color{codegreen}\itshape, % Komentarze: Zielone kursywą
  stringstyle=\color{codepurple}, % Napisy: Fioletowe
}

% ==============================================================================
% 7. INTERAKTYWNOŚĆ (Hiperłącza) - Zawsze na końcu importów
% ==============================================================================
\RequirePackage[hidelinks]{hyperref}
% \RequirePackage{bookmark} % Opcjonalnie do zakładek PDF

% ==============================================================================
% 8. ZMIENNE I KOMENDY DLA STRONY TYTUŁOWEJ
% ==============================================================================

% Definicje zmiennych
% \newcommand{\thesistitle}[1]{\def\@thesistitle{#1}}
% \newcommand{\thesisauthor}[1]{\def\@thesisauthor{#1}}
% \newcommand{\printthesisauthor}{\@thesisauthor}
% \newcommand{\faculty}[1]{\def\@faculty{#1}}
% \newcommand{\department}[1]{\def\@department{#1}}
% \newcommand{\thesistype}[1]{\def\@thesistype{#1}}
% \newcommand{\thesissupervisor}[1]{\def\@thesissupervisor{#1}}
% \newcommand{\thesisdate}[1]{\def\@thesisdate{#1}}
% \newcommand{\printthesisdate}{\@thesisdate}
% \newcommand{\thesislogo}[1]{\def\@thesislogo{#1}}

% % Generowanie strony tytułowej
% \newcommand{\maketitlepages}{
%     \begin{titlepage}
%         \selectlanguage{polish}
%         \centering
%         \ifdefined\@thesislogo
%           \includegraphics[width=4cm]{\@thesislogo}\\[1cm]
%         \fi
%         {\Large \@faculty}\\[0.5cm]
%         {\large \@department}\\[3cm]
%         {\Huge\bfseries \@thesistitle}\\[3cm]
%         \begin{flushright}
%             \textbf{Autor:} \@thesisauthor\\
%             \textbf{Promotor:} \@thesissupervisor
%         \end{flushright}
%         \vfill
%         {\large \@thesisdate}
%     \end{titlepage}
% }

\newcommand{\setSupervisor}[1]{\newcommand{\supervisor}{#1}}
\newcommand{\setFaculty}[1]{\newcommand{\faculty}{#1}}
\newcommand{\setDepartment}[1]{\newcommand{\department}{#1}}
\newcommand{\setReviewer}[1]{\newcommand{\reviewer}{#1}}
\newcommand{\setTitleang}[1]{\newcommand{\titleang}{#1}}
\newcommand{\setMajor}[1]{\newcommand{\major}{#1}}

\renewcommand{\maketitle}{\begin{titlepage}
    \sffamily 
    
    \begin{center}
        \includegraphics[height=60.85mm]{images/agh_nzw_s_pl_1w_wbr_rgb_150ppi.jpg}\\
    \end{center}

    \begin{center}
        \vspace{-1ex}
        % Nazwa wydziału - Small Caps, Bold
        {\normalsize \bfseries \scshape \faculty} \\
        
        \vspace{1ex}
        
        % Nazwa katedry - Small Caps
        {\normalsize \scshape \department} \\
    
        \vspace{5ex}

        % Nagłówek "Projekt dyplomowy"
        {\Large Projekt dyplomowy} \\
        
        \vspace{5ex}
        
        % Tytuł pracy w języku polskim - Bold, Large
        {\large \@title} \\
        
        \vspace{2ex}
        
        % Tytuł pracy w języku angielskim
        {\large \titleang} \\
    \end{center}

    \vspace{10ex} % Przestrzeń przed danymi autora

    \noindent
    \begin{tabular}{@{}l @{\hspace{1.5cm}} l} 
        {\normalsize Autor:} & {\normalsize \@author} \\
        {\normalsize Kierunek studiów:} & {\normalsize \major} \\
        {\normalsize Opiekun projektu:} & {\normalsize \supervisor}
    \end{tabular}
    
    \vfill 
    
    \begin{center}
        {\normalsize Kraków, 2025}
    \end{center}  
\end{titlepage}%
}

% Oświadczenie o samodzielności
\newcommand{\makedeclaration}{
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
    \textbf{Oświadczenie}
  \end{center}
  \vspace{1cm}
  Ja, niżej podpisany/a, oświadczam, że niniejsza praca dyplomowa została wykonana przeze mnie samodzielnie,
  przy wykorzystaniu wskazanych źródeł i literatury. \\[2em]
  \begin{flushright}
    \textbf{\@thesisauthor} \\[0.5em]
    Data: \@thesisdate
  \end{flushright}
  \clearpage
}

% Ustawienia liczników
\setcounter{tocdepth}{2}
\setcounter{secnumdepth}{3}

\endinput
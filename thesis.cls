% thesis.cls - prosta klasa dla pracy inżynierskiej
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis}[2025/01/01 Simple thesis class]

% Bazujemy na klasie report
\LoadClass[12pt,a4paper,twoside]{report}

% ==============================================================================
% 1. KODOWANIE, JĘZYK I CZCIONKI
% ==============================================================================
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}

\RequirePackage{newtxtext}
\RequirePackage{newtxmath}

% \RequirePackage{lmodern}         % Nowoczesna czcionka wektorowa
% \RequirePackage{tgheros}
\RequirePackage{inconsolata}     % Ładna czcionka monospaced do kodu
\RequirePackage[polish]{babel}   % Polskie zasady typograficzne i nazewnictwo
\RequirePackage{csquotes}        % Poprawne cudzysłowy (wymagane przez biblatex)

\RequirePackage{microtype}       % Mikro-typografia (lepsze odstępy, mniej wdów/sierot)
\RequirePackage{indentfirst}     % Wcięcie w pierwszym akapicie rozdziału (standard w PL)

\setlength{\parindent}{1cm}
% ==============================================================================
% 2. GEOMETRIA I UKŁAD STRONY
% ==============================================================================
\RequirePackage{geometry}
\geometry{
    a4paper,
    margin=2cm,
    % bindingoffset=10mm, % !!!!!!!! zmienic do druku
    headheight=15pt
}

\RequirePackage{emptypage}

\RequirePackage{setspace}
\onehalfspacing                  % Interlinia 1.5

\RequirePackage{titlesec}        % Wygląd nagłówków rozdziałów
\titleformat{\chapter}[hang]{\normalfont\huge\bfseries}{\thechapter.}{1em}{}
\titlespacing*{\chapter}{0pt}{10pt}{20pt}

\RequirePackage{fancyhdr}        % Nagłówki i stopki
\pagestyle{fancy}
\fancyhf{}
% \fancyhead[LE,RO]{\thepage}      % Numery stron na zewnątrz
\fancyfoot[LE, RO]{\thepage}
\fancyhead[RE]{\nouppercase{\leftmark}} % Rozdział na lewej stronie
\fancyhead[LO]{\nouppercase{\rightmark}} % Sekcja na prawej stronie

\fancypagestyle{plain}{
    \fancyhf{} % Wyczyść wszystko (żeby nie było numeru na środku)
    \renewcommand{\headrulewidth}{0pt} % Brak kreski w nagłówku
    
    % Skopiuj ustawienie stopki ze swojego stylu głównego:
    \fancyfoot[LE, RO]{\thepage} 
}

% ==============================================================================
% 3. MATEMATYKA I JEDNOSTKI
% ==============================================================================
\RequirePackage{amsmath}
% \RequirePackage{amssymb}
\RequirePackage{siunitx}
\sisetup{
    range-phrase = --,
    range-units = single,
    output-decimal-marker = {,}
}

% ==============================================================================
% 4. GRAFIKA, TABELE I LISTY
% ==============================================================================
\RequirePackage{graphicx}        % Obsługa grafik
\RequirePackage{float}           % Wymuszanie pozycji [H]
% W klasie 12pt: \normalsize=12pt, \small=11pt, \footnotesize=10pt
\RequirePackage[font=footnotesize, labelfont=bf]{caption}        % Podpisy
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
  sorting=none
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

\newcommand{\setSupervisor}[1]{\newcommand{\supervisor}{#1}}
\newcommand{\setFaculty}[1]{\newcommand{\faculty}{#1}}
\newcommand{\setDepartment}[1]{\newcommand{\department}{#1}}
\newcommand{\setReviewer}[1]{\newcommand{\reviewer}{#1}}
\newcommand{\setTitleang}[1]{\newcommand{\titleang}{#1}}
\newcommand{\setMajor}[1]{\newcommand{\major}{#1}}
    
\renewcommand{\maketitle}{\begin{titlepage}
    % \sffamily 
    % Ustawienie bazowe dla strony
    \fontsize{11bp}{11bp}\selectfont 
    
    \vspace*{5mm}
    % --- LOGO I JEDNOSTKI ---
    {\centering 
        \includegraphics[height=68.6mm]{images/agh_nzw_s_pl_1w_wbr_rgb_150ppi.jpg} \par
        \vspace{3mm}
        {\bfseries \MakeUppercase{\faculty}} \par  
        \vspace{3.5mm}     
        {\MakeUppercase{\department}} \par
    } 
    
    % --- ODSTĘP: 2 entery + 6pt ---
    \vspace{11mm}

    % --- NAGŁÓWEK: "Projekt dyplomowy" (18pt) ---
    {\centering
        \fontsize{18bp}{18bp}\selectfont Projekt dyplomowy \par
    }

    % --- ODSTĘP: enter + 10pt ---
    \vspace{6.5mm}

    % --- TYTUŁY PRACY (16pt) ---
    {\centering
        \fontsize{16bp}{16bp}\selectfont 
        {\@title} \par
        {\titleang} \par
    }

    % --- ODSTĘP: 8 enterów ---
    \vspace{34.5mm}

    % --- DANE AUTORA (11pt) ---
    % Wracamy do 11pt (dla pewności)
    \fontsize{11bp}{11bp}\selectfont
    \noindent
    \begin{tabular}{@{} l @{\hspace{19mm}} l} 
        {Autor:} & {\@author} \\
        {Kierunek studiów:} & {\major} \\
        {Opiekun projektu:} & {\supervisor}
    \end{tabular}
    
    \vfill 
    
    \begin{center}
        Kraków, \the\year
    \end{center}
\end{titlepage}%
}

\newcommand{\leadingzero}[1]{\ifnum #1<10 0\the#1\else\the#1\fi}
\newcommand{\todayDDMMYYYY}{\leadingzero{\day}.\leadingzero{\month}.\the\year}

% Oświadczenie o samodzielności
\newcommand{\makedeclaration}{
  \cleardoublepage
  \thispagestyle{plain}
  \begin{center}
    \textbf{Oświadczenie}
  \end{center}
  \vspace{1cm}
  Ja, niżej podpisany/a, oświadczam, że niniejsza praca dyplomowa została wykonana przeze mnie samodzielnie,
  przy wykorzystaniu wskazanych źródeł i literatury. \\[2em]
  \begin{flushright}
    \textbf{\@author} \\[0.5em]
    Data: \todayDDMMYYYY
  \end{flushright}
  \clearpage
}

% Ustawienia liczników
\setcounter{tocdepth}{2}
\setcounter{secnumdepth}{3}

\endinput

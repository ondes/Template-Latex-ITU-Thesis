\NeedsTeXFormat{LaTeX2e}[1996/12/01]
\ProvidesClass{thesisprog_itu}[19/04/2020 SBO]

\DeclareOption{openbib}{\PassOptionsToClass{openbib}{report}}
\DeclareOption{draft}{\PassOptionsToClass{draft}{report}}
\DeclareOption{final}{\PassOptionsToClass{final}{report}}
\DeclareOption{openright}{\PassOptionsToClass{openright}{report}}
\DeclareOption{openany}{\PassOptionsToClass{openany}{report}}

\DeclareOption{titlepage}{\ClassWarning{itutez}{Title page always generated. Option ignored.}}
\DeclareOption{notitlepage}{\ClassWarning{itutez}{Option 'notitlepage' not available for thesis.}}
\DeclareOption{twoside}{\ClassWarning{itutez}{Option 'twoside' not available for thesis.}}
\DeclareOption{twocolumn}{\ClassWarning{itutez}{Option 'twocolumn' not available for thesis.}}
\DeclareOption{landscape}{\ClassWarning{itutez}{Option 'landscape' not available for thesis.}}
\DeclareOption{legalpaper}{\ClassWarning{itutez}{Option 'legalpaper' not available for thesis.}}
\DeclareOption{a4paper}{\ClassWarning{itutez}{Option 'a4paper' not available for this class.}}
\DeclareOption{a5paper}{\ClassWarning{itutez}{Option 'a5paper' not available for this class.}}
\DeclareOption{executivepaper}{\ClassWarning{itutez}{Option 'executivepaper' not available.}}
\DeclareOption{b5paper}{\ClassWarning{itutez}{Option 'b5paper' not available for this class.}}
\DeclareOption{letterpaper}{\ClassWarning{itutez}{Option 'letterpaper' superfluous. Ignored.}}
\DeclareOption{onecolumn}{\ClassWarning{itutez}{Option 'onecolumn' superfluous. Ignored.}}
\DeclareOption{oneside}{\ClassWarning{itutez}{Option 'oneside' superfluous. Ignored.}}

%====================================== TEZ DERLEME SEÇENEKLERİ ======================================
\newif\if@Onluarkali
\newif\if@Ingilizce
\@Ingilizcefalse
\newif\if@Doktora
\newif\if@YuksekLisans
\newif\if@Lisans
\newif\if@Bilisim
\newif\if@Avrasya
\newif\if@FenBilimleri
\newif\if@UcakUzay
\newif\if@ElektrikElektronik 								% Elektrik-Elektronik Fakültesi - SBÖ
\newif\if@SosyalBilimler
\newif\if@Enerji
\DeclareOption{onluarkali}{\PassOptionsToClass{twoside}{report}\@Onluarkalitrue}
\DeclareOption{ingilizce}{\@Ingilizcetrue}
\DeclareOption{doktora}{\@Doktoratrue}
\DeclareOption{turkce}{\@Ingilizcefalse}
\DeclareOption{yukseklisans}{\@YuksekLisanstrue}
\DeclareOption{lisans}{\@Lisanstrue}
\DeclareOption{bilisim}{\@Bilisimtrue}
\DeclareOption{avrasya}{\@Avrasyatrue}
\DeclareOption{fenbilimleri}{\@FenBilimleritrue}
\DeclareOption{ucakuzay}{\@UcakUzaytrue}
\DeclareOption{elektrikelektronik}{\@ElektrikElektroniktrue} % Elektrik-Elektronik Fakültesi - SBÖ
\DeclareOption{sosyalbilimler}{\@SosyalBilimlertrue}
\DeclareOption{enerji}{\@Enerjitrue}

\ProcessOptions
%=================================== LOADING CLASS AND PACKAGES =====================================
\LoadClass[a4paper,onecolumn,12pt]{report}[1996/10/31]
\RequirePackage{ifthen}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{fancyhdr}
\RequirePackage[hang]{caption}
\RequirePackage{calc}
\RequirePackage{appendix}
\usepackage[absolute]{textpos}
\usepackage{lscape} 				% Landscape package
\usepackage{url}

%========================================= CAPTION SETTINGS =========================================
\captionsetup [table]{position=top, aboveskip=0.3truecm, belowskip=6pt}
\captionsetup [figure]{position=bottom, labelsep=colon, aboveskip=0.0truecm, belowskip=0.0truecm}
\DeclareCaptionLabelSeparator{colon}{ \bfseries: } % Proper colomn separation in the figure labels - SBÖ

%========================================== PAGE SETTINGS ===========================================
% Setting of even pages that do not have page numbers and odd page setting that does have a page number - SBÖ
\def\BolumSagdaKalsin{
  \clearpage
  \if@twoside
    \ifodd
      \c@page 						% Count the page - SBÖ
    \else
      \hbox{}
      \thispagestyle{empty} 		% Empty even pages and do not include numbering in even pages - SBÖ
      \newpage
      \if@twocolumn
	\hbox{}
	\newpage
      \fi
    \fi
  \fi
} 
% Setting of odd pages and even pages that do have a page number - SBÖ
\def\BolumSagdaKalsinNolu{
  \clearpage
  \if@twoside
    \ifodd
      \c@page
    \else
      \hbox{}
      %\thispagestyle{empty} 		% Full even pages and include numbering in even pages - SBÖ
      \newpage
      \if@twocolumn
	\hbox{}
	\newpage
      \fi
    \fi
  \fi
} 

%=================================== HEADER AND FOOTNOTE SETTINGS ===================================
\lhead{} % Left header empty
\chead{} % Center header empty
\rhead{} % Right header empty
\lfoot{} % Left foot empty
\cfoot{\thepage} % Center foot page number included
\rfoot{} % Right foot empty 
\renewcommand{\headrulewidth}{0pt} 

%======================================= HYPHENATION SETTINGS =======================================
% Heceleme için hyphenpenalty değerini küçültebilirsiniz. 
% Değer küçüldükçe hecelemek isteyecek, değer büyükdükçe hecelemekten kaçacaktır.
\hyphenpenalty=10000
\exhyphenpenalty=10000
\widowpenalty=10000
\clubpenalty=10000

% Protect the text going over the right side of the page - SBÖ
\tolerance=10000 % It was 1
\emergencystretch=\maxdimen
%\hyphenpenalty=10000
\hbadness=10000

%============================ SETTINGS OF TITLE SPACINGS 25 mm FROM TOP ============================
% No need if space at the top of the first chapter title page - SBÖ
%\newlength{\ChapterUstenBosluk}
%\setlength{\ChapterUstenBosluk}{21.5mm} 
%\newlength{\UstenBosluk}
%\setlength{\UstenBosluk}{17mm} 

%============================= TOC, LOT AND LOF RELATED PARAGPRAPH SKIPS ============================
\newlength{\LoFparskip}     %% List of Figure parskip 08-05-2006
\setlength{\LoFparskip}{0em}

\newlength{\LoTparskip}     %% List of Table parskip 08-05-2006
\setlength{\LoTparskip}{0em}

\newlength{\ToCparskip}     %% Table of Content parskip 08-05-2006
\setlength{\ToCparskip}{0em}

%============================== SETTINGS BETWEEN onaypage AND CHAPTERS ==============================
\newif\if@TabloListesiVar   %% Tablo Listesi Olsun mu?
\@TabloListesiVartrue       %% Default = Var

\newif\if@SekilListesiVar   %% Sekil Listesi Olsun mu?
\@SekilListesiVartrue       %% Default = Var

\newif\if@ToCisDotted       %% ToC Noktalı / Noktasız
\@ToCisDottedfalse          %% Default = Noktasız      - First false then at page 8 it is set to true

\newif\if@ChapterBoldToC    %% ToC da BÖLÜM 1-2.. bold mu?
\@ChapterBoldToCfalse       %% Default = Bold Değil

\newif\if@TesekkurVar       %% Teşekkür var mı?
\@TesekkurVarfalse          %% Default = False         - Initially false then set true; Tesekkur means Forward ! - SBÖ

\newcommand*{\TabloListesiYok}{\@TabloListesiVarfalse}
\newcommand*{\SekilListesiYok}{\@SekilListesiVarfalse}

%========================================= KAPAK SETTINGS  ==========================================
\newcommand{\th@StoreIn}[2]{\gdef#1{#2}}  %% Stores the second arg in the command specified by the first arg.

\newcommand*{\yazar}[2]{
  \th@StoreIn{\th@isimsoyisim}{#1 #2}
  \th@StoreIn{\th@soyisimisim}{#2, #1}
}

\newcommand*{\juriBir}[2]{
  \th@StoreIn{\th@juribir}{#1}
  \th@StoreIn{\th@juribiruniv}{#2}
}

\newcommand*{\juriIki}[2]{
  \th@StoreIn{\th@juriiki}{#1}
  \th@StoreIn{\th@juriikiuniv}{#2}
}

\newcommand*{\juriUc}[2]{
  \th@StoreIn{\th@juriuc}{#1}
  \th@StoreIn{\th@juriucuniv}{#2}
}

\newcommand*{\juriDort}[2]{
  \th@StoreIn{\th@juridort}{#1}
  \th@StoreIn{\th@juridortuniv}{#2}
}

\newcommand*{\juriBes}[2]{
  \th@StoreIn{\th@juribes}{#1}
  \th@StoreIn{\th@juribesuniv}{#2}
}

\newcommand{\tezyoneticisi}[2]{
  \th@StoreIn{\th@TezYoneticisi}{#1}
  \th@StoreIn{\th@TezYoneticisiUniv}{#2}
}

\newcommand*{\anabilimdali}[2]{
  \th@StoreIn{\th@AnaBilimDali}{#1}
  \th@StoreIn{\th@Department}{#2}
}

\newcommand*{\programi}[2]{
  \th@StoreIn{\th@Programi}{#1}
  \th@StoreIn{\th@Programme}{#2}
}

%================================= FACULTY AND INSTITUTES SETTINGS =================================== 
    \if@Bilisim
      \def\th@Enstitu{B\.il\.i\c s\.im Enst\. it\"us\"u}
      \def\th@Institute{Informatics Institute}
      \def\th@Instituteiki{} 									% Added for onay page/front cover page simplicity - SBÖ
    \fi
    \if@FenBilimleri
      \def\th@Enstitu{Fen B\. il\. imler\. i Enst\. it\"us\"u}
      \def\th@Institute{Graduate School of Science}
      \def\th@Instituteiki{Engineering and Technology} 			% FBE ingilizce yeni baslik icin
    \fi
    \if@SosyalBilimler
      \def\th@Enstitu{Sosyal B\. il\. imler Enst\. it\"us\"u}
      \def\th@Institute{The Graduate School of Arts}            % To fill the text properly to the first line - SBÖ
      \def\th@Instituteiki{and Social Sciences} 				% Added for front cover page simplicity - SBÖ
    \fi
    \if@Enerji
      \def\th@Enstitu{Enerj\. i Enst\. it\"us\"u}
      \def\th@Institute{Institute of Energy}
      \def\th@Instituteiki{} 									% Added for front cover page simplicity - SBÖ
    \fi
    \if@Avrasya
      \def\th@Enstitu{Avrasya Yer B\. il\. imler\. i Enst\. it\"us\"u}
      \def\th@Institute{Eurasia Institute of}                   % To fill the text properly to the first line - SBÖ
      \def\th@Instituteiki{Earth Sciences} 						% Added for front cover page simplicity - SBÖ
    \fi
    \if@UcakUzay
      \def\th@Enstitu{UÇAK VE UZAY BİLİMLERİ FAKÜLTESİ}
      \def\th@Institute{FACULTY OF AERONAUTICS AND}
      \def\th@Instituteiki{ASTRONAUTICS}
    \fi
    \if@ElektrikElektronik 										% Added recently - SBÖ
    \def\th@Enstitu{ELEKTRİK-ELEKTRONİK FAKÜLTESİ}
    \def\th@Institute{FACULTY OF ELECTRICAL AND}
    \def\th@Instituteiki{ELECTRONICS}
    \fi

%=================================== ALL PAGES FROM KAPAK TO TOC =====================================  
\newcommand{\kapak}[1]{\th@StoreIn{\th@Kapak}{#1}}

\kapak{\th@DisKapak}%\th@IcKapak

%====================================== SETTINGS OF FONT SIZES ======================================= 
\newcommand*{\th@titleFtSz}{\fontseries{b}\fontsize{12}{12}\selectfont}             %% Title Font Boyutu
\newcommand*{\th@titleAnaBilimDaliFtSz}{\fontseries{b}\fontsize{12}{12}\selectfont} %% Anabilimdalı Font Boyutu
\newcommand*{\th@DestekFtSz}{\fontseries{b}\fontsize{12}{12}\selectfont}            %% Destek Font Boyutu
\newcommand*{\th@HdFnt}{\fontfamily{ptm}\selectfont\bfseries}                       %% Başlıklar Kalın (Bold) olacak
\newcommand*{\th@ChSz}{\normalsize\fontsize{12}{12}\selectfont}                     %% Chapter Font Boyutu 
\newcommand*{\th@ScSz}{\normalsize\fontsize{12}{12}\selectfont}                     %% Section Font Boyutu

%====================================== SETTINGS OF KAPAK PAGES ====================================== 
\newcommand*{\baslik}[3]{
  \th@StoreIn{\th@baslikbir}{#1}
  \th@StoreIn{\th@baslikiki}{#2}
  \th@StoreIn{\th@baslikuc}{#3}
}
\renewcommand*{\title}[3]{
  \th@StoreIn{\th@Titlebir}{#1}
  \th@StoreIn{\th@Titleiki}{#2}
  \th@StoreIn{\th@Titleuc}{#3}
}
\newcommand*{\tarih}[2]{
  \th@StoreIn{\th@tarih}{#1}
  \th@StoreIn{\th@date}{#2}
}
\newcommand*{\tarihKucuk}[2]{
  \th@StoreIn{\th@tarihKucuk}{#1}
  \th@StoreIn{\th@dateKucuk}{#2}
}
\newcommand*{\ogrencino}[1]{\th@StoreIn{\th@ogrencino}{#1}}
\newcommand*{\reportno}[1]{\th@StoreIn{\th@reportno}{#1}}  % Needed for numbered inputs - SBÖ

\newcommand*{\esdanismani}[2]{
  \th@StoreIn{\th@esdanisman}{#1}
  \th@StoreIn{\th@esdanismanuniv}{#2}
}

%========================= KAPAK AND EKLERIN INGILIZCE TURKCE TANIMLAMALARI ==========================
\if@Ingilizce
  \if@Doktora
    \def\TezSeviyesi{Ph.D. THESIS PROGRESS REPORT}
    \def\TezSeviyesiTR{DOKTORA TEZ{\.I} İLERLEME RAPORU}
  \fi
  \if@YuksekLisans
    \def\TezSeviyesi{M.Sc. THESIS PROGRESS REPORT}
    \def\TezSeviyesiTR{Y\"UKSEK L{\.I}SANS TEZ{\.I} İLERLEME RAPORU}
  \fi
  \if@Lisans
    \def\TezSeviyesi{GRADUATION THESIS PROPOSAL}
    \def\TezSeviyesiTR{ B{\.I}T{\.I}RME ÇALIŞMASI İLERLEME RAPORU}
  \fi
  % Modified the size and placement of the bigstar - SBÖ
  \def\th@EnstituUpper{ISTANBUL TECHNICAL UNIVERSITY \raisebox{1.6pt}{\footnotesize$\bigstar$} \MakeUppercase{\th@Institute}}
  \def\th@EnstituUpperTR{İSTANBUL TEKNİK ÜNİVERSİTESİ \raisebox{1.6pt}{\footnotesize$\bigstar$} \MakeUppercase{\th@Enstitu}}
  %\def\th@EnstituUpper{İSTANBUL TECHNICAL UNIVERSITY $\bigstar$ INSTITUTE OF SCIENCE AND TECHNOLOGY}
  \def\th@UniversityUpper{ISTANBUL TECHNICAL UNIVERSITY} % Front cover part of the top portion - SBÖ
  \def\Baslikbir{\th@Titlebir}
  \def\Baslikiki{\th@Titleiki}
  \def\Baslikuc{\th@Titleuc}
  \def\Anabilim{\th@Department}
  \def\AnabilimBaslik{Department}
  \def\Program{\th@Programme}
  \def\ProgramBaslik{Programme}
  \def\TarihBuyuk{\th@date}
  \def\TarihBuyukTR{\th@tarih} 									% Turkish date at kapak added - SBÖ
  \def\TarihKucuk{\th@dateKucuk}
  \def\YoneticiBaslik{Supervisor (Chairman)}
  \def\DanismanBaslik{Thesis Advisor}
  \def\JuriBaslik{Members of the Thesis Steering Committee}
  \def\EklerinBasligi{APPENDICES}
  \def\ReportNumber{\th@reportno}
\else
  \if@Doktora
    \def\TezSeviyesi{DOKTORA TEZ İLERLEME RAPORU}
  \fi
  \if@YuksekLisans
    \def\TezSeviyesi{YÜKSEK LİSANS TEZ İLERLEME RAPORU}
  \fi
  \if@Lisans
    \def\TezSeviyesi{BİTİRME TEZ ÇALIŞMASI İLERLEME RAPORU}
  \fi
  % Modified the size and placement of the bigstar - SBÖ
  \def\th@EnstituUpper{İSTANBUL TEKNİK ÜNİVERSİTESİ \raisebox{1pt}{\footnotesize$\bigstar$} \MakeUppercase{\th@Enstitu}}
  %\def\th@EnstituUpper{İSTANBUL TEKNİK ÜNİVERSİTESİ $\bigstar$ FEN BİLİMLERİ ENSTİTÜSÜ}
  \def\Baslikbir{\th@baslikbir}
  \def\Baslikiki{\th@baslikiki}
  \def\Baslikuc{\th@baslikuc}
  \def\Anabilim{\th@AnaBilimDali}
  \def\AnabilimBaslik{Anabilim Dalı}
  \def\Program{\th@Programi}
  \def\ProgramBaslik{Programı}
  \def\TarihBuyuk{\th@tarih}
  \def\TarihKucuk{\th@tarihKucuk}
  \def\YoneticiBaslik{Tez Danışmanı}
  \def\DanismanBaslik{Tez Danışmanı}
  \def\JuriBaslik{Jüri Üyeleri}
  \def\EklerinBasligi{EKLER}
  \def\ReportNumber{\th@reportno}
\fi
%====================================== BIBTEX ICIN TANIMLAMALAR =====================================
\if@Ingilizce
  \def\baglac{and}
  \def\etal{et~al.}
  \def\duzenciler{editors}
  \def\duzenci{editor}
  \def\duzenleyen{edited by}
  \def\surum{edition}
  \def\cilt{volume}
  \def\kisasayi{no.}
  \def\sayi{number}
  \def\ssayfa{pp.}
  \def\sayfa{p.}
  \def\bolum{chapter}
  \def\teknikrapor{Technical Report}
  \def\lisanstezi{B.Sc. Thesis}
  \def\yuksektezi{M.Sc. Thesis}
  \def\doktoratezi{Ph.D. Dissertation}
\else
  \def\baglac{ve}
  \def\etal{ve diğerleri}
  \def\duzenciler{(düzenleyenler)}
  \def\duzenci{(düzenleyen)}
  \def\duzenleyen{düzenleyen}
  \def\surum{sürüm}
  \def\cilt{cilt}
  \def\kisasayi{sayı}
  \def\sayi{sayı}
  \def\ssayfa{s.}
  \def\sayfa{s.}
  \def\bolum{bölüm}
  \def\teknikrapor{Teknik Rapor}
  \def\lisanstezi{Lisans Tezi}
  \def\yuksektezi{{\it {Yüksek Lisans Tezi}}}
  \def\doktoratezi{{\it {Doktora Tezi}}}
\fi

%=============================== SATIR ARASI BOŞLUKLARININ TANIMLARI =================================
\newlength{\defbaselineskip}
\setlength{\defbaselineskip}{\baselineskip}
%%\setlinespacing --> #1 * \defbaselineskip işlemini gerçekleştiriyor
\newcommand{\setlinespacing}[1]{\setlength{\baselineskip}{#1\defbaselineskip}}         
\newcommand{\doublespacing}{\setlength{\baselineskip}{2.0\defbaselineskip}}            %%\doublespacing = 2*\defbaselineskip
\newcommand{\singlespacing}{\setlength{\baselineskip}{\defbaselineskip}}               %%\singlespacing = 1*\defbaselineskip
\newcommand{\oneandonehalf}{\setlength{\baselineskip}{1.5\defbaselineskip}}            %%\oneandonehalf = 1.5*\defbaselineskip
\newcommand{\LoFspacing}{\setlength{\baselineskip}{1.0\defbaselineskip}}               %%\LoFspacing = 1.0*\defbaselineskip 08-05-2006
\newcommand{\LoTspacing}{\setlength{\baselineskip}{1.0\defbaselineskip}}               %%\LoTspacing = 1.0*\defbaselineskip 08-05-2006
\newcommand{\ToCspacing}{\setlength{\baselineskip}{1.0\defbaselineskip}}               %%\ToCspacing = 1.0*\defbaselineskip 08-05-2006
\newcommand{\Baslikspacing}{\setlength{\baselineskip}{1.0\defbaselineskip}}            %%\Baslikspacing = 1.3*\defbaselineskip 08-05-2006

%================================ SAYFA YAPISI İLE İLGİLİ TANIMLAMALAR ================================
\AtBeginDocument{
	    \setlength{\paperheight}{297mm}         
        \setlength{\voffset}{-0.4mm}            %% 25.4 mm - 0.4 mm = 25 mm from the top - SBÖ 
        %\setlength{\voffset}{0mm}              
 %       \setlength{\hoffset}{14.6mm} 
        \setlength{\oddsidemargin}{-0.4mm}      %% Sayfa Solu = 1 in (25.4 mm) - 0.4 mm = 25 mm %% [A4 297mm X 210mm] - SBÖ
        \setlength{\evensidemargin}{-0.4mm}     %% Sayfa Solu = 1 in (25.4 mm) - 0.4 mm = 25 mm - SBÖ
        %\setlength{\topmargin}{-3.0mm}   
        \setlength{\topmargin}{0mm}             %% To set the bottom text not to be less than 25mm from the bottom - SBÖ  
        \setlength{\headheight}{0mm}         	%% Sayfa Başlığı (Numarası) = 0 mm
        \setlength{\headsep}{0mm}               %% Sayfa Başlığı ile Sayfa Metni Arası Boşluk
        \setlength{\textheight}{247mm}          %% Sayfa Metni Yüksekliği = 297mm - 25mm - 25mm = 247mm - SBÖ     
        \setlength{\textwidth}{160mm}           %% Sayfa Metni Genişliği = 210mm - 25mm - 25mm = 160mm
        \setlength{\marginparsep}{0mm}
        \setlength{\marginparwidth}{0mm}
        \setlength{\leftmargini}{1.25em}
        \setlength{\leftmarginii}{2.2em}
        \setlength{\leftmarginiii}{2.2em}
        \setlength{\leftmarginiv}{2.2em}
        \setlength{\leftmarginv}{2.2em}
        \setlength{\leftmarginvi}{2.2em}
        \setlength{\leftmargin}{0mm}
        \setlength{\labelsep}{.5em}             
        \setlength{\labelwidth}{1.5em}
        %\setlength{\footskip}{0pt}
        \setlength{\footskip}{10mm}             %% Plac. of the page num. @ 15mm from the bottom (25mm - 15mm = 10mm) - SBÖ
        \setlength{\topskip}{0mm}
        \setlength{\parindent}{0pt}             %% Paragrafların ilk satırlarının ne kadar içeri gireceği
        \setlength\parskip{6pt}
        \pagestyle{fancy}
        \markright{}
        \onecolumn
        \raggedbottom
        %\flushbottom
        \normalsize
        \normalfont
        \oneandonehalf
        \setcounter{tocdepth}{5}
        \setcounter{secnumdepth}{4}             %% Bütün başlıklar numaralanacak
        }
%================================== SON SAYFAYA ÖZGEÇMİŞ EKLENİYOR ====================================
\AtEndDocument{
    % Noting defined yet...
}

%==================== CHAPTER VE SECTION TÜRKÇE/İNGİLİZCE İSİM VE FONT TANIMLARI ======================
\newcommand*{\th@ChapterStyle}{\th@HdFnt\th@ChSz}
\newcommand*{\th@SectionStyle}{\th@HdFnt\th@ScSz}
\newcommand*{\th@SubSectionStyle}{\th@HdFnt\th@ScSz}
\newcommand*{\th@OtherSecHeadStyles}{\th@HdFnt\th@ScSz}

\newcommand*{\th@DoChapCenter}{}
\newcommand*{\th@ChapHead}[1]{\protect\th@ChapterStyle \protect\th@DoChapCenter #1}

\newcommand*{\chapternameToC}{\fontfamily{ptm}\normalsize\selectfont \if@Ingilizce CHAPTER\else BÖLÜM\fi\normalfont}
\newcommand*{\contentsnameToC}{\fontfamily{ptm}\normalsize\selectfont \if@Ingilizce TABLE OF CONTENTS\else
İÇİNDEKİLER\fi\normalfont}
\newcommand*{\listtablenameToC}{\fontfamily{ptm}\normalsize\selectfont \if@Ingilizce LIST OF TABLES\else ÇİZELGE
LİSTESİ\fi\normalfont}
\newcommand*{\listfigurenameToC}{\fontfamily{ptm}\normalsize\selectfont \if@Ingilizce LIST OF FIGURES\else ŞEKİL
LİSTESİ\fi\normalfont}
\newcommand*{\appendixnameToC}{\fontfamily{ptm}\normalsize\selectfont \if@Ingilizce APPENDICES\else EKLER\fi\normalfont}
\newcommand*{\bibnameToC}{\fontfamily{ptm}\normalsize\selectfont \if@Ingilizce REFERENCES\else KAYNAKLAR\fi\normalfont}
\newcommand*{\insidecoverToC}{\fontfamily{ptm}\normalsize\selectfont \if@Ingilizce INSIDE COVER\else İÇ KAPAK\fi\normalfont}
\newcommand*{\frontcoverToC}{\fontfamily{ptm}\normalsize\selectfont \if@Ingilizce FRONT COVER\else DIŞ KAPAK\fi\normalfont}


\def\refname{\th@ChapHead{\if@Ingilizce REFERENCES\else KAYNAKLAR\fi}}
\def\bibname{\th@ChapHead{\if@Ingilizce REFERENCES\else KAYNAKLAR\fi}}
\def\chaptername{\th@ChapHead{\if@Ingilizce CHAPTER\else BÖLÜM\fi}}
\def\appendixname{\th@ChapHead{\if@Ingilizce APPENDIX\else EK\fi}}
\def\contentsname{\th@ChapHead{\if@Ingilizce TABLE OF CONTENTS\else İÇİNDEKİLER\fi}}
\def\listfigurename{\th@ChapHead{\if@Ingilizce LIST OF FIGURES\else ŞEKİL LİSTESİ\fi}}
\def\listtablename{\th@ChapHead{\if@Ingilizce LIST OF TABLES\else ÇİZELGE LİSTESİ\fi}}
\def\figurename{\bf \if@Ingilizce Figure\else Şekil\fi}
\def\tablename{\bf \if@Ingilizce Table\else Çizelge\fi}
\def\partname{\th@ChapHead{\if@Ingilizce PART\else KISIM\fi}}

%================================ CHAPTER VE SECTION FONT TANIMLARI ===================================
\newcommand*{\th@DefTheChapter}{\arabic{chapter}}
\newcommand*{\th@DefTheSection}{\th@DefTheChapter.\arabic{section}}
\newcommand*{\th@DefTheSubsection}{\th@DefTheSection.\arabic{subsection}}
\newcommand*{\th@DefTheSubsubsection}{\th@DefTheSubsection.\arabic{subsubsection}}
\newcommand*{\th@DefTheSubsubsubsection}{\th@DefTheSubsubsection.\arabic{subsubsubsection}}

\renewcommand*{\thechapter}{\th@DefTheChapter}
\renewcommand*{\thesection}{\th@DefTheSection}
\renewcommand*{\thesubsection}{\th@DefTheSubsection}
\renewcommand*{\thesubsubsection}{\th@DefTheSubsubsection}
\newcommand*{\thesubsubsubsection}{\th@DefTheSubsubsubsection}

%================================ TOC, LOT VE LOF YAPISI OLUŞTURULUYOR ================================
\newcommand*{\ToCLineisDotted}{\@ToCisDottedtrue}
\ToCLineisDotted

% Above and Below the Chapter TOC Settings - SBÖ
\renewcommand*\l@part[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 0.1em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      #1\nobreak
       \if@ToCisDotted
       \leaders\hbox{$\m@th\hbox{.}$} 							% cleaders is more flush than leaders - SBÖ
%        \mkern \@dotsep mu\hbox{.}\mkern \@dotsep
%         mu$}
       \fi 
       %\hfill 													% Added - SBÖ
       %\nobreak 												% Added - SBÖ
      %\hfil\nobreak\hb@xt@\@pnumwidth{\hss #2}\par  			% {\hss #2} Removed - SBÖ
      \hfil\nobreak#2\par 										% Added to make the dots come next to the page numbers - SBÖ
      \penalty\@highpenalty
    \endgroup
  \fi
}


%\renewcommand*\l@chapter[2]{%
%	\ifnum \c@tocdepth >\m@ne
%	\addpenalty{-\@highpenalty}%
%	\vskip 1.0em \@plus\p@
%	\setlength\@tempdima{1.5em}%
%	\begingroup
%	%\def\numberline##1{\hb@xt@\@tempdima{##1.\hfil}}%<------ this line added
%    \parindent \z@ \rightskip \@pnumwidth
%	\parfillskip -\@pnumwidth
%	\leavevmode \bfseries % That is what we have to comment out: \bfseries
%	\advance\leftskip\@tempdima
%	\hskip -\leftskip
%	#1\nobreak\leaders\hbox{$\m@th\hbox{.}$} %\mdseries after \nobreak makes it unbold dots - SBÖ
%	%mu$}
%    %\hfil\nobreak\hb@xt@\@pnumwidth{\hss #2}\par   %{\hss #2} - Removed SBÖ
%    \hfil\nobreak#2\par % Added to make the dots come next to the page numbers - SBÖ
%	\penalty\@highpenalty
%	\endgroup
%	\fi
%}

% Chapter Settings in TOC - SBÖ  
\renewcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
    %\def\numberline##1{\hb@xt@\@tempdima{##1.\hfil}}%<------ this line added
    \parindent \z@ \rightskip \@pnumwidth
    \parfillskip -\@pnumwidth
    \leavevmode \bfseries
    #1\nobreak 
     \if@ToCisDotted
       \leaders\hbox{$\m@th\hbox{.}$} 							% cleaders is more flush than leaders - SBÖ
%        \mkern \@dotsep mu\hbox{.}\mkern \@dotsep
%         mu$}
     \fi
    %\hfill 													% Added - SBÖ
    %\nobreak 													% Added - SBÖ
    %\hfil\nobreak\hb@xt@\@pnumwidth{\hss #2} \par  			% Removed - SBÖ
    \hfil\nobreak#2\par % Added to make the dots come next to the page numbers - SBÖ
    \penalty\@highpenalty
   \endgroup
  \fi}

% section, subsection, subsubsection Settings in TOC  
\def\@tocline#1#2#3#4#5{%
  \vskip 1\p@
  \ifnum #1=\c@tocdepth \else
    \vskip \z@ \@plus.2\p@  
    {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
     \parindent #2\relax\@afterindenttrue
     \interlinepenalty\@M 
     \leavevmode %\bfseries 										% sub sections unbolded - SBÖ
     \@tempdima #3\relax
     \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
     {#4}\nobreak
      \if@ToCisDotted
       \leaders\hbox{$\m@th\hbox{.}$}   					%cleaders or xleaders is more flush than leaders - SBÖ
%        \mkern \@dotsep mu\hbox{.} \mkern\@dotsep
%         mu$}
       \fi
     \hfill
     %\nobreak
     %\nobreak\hb@xt@\@pnumwidth{\dotfill #5} % Removed - SBÖ \hss #5
     \hfil\nobreak#5 % Added to make the dots come next to the page numbers - SBÖ
     \par}%
  \fi}

\newif\if@loflotpagebold\@loflotpageboldtrue % If LOF and LOT page numbers are bold or not - SBÖ
% @loflotpageboldfalse % If the page numbers in LOF and LOT are unbold - SBÖ

% LOT ve LOF Settings - SBÖ
\def\@lofline#1#2#3#4#5{%
	\vskip 1\p@
	\ifnum #1=\c@tocdepth \else
	\vskip \z@ \@plus.2\p@
	{\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
		\parindent #2\relax\@afterindenttrue
		\interlinepenalty\@M \normalsize  					% normalsize font - SBÖ
		\leavevmode %\bfseries 								% sections, subsections, subsubsections unbolded - SBÖ
		\@tempdima #3\relax
		\advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
		{#4}\nobreak
		\if@ToCisDotted
		\leaders\hbox{$\m@th\hbox{.}$} 						%cleaders or xleaders is more flush than leaders - SBÖ
		%        \mkern \@dotsep mu\hbox{.} \mkern\@dotsep
		%         mu$}
		\fi
		\hfill
		%\nobreak
		%\nobreak\hb@xt@\@pnumwidth{\dotfill #5} % Removed - SBÖ \hss #5
		\hfil\nobreak\if@loflotpagebold\bfseries\fi#5 % Added to make the dots come next to the page numbers with bold page numbers - SBÖ
		\par}%
	\fi}

% Subfigure LOF Settings - SBÖ
\newlength{\tempwidth}
\newsavebox{\tempbox}

\newcommand{\makecaption}[2]% #1 = caption head, #2 = caption text
{\savebox{\tempbox}{#1#2}
	\ifdim\wd\tempbox>\textwidth
	\settowidth{\tempwidth}{#1}
	\savebox{\tempbox}{\parbox{\textwidth}
		{\hangindent=\tempwidth
			\hangafter=1
			\makebox[\tempwidth][l]{#1}#2}}
	\fi
	\vskip\abovecaptionskip
	{\centering\usebox{\tempbox}\par}
	\vskip\belowcaptionskip\hbox{}}

\newcommand{\firstsubcaption}[2][\empty]% #1 = short caption (optional), #2 = caption
{%\refstepcounter{figure}
	\refstepcounter{subfigure}
	\ifx#1\empty
	\addcontentsline{lof}{figure}{\string\numberline {\thefigure\alph{subfigure}}{\ignorespaces #2 \relax}}
	\else
	\addcontentsline{lof}{figure}{\string\numberline {\thefigure\alph{subfigure}}{\ignorespaces #1 \relax}}
	\fi
	\makecaption{\figurename#1~\thefigure\alph{subfigure} :}{~\normalfont#2}}

\newcommand{\nextsubcaption}[2][\empty]% #1 = short caption (optional), #2 = caption
{\refstepcounter{subfigure}
	\ifx#1\empty
	\addcontentsline{lof}{figure}{\string\numberline {\thefigure\alph{subfigure}}{\ignorespaces #2 \relax}}
	\else
	\addcontentsline{lof}{figure}{\string\numberline {\thefigure\alph{subfigure}}{\ignorespaces #1 \relax}}
	\fi
	\makecaption{\figurename#1~\thefigure\alph{subfigure} :}{~\normalfont#2}}

%============================= INDENTATION SETTINGS IN TOC, LOT, AND LOF ==============================
% The spacing of the TOC lines has been redefined. - SBÖ
\newcommand*\l@mistix{\@tocline{1}{0mm}{0mm}} 						% Seems like no need - SBÖ
\renewcommand*\l@section{\@tocline{1}{1.1em}{1.5em}}              	
\renewcommand*\l@subsection{\@tocline{2}{2.2em}{2.3em}}  		    % {2}{2.1em}{2.5em}} - SBÖ  		
\renewcommand*\l@subsubsection{\@tocline{3}{3.3em}{3.0em}} 			
\newcommand*\l@subsubsubsection{\@tocline{4}{4.3em}{4.9em}}         % {4}{4.4em}{4.9em}} - SBÖ
\renewcommand*\l@table{\@lofline{1}{0em}{5.5em}}  					
%\renewcommand*\l@figure\l@table									% Removed - SBÖ
\renewcommand*\l@figure{\@lofline{1}{0em}{6em}}  					% {1}{0em}{5.5em}} - SBÖ

%========================= WARNINGS IF SOME PARTS ARE MISSING WHEN COMPILED ===========================
\newcommand*{\th@baslikbir}{
    \ClassError{itutez}{*** You must specify the TITLE of your thesis! ***}
    {Use the \protect\baslik{} command in the preamble.}}

\newcommand*{\th@Titlebir}{
    \ClassError{itutez}{*** You must specify the ENGLISH TITLE of your thesis! ***}
    {Use the \protect\title{}{}{} command in the preamble.}}

\newcommand*{\th@tarih}{
    \ClassError{itutez}{*** You must specify the DATE of your thesis! ***}
    {Use the \protect\tarih{} command in the preamble.}}

\newcommand*{\th@TeziYoneten}{
    \ClassError{itutez}{*** You must specify the TEZIYONETEN of your thesis! ***}
    {Use the \protect\TeziYoneten{} command in the preamble.}}

\newcommand*{\th@isimsoyisim}{
    \ClassError{itutez}{*** You must specify the AUTHOR of your thesis! ***}
    {Use the \protect\author{}{} command in the \MessageBreak
        preamble. The first arg is your first name and \MessageBreak
        middle initial.  The second arg is your last name.}}
        
\newcommand{\th@AnaBilimDali}{
    \ClassError{itutez}{*** You must specify an AnaBilimDali! ***}
    {Use the \protect\anabilimdali[]{} command in the \MessageBreak
        preamble. If your abstract runs over a page, \MessageBreak
        use the optional argument with the word 'long'.}
}

%======================== SECTION, SUBSECTION, AND SUBSUBSECTION SETTINGS ============================
% Numbered and unnumbered section settings - SBÖ
\def\section{\@ifstar\unnumberedsection\numberedsection}
\def\numberedsection{\@ifnextchar[%]
  \numberedsectionwithtwoarguments\numberedsectionwithoneargument}
\def\unnumberedsection{\@ifnextchar[%]
  \unnumberedsectionwithtwoarguments\unnumberedsectionwithoneargument}
\def\numberedsectionwithoneargument#1{\numberedsectionwithtwoarguments[#1]{#1}}
\def\unnumberedsectionwithoneargument#1{\unnumberedsectionwithtwoarguments[#1]{#1}}
\def\numberedsectionwithtwoarguments[#1]#2{%
  \ifhmode\par\fi  
  \removelastskip
  \vspace*{12pt}\goodbreak % It was 18pt, but this is before the section spacing, therefore it should be 12pt - SBÖ
  \refstepcounter{section}
  \noindent
  \leavevmode
  \begingroup
  \th@HdFnt\th@ScSz
  \thesection\;\ 
  #2\quad
  \endgroup\goodbreak 
  \vskip 6pt\nobreak   	% Added for spacing after the section title - SBÖ
  \addcontentsline{toc}{section}{\protect\numberline{\thesection}#1}}
\def\unnumberedsectionwithtwoarguments[#1]#2{
  \ifhmode\par\fi
  \removelastskip
  \vspace*{12pt}\goodbreak
  \noindent
  \leavevmode
  \begingroup
  \bfseries
  #2\quad
  \endgroup\goodbreak
  \vskip 6pt\nobreak   	% Added for spacing after the section title - SBÖ
  \addcontentsline{toc}{section}{#1}}

% Numbered and Unnumbered subsection settings - SBÖ    
\def\subsection{\@ifstar\unnumberedsubsection\numberedsubsection}
\def\numberedsubsection{\@ifnextchar[%]
  \numberedsubsectionwithtwoarguments\numberedsubsectionwithoneargument}
\def\unnumberedsubsection{\@ifnextchar[%]
  \unnumberedsubsectionwithtwoarguments\unnumberedsubsectionwithoneargument}
\def\numberedsubsectionwithoneargument#1{\numberedsubsectionwithtwoarguments[#1]{#1}}
\def\unnumberedsubsectionwithoneargument#1{\unnumberedsubsectionwithtwoarguments[#1]{#1}}
\def\numberedsubsectionwithtwoarguments[#1]#2{%
  \ifhmode\par\fi
  \removelastskip
   \vspace*{6pt}\goodbreak % It was 12pt, but this is before the section spacing, therefore it should be 6pt - SBÖ
  \refstepcounter{subsection}%
  \noindent
  \leavevmode
  \begingroup
  \th@HdFnt\th@ScSz
  \thesubsection\;\ 
  #2\quad
  \endgroup\goodbreak 	% \goodbreak is removed (the below part is added) - SBÖ
  \vskip 0pt\nobreak   	% Added for spacing after the section title - SBÖ
  \addcontentsline{toc}{subsection}{\protect\numberline{\thesubsection}#1}}
\def\unnumberedsubsectionwithtwoarguments[#1]#2{
  \ifhmode\par\fi
  \removelastskip
  \vspace*{6pt}\goodbreak
  \noindent
  \leavevmode
  \begingroup
  \bfseries
  #2\quad
  \endgroup\goodbreak
  \vskip 0pt\nobreak   % Added for spacing after the section title - SBÖ
  \addcontentsline{toc}{subsection}{#1}}

% Numbered and Unnumbered subsubsection settings - SBÖ
\def\subsubsection{\@ifstar\unnumberedsubsubsection\numberedsubsubsection}
\def\subsubsubsection{\unnumberedsubsubsubsection}
\def\numberedsubsubsection{\@ifnextchar[%]
  \numberedsubsubsectionwithtwoarguments\numberedsubsubsectionwithoneargument}
\def\unnumberedsubsubsection{\@ifnextchar[%]
  \unnumberedsubsubsectionwithtwoarguments\unnumberedsubsubsectionwithoneargument}
\def\unnumberedsubsubsubsection{\@ifnextchar[%]
  \unnumberedsubsubsubsectionwithtwoarguments\unnumberedsubsubsubsectionwithoneargument}

\def\numberedsubsubsectionwithoneargument#1{\numberedsubsubsectionwithtwoarguments[#1]{#1}}
\def\unnumberedsubsubsectionwithoneargument#1{\unnumberedsubsubsectionwithtwoarguments[#1]{#1}}

\def\unnumberedsubsubsubsectionwithoneargument#1{\unnumberedsubsubsubsectionwithtwoarguments[#1]{#1}}

\def\numberedsubsubsectionwithtwoarguments[#1]#2{
  \ifhmode\par\fi
  \removelastskip
  \vspace*{6pt}\goodbreak
  \refstepcounter{subsubsection}
  \noindent
  \leavevmode
  \begingroup
  \th@HdFnt\th@ScSz
  \thesubsubsection\;\ 
  #2\quad
  \endgroup\goodbreak
  \addcontentsline{toc}{subsubsection}{\protect\numberline{\thesubsubsection}#1}}
\def\unnumberedsubsubsectionwithtwoarguments[#1]#2{
  \ifhmode\par\fi
  \removelastskip
  \vspace*{6pt}\goodbreak
  \noindent
  \leavevmode
  \begingroup
  \bfseries
  #2\quad
  \endgroup\goodbreak
  \addcontentsline{toc}{subsubsection}{#1}}

% Unnumbered subsubsubsection settings - SBÖ
\def\unnumberedsubsubsubsectionwithtwoarguments[#1]#2{
  \ifhmode\par\fi
  \removelastskip
  \vspace*{0pt}\goodbreak % It was 6pt, but this is before the section spacing, therefore it should be 0pt - SBÖ
  \noindent
  \leavevmode
  \begingroup
  \bfseries
  #2\quad
  \endgroup\goodbreak 
  \vskip -6pt\nobreak  % Added for spacing after the section title - SBÖ
  \addcontentsline{toc}{subsubsubsection}{#1}}

% TOC'de part tanımları - SBÖ 
\def\@part[#1]#2{\ifnum \c@secnumdepth >\m@ne
                 \refstepcounter{part}
                 \addcontentsline{toc}{part}{\thepart\protect\hspace{1em}#1}
                 \addcontentsline{toc}{part}{#1}
    \else
       \relax  
    \fi
    \markboth{}{}
    {\centering
     \interlinepenalty \@M
     \normalfont
     \ifnum \c@secnumdepth >-2\relax
       \huge\bfseries \partname\nobreakspace\thepart
       \par
       \vskip 20\p@
     \fi
     \Huge \bfseries #2\par}
    \@endpart}

\newif\if@appendix\@appendixfalse

% Chapter settings - SBÖ
\renewcommand\chapter{
                      \global\@topnum\z@ 		% Prevents figures from going at top of page. - SBÖ
                      \@afterindentfalse 		% No indent in first paragraph. - SBÖ
                      \secdef\@chapter\@schapter}

% EK settings - SBÖ
%%EK BÖLÜMÜNDE BÖLÜM NUMARASI OLMASIN DİYE
\newcommand{\eklerkapak}{\global\@topnum\z@
                      \@afterindentfalse
                      \secdef\@eklerkapak\@schapter}

% TOC'de Chapter tanımları - SBÖ 
\def\@chapter[#1]#2{%\BolumSagdaKalsinNolu
	                \newpage % Changed - SBÖ %\BolumSagdaKalsinNolu 
                    \ifnum \c@secnumdepth >\m@ne
                         \refstepcounter{chapter}
                          \addtocontents{toc}{\protect\addvspace{-10\p@}}
                          %\addtocontents{toc}{\protect\addvspace{0\p@}}
                          \if@appendix
	                      \addtocontents{toc}{\protect\addvspace{0\p@}}
                              \addcontentsline{toc}{section}{\protect #1}										
% \relax
								  \else
                              \addcontentsline{toc}{chapter}{\thechapter. \protect \bf{#1}}
								  \fi
                    \else
                      \relax
                    \fi
                    \chaptermark{#1}
                    %LoT ve LoF da bölümler arası geçişde bir boşluk bırakılacaksa...
                    %\addtocontents{lof}{\protect\addvspace{10\p@}}
                    \if@twocolumn
                      \@topnewpage[\@makechapterhead{#2}]
                    \else
                      \@makechapterhead{#2}
                      \@afterheading
                    \fi
                    }

% TOC'de EK tanımları - SBÖ 
%%EK BÖLÜMÜNDE BÖLÜM NUMARASI OLMASIN DİYE
\def\@eklerkapak[#1]#2{%\BolumSagdaKalsinNolu
	                   \newpage % Changed - SBÖ %\BolumSagdaKalsinNolu 
                    \ifnum \c@secnumdepth >\m@ne
                         \refstepcounter{chapter}
                          \addtocontents{toc}{\protect\addvspace{-10\p@}}
                          %\addtocontents{toc}{\protect\addvspace{0\p@}}
                          \if@appendix
										\relax 	
								  \else
										\addcontentsline{toc}{chapter}{\protect \bf{\EklerinBasligi}}
								  \fi
                    \else
                      \relax 					
                    \fi
                    \chaptermark{\EklerinBasligi}
                    % LoT ve LoF da bölümler arası geçişde bir boşluk bırakılacaksa...
                    %\addtocontents{lof}{\protect\addvspace{10\p@}}
                   \if@twocolumn
                     \@topnewpage[\@makechapterheadEK{\EklerinBasligi}]
                   \else
                     \@makechapterheadEK{\EklerinBasligi}
                     \@afterheading
                   \fi
}

%==================================== CHAPTER TITLE SETTINGS =========================================
\def\@makechapterhead#1{
    %\vspace*{\ChapterUstenBosluk}					% That is strange; there is spacing even if it is empty - SBÖ
%		\addcontentsline{toc}{section}{\protect #1}
    {\parindent \z@ \raggedright
    \normalfont
    \ifnum \c@secnumdepth >\m@ne
     \if@appendix 
%      \th@HdFnt\th@ScSz \if@Ingilizce APPENDIX \else EK \fi \thechapter\;: #1
       \th@HdFnt\th@ScSz #1
%        \unnumberedsectionwithoneargument{#1}
%       \addcontentsline{toc}{subsection}{#1}
     \else
           \th@HdFnt\th@ScSz \thechapter. \;#1 
        \par\nobreak
        \vskip 12\p@ 								% This is the Chapter 18 pt spacing after the title - SBÖ
    \fi\fi
    \interlinepenalty\@M
    \th@HdFnt\th@ScSz \par\nobreak
    %\vskip 20\p@
  }}

%======================================== EK TITLE SETTINGS ==========================================
%%EK BÖLÜMÜNDE BÖLÜM NUMARASI OLMASIN DİYE
\def\@makechapterheadEK#1{
    %\vspace*{\ChapterUstenBosluk}					% That is strange; there is spacing even if it is empty - SBÖ
    {\parindent \z@ \raggedright
    \normalfont
    \ifnum \c@secnumdepth >\m@ne
         \th@HdFnt\th@ScSz #1
     \fi
    \interlinepenalty\@M
    \th@HdFnt\th@ScSz \par\nobreak
    \vskip 18\p@ 									% This is the Appendices 18 pt spacing after the title - SBÖ
  }}


\def\@schapter#1{\newpage % Changed - SBÖ %\BolumSagdaKalsinNolu 
    \@makeschapterhead{#1}
    \@afterheading
    }

%======================================= FRONT COVER PAGE SETTINGS ======================================= - SBÖ
\newcommand*{\th@DisKapak}{
	\addtocontents{toc}{\protect\addvspace{-10\p@}}
	\addcontentsline{toc}{chapter}{\bf{\protect\frontcoverToC}}
	%\setlength{\voffset}{5mm}      % Strange that it is needed to make it page num. 1.5cm from bottom for the rest - SBÖ
	%\BolumSagdaKalsinNolu % This has not to be call. Causing empty pages at the first pages and page shiftings - SBÖ
	%\thispagestyle{empty}
	\singlespacing  				% For single spacing in the top portion of kapak - SBÖ
	\makeatletter
	\centering
	\makeatother	
	\vspace*{0pt}
	%\bf\th@UniversityUpper \\
	%\vskip 12\p@ 
	%\MakeUppercase{\bf\th@Institute~\th@Instituteiki} \\
	    \if@FenBilimleri
	\begin{textblock*}{\textwidth}[0,0](25mm,30.5mm)
		\fi
		\if@Bilisim	
		\begin{textblock*}{\textwidth}[0,0](25mm,30.5mm)
			\fi
			\if@SosyalBilimler
			\begin{textblock*}{\textwidth}[0,0](25mm,30.5mm)
				\fi
				\if@Avrasya
				\begin{textblock*}{\textwidth}[0,0](25mm,30.5mm)
					\fi
					\singlespacing  					% For single spacing in the top portion of kapak - SBÖ
					\renewcommand{\ULdepth}{2.75pt} 	% Added using ulem package for \uline command - SBÖ
					\renewcommand{\ULthickness}{1.5pt} 	% Added for underline tickness change which was 0.4pt - SBÖ
					\centering
					\uline{{\bf\th@EnstituUpper}}\\ 	%Instead of \underline{text} - SBÖ
				\end{textblock*}
				
				\begin{textblock*}{\textwidth}[0,0](25mm,35.5mm)
					\renewcommand{\ULdepth}{2.75pt} 	% Added using ulem package for \uline command - SBÖ
					\renewcommand{\ULthickness}{1.5pt} 	% Added for underline tickness change which was 0.4pt - SBÖ
					\centering
					\uline{\MakeUppercase{\bf\th@Instituteiki}}\\ % FBE ingilizce yeni baslik icin
				\end{textblock*}
	\vskip 72\p@ 
	\th@titleFtSz\Baslikspacing \Baslikbir \\
	\th@titleFtSz\Baslikspacing \Baslikiki \\
	\th@titleFtSz\Baslikspacing \Baslikuc \\
	\vskip 32\p@ 
	\TezSeviyesi \\
	\vskip 60\p@ 
	\th@titleFtSz \th@isimsoyisim  \\
	\th@titleFtSz (\th@ogrencino) \\
    \vskip 12\p@ 
    \th@titleAnaBilimDaliFtSz \Anabilim\\
    \vskip 12\p@ 
    \th@titleAnaBilimDaliFtSz \Program \\
    
    \makeatletter
    \raggedright
    \setlength{\parindent}{12pt} 
    \if@Ingilizce 
    \begin{textblock*}{\textwidth}[0,0](25mm,160.5mm)
    	\MakeUppercase\JuriBaslik~:
    	\vskip 12\p@ 
    	\begin{tabular}{@{}p{33mm} l l}
    		\bf{Thesis Advisor\hspace*{5pt}\hfill:}& \bf{\th@TezYoneticisi} & 
    		\\% Matching to the word template - SBÖ
    		& \normalfont\th@TezYoneticisiUniv  &  \\
    		\ifthenelse{\equal{\th@esdanisman}{}}{}{   &  &  \\
    			&  &  \\
    			\bf{Co-Advisor\hspace*{25pt}\hfill:}& \bf{\th@esdanisman} & 
    			\\% Matching to the word template - SBÖ
    			& \normalfont\th@esdanismanuniv  &  \\}
    		&  &  \\
    		&  &  \\
    		\bf{Member\hspace*{25pt}\hfill:}& \bf{\th@juribir} & 
    		\\% Matching to the word template - SBÖ
    		& \normalfont\th@juribiruniv  &  \\
    		&  &  \\
    		&  &  \\
    		\bf{Member\hspace*{25pt}\hfill:}& \bf{\th@juriiki} & 
    		\\% Matching to the word template - SBÖ
    		& \normalfont\th@juriikiuniv  &  \\
    		&  &  \\
    		&  &  \\
    		& \bf{\th@juriuc} & 
    		\\% Matching to the word template - SBÖ
    		& \normalfont\th@juriucuniv  &  \\
    		&  &  \\
    		&  &  \\
    	%	\ifthenelse{\equal{\th@juridort}{}}{}{ & 
    	%		\bf{\th@juridort} & 
    	%		\\% Matching to the word template - SBÖ
    	%		& \normalfont\th@juridortuniv  &  \\}
    	%	&  &  \\
    	%	&  &  \\
    	%	\ifthenelse{\equal{\th@juribes}{}}{}{ & \bf{\th@juribes} & 
    	%		\\% Matching to the word template - SBÖ
    	%		& \normalfont\th@juribesuniv  &  \\}
    	%	&  &  \\
    	%	&  &  \\
    	\end{tabular}
    \end{textblock*}
    
    \else
       
    \begin{textblock*}{\textwidth}[0,0](25mm,160.5mm)
    	\MakeUppercase\JuriBaslik~:
    	\vskip 12\p@ 
    	\begin{tabular}{@{}p{33mm} l l}
    		\bf{Tez Dan\i \c{s}man{\i}\hspace*{5pt}\hfill:}& \bf{\th@TezYoneticisi} & 
    		\\% Matching to the word template - SBÖ
    		& \th@TezYoneticisiUniv  &  \\
    		\ifthenelse{\equal{\th@esdanisman}{}}{}{   &  &  \\
    			&  &  \\
    			\bf{E\c{s} Dan\i \c{s}man\hspace*{25pt}\hfill:}& \bf{\th@esdanisman} & 
    			\\% Matching to the word template - SBÖ
    			& \th@esdanismanuniv  &  \\}
    		&  &  \\
    		&  &  \\
    		\bf{J\"uri \"Uyesi\hspace*{25pt}\hfill:}& \bf{\th@juribir} & 
    		\\% Matching to the word template - SBÖ
    		& \th@juribiruniv  &  \\
    		&  &  \\
    		&  &  \\
    		\bf{J\"uri \"Uyesi\hspace*{25pt}\hfill:}& \bf{\th@juriiki} & 
    		\\% Matching to the word template - SBÖ
    		& \th@juriikiuniv  &  \\
    		&  &  \\
    		&  &  \\
    		& \bf{\th@juriuc} & 
    		\\% Matching to the word template - SBÖ
    		& \th@juriucuniv  &  \\
    		&  &  \\
    		&  &  \\
    	%	\ifthenelse{\equal{\th@juridort}{}}{}{ & 
    	%		\bf{\th@juridort} & 
    	%		\\% Matching to the word template - SBÖ
    	%		& \th@juridortuniv  &  \\}
    	%	&  &  \\
    	%	&  &  \\
    	%	\ifthenelse{\equal{\th@juribes}{}}{}{ & \bf{\th@juribes} & 
    	%		\\% Matching to the word template - SBÖ
    	%		& \th@juribesuniv  &  \\}
    	%	&  &  \\
    	%	&  &  \\
    	\end{tabular}
    \end{textblock*}
    
    \fi
    \makeatother
	\begin{textblock*}{\textwidth}[0,0](25mm,265.5mm)
	\centering
	(THE REPORT NUMBER, PERIOD AND YEAR MUST BE WRITTEN)\\
	\nth{\ReportNumber} \th@titleFtSz REPORT -- \TarihBuyuk \\
	 \end{textblock*}
	\newpage
%\vspace*{\fill}
}

%======================================== TOC PAGE SETTINGS ========================================= - SBÖ
\renewcommand\tableofcontents{
	%\setlength{\voffset}{0mm}      % Strange that it is needed to make it page num. 1.5cm from bottom for the rest - SBÖ
    %\vspace*{\ChapterUstenBosluk} 				% This is not effective - SBÖ
    {\chapter*{\contentsname}\addcontentsline{toc}{part}{\bf{\protect\contentsnameToC}}%
    \vspace*{-18pt}
    \renewcommand{\ULdepth}{4pt} % Added using ulem package for \uline command - SBÖ
    \renewcommand{\ULthickness}{1.5pt} % Added for underline tickness change which was 0.4pt default - SBÖ
    \if@Ingilizce\hfill\vspace*{0.5truecm}{\bf\uline{Page}}~\else~\hfill\vspace*{0truecm}{\bf\uline{Sayfa}}\fi}\\ %Instead of \underline{text} - SBÖ
    %\hfill\vspace*{0.5truecm}{\bf\underline{\if@Ingilizce Page\else Sayfa\fi}}} % Removed by SBÖ

    \let\orig@numberline\numberline
    \@mkboth{\MakeUppercase\listtablename}{\MakeUppercase\listtablename}
    \newlength{\th@oldparskip}
    \setlength{\th@oldparskip}{\parskip}
    \setlength{\parskip}{\ToCparskip}
    \@starttoc{toc}
    \setlength{\parskip}{\th@oldparskip}
    }

%======================================== LOT PAGE SETTINGS ========================================= - SBÖ
\renewcommand\listoftables{
	\setlength{\voffset}{-5mm}      % Strange that it is needed to make it page num. 1.5cm from bottom for the rest - SBÖ
    %\vspace*{\ChapterUstenBosluk} 				% This is not effective - SBÖ   
    {\chapter*{\listtablename}
    \vspace*{-18pt}
    \renewcommand{\ULdepth}{4pt} % Added using ulem package for \uline command - SBÖ
    \renewcommand{\ULthickness}{1.5pt} % Added for underline tickness change which was 0.4pt - SBÖ
    \if@Ingilizce\hfill\vspace*{0.5truecm}{\bf\uline{Page}}~\else~\hfill\vspace*{0truecm}{\bf\uline{Sayfa}}\fi}\\ % Instead of \underline{text} - SBÖ
    %\hfill\vspace*{0.5truecm}{\bf\underline{\if@Ingilizce Page\else Sayfa\fi}}} % Removed - SBÖ

    \let\orig@numberline\numberline   
    \@mkboth{\MakeUppercase\listtablename}{\MakeUppercase\listtablename}
    \renewcommand*{\numberline}[1]{%
    \orig@numberline{\bf\tablename\ ##1}\hspace{-8pt}{\bf:}\hspace{4pt}} % Better spacing - SBÖ
    \addcontentsline{toc}{part}{\bf{\protect\listtablenameToC}}
    \setlength{\th@oldparskip}{\parskip}
    \setlength{\parskip}{\LoTparskip}
    \@starttoc{lot}
    \setlength{\parskip}{\th@oldparskip}
    \let\numberline\orig@numberline
    }

%======================================== LOF PAGE SETTINGS ========================================= - SBÖ  
\renewcommand\listoffigures{
    %\vspace*{\ChapterUstenBosluk} 				% This is not effective - SBÖ
    {\chapter*{\listfigurename}
    \vspace*{-18pt}
    \renewcommand{\ULdepth}{4pt} % Added using ulem package for \uline command - SBÖ
    \renewcommand{\ULthickness}{1.5pt} % Added for underline tickness change which was 0.4pt - SBÖ
    \if@Ingilizce\hfill\vspace*{0.5truecm}{\bf\uline{Page}}~\else~\hfill\vspace*{0truecm}{\bf\uline{Sayfa}}\fi}\\ % Instead of \underline{text} - SBÖ
    %\hfill\vspace*{0.5truecm}{\bf\underline{\if@Ingilizce Page\else Sayfa\fi}}}

    \let\orig@numberline\numberline
    \@mkboth{\MakeUppercase\listfigurename}{\MakeUppercase\listfigurename}
    \renewcommand*{\numberline}[1]{%
    \orig@numberline{\bf\figurename\ ##1}\hspace{-8pt}{\bf:}\hspace{4pt}} % Better spacing - SBÖ
    \addcontentsline{toc}{part}{\bf{\protect\listfigurenameToC}}
    \setlength{\th@oldparskip}{\parskip}
    \setlength{\parskip}{\LoFparskip}
    \@starttoc{lof}
    \setlength{\parskip}{\th@oldparskip}
    \let\numberline\orig@numberline
    }

%===================================== APPENDICES PAGE SETTINGS ====================================== - SBÖ
\newcommand{\eklerbolum}[1]{\par
    \newpage
    \singlespacing
    \setcounter{chapter}{#1}
    \setcounter{section}{0}
	%\renewcommand{\theequation}{{\bf A.\arabic{equation}}} 			% Removed - SBÖ
	\renewcommand{\theequation}{{\bf \thechapter.\arabic{equation}}}
	\setcounter{equation}{0}
    %\renewcommand\@chapapp{\appendixname}%
    
    \renewcommand\thechapter{\@Alph\c@chapter} 						
    %\renewcommand{\thechapter}{\@Alph\c@chapter.\arabic{chapter}}
    %\renewcommand{\thesection}{A.\arabic{section}}
    
    %\addtocontents{toc}{\protect\addvspace{-10\p@}}
%    \addcontentsline{toc}{chapter}{\bf{\protect\appendixnameToC}}
    \global \@appendixtrue
    }

%==================================== BIBLIOGRAPHY PAGE SETTINGS ===================================== - SBÖ
\renewcommand{\@biblabel}[1]{#1}
\renewenvironment{thebibliography}[1]{%\singlespacing
    %\vspace*{\ChapterUstenBosluk} 				% This is not effective - SBÖ
    \chapter*{\bibname}%
    \vspace*{-18pt} 							% Better spacing from the Reference title at start-up - SBÖ
    \singlespacing
    \addtocontents{toc}{\protect\addvspace{-10\p@}}
    \addcontentsline{toc}{chapter}{\bf{\protect\bibnameToC}}
    \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}
    \list{\@biblabel{[\@arabic\c@enumiv]}}%
         {\settowidth\labelwidth{\@biblabel{999}}%
          \leftmargin\labelwidth
          \advance\leftmargin\labelsep
          \setlength{\leftmargin}{-\leftmargin}
          \advance\leftmargin by 31.8mm 					% Adjusted - SBÖ
          \setlength{\itemindent}{-15.25mm}					% Adjusted - SBÖ
  %       \setlength{\listparindent}{-20mm}%
          \@openbib@code
          \usecounter{enumiv}%
          \let\p@enumiv\@empty
          \renewcommand\theenumiv{\@arabic\c@enumiv}}%
    \sloppy
    \clubpenalty4000
    \@clubpenalty \clubpenalty
    \widowpenalty4000%
    \sfcode`\.\@m
    }
    {\def\@noitemerr
      {\@latex@warning{Empty `thebibliography' environment}}%
    \endlist}

%========================================= ALL PAGES CALLED ========================================== - SBÖ
\newcommand{\th@MakeThesisPrologue}{
    \thispagestyle{empty}
    \fontfamily{ptm}
    \selectfont
    \pagenumbering{roman}								
    \renewcommand*{\thepage}{\small{\roman{page}}}  	% Page number font size set to 11 pt for roman pages - SBÖ
    \th@Kapak
    \fontfamily{cmr}
    \selectfont
    \setcounter{page}{\if@Ingilizce \if@Onluarkali 2 \else 3 \fi \else 
       \if@Onluarkali 3 \else 2 \fi \fi}
    \singlespacing
	\renewcommand{\ttdefault}{pcr}   % MS Times fontu için
	\normalfont\selectfont	      	 % MS Times fontu için
   % \newpage
    \ToCspacing
    \tableofcontents
        \if@TabloListesiVar
	\LoTspacing
	\listoftables
        \fi
        \if@SekilListesiVar
	\LoFspacing	
	\listoffigures
        \fi
    \justify    
    \setlength{\parindent}{0pt} 
    \newpage
	%\BolumSagdaKalsinNolu
    \singlespacing %\oneandonehalf
     }

\let\th@OldBeginDocument\document
\renewcommand*{\document}{
    \th@OldBeginDocument
    \th@MakeThesisPrologue
    \pagenumbering{arabic}
    \renewcommand*{\thepage}{\small{\arabic{page}}} % Page number font size set to 11 pt = small - SBÖ
}

\endinput

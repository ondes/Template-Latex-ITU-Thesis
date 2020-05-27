\NeedsTeXFormat{LaTeX2e}[1996/12/01]
\ProvidesClass{thesis_itu}[08/02/2019 BE]

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
\newif\if@Bez
\newif\if@Bilisim
\newif\if@Avrasya
\newif\if@FenBilimleri
\newif\if@UcakUzay
\newif\if@ElektrikElektronik 								% Elektrik-Elektronik Fakültesi - SBÖ
\newif\if@SosyalBilimler
\newif\if@Enerji
\@Bezfalse
\DeclareOption{onluarkali}{\PassOptionsToClass{twoside}{report}\@Onluarkalitrue}
\DeclareOption{ingilizce}{\@Ingilizcetrue}
\DeclareOption{doktora}{\@Doktoratrue}
\DeclareOption{turkce}{\@Ingilizcefalse}
\DeclareOption{yukseklisans}{\@YuksekLisanstrue}
\DeclareOption{lisans}{\@Lisanstrue}
\DeclareOption{karton}{\@Bezfalse}
\DeclareOption{bez}{\@Beztrue}
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

%============================ SETTINGS OF TITLE SPACINGS ONE INCH FROM TOP ============================
\newlength{\ChapterUstenBosluk}
\setlength{\ChapterUstenBosluk}{21.5mm} 
\newlength{\UstenBosluk}
\setlength{\UstenBosluk}{17mm} 

%============================= TOC, LOT AND LOF RELATED PARAGPRAPH SKIPS ============================
\newlength{\LoFparskip}     %% List of Figure parskip 08-05-2006
\setlength{\LoFparskip}{0em}

\newlength{\LoTparskip}     %% List of Table parskip 08-05-2006
\setlength{\LoTparskip}{0em}

\newlength{\ToCparskip}     %% Table of Content parskip 08-05-2006
\setlength{\ToCparskip}{0em}

%============================== SETTINGS BETWEEN onaypage AND CHAPTERS ==============================
\newif\if@SembolListesiVar  %% Sembol Listesi Olsun mu?
\@SembolListesiVarfalse

\newif\if@KisaltmaListesiVar%% Kisaltma Listesi Olsun mu?
\@KisaltmaListesiVarfalse

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
\newcommand*{\KisaltmaListesiYok}{\@KisaltmaListesiVarfalse}

%=================================== KAPAK AND onaypage SETTINGS  ====================================
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

\newcommand*{\ithaf}[1]{\th@StoreIn{\th@Ithaf}{#1}}

\newcommand*{\unvan}[1]{\th@StoreIn{\th@Unvan}{#1}}

%================================= FACULTY AND INSTITUTES SETTINGS =================================== 
    \if@Bilisim
      \def\th@Enstitu{B\.il\.i\c s\.im Enst\. it\"us\"u}
      \def\th@Institute{Informatics Institute}
      \def\th@Instituteiki{} 									% Added for onay page simplicity - SBÖ
    \fi
    \if@FenBilimleri
      \def\th@Enstitu{Fen B\. il\. imler\. i Enst\. it\"us\"u}
      \def\th@Institute{Graduate School of Science}
      \def\th@Instituteiki{Engineering and Technology} 			% FBE ingilizce yeni baslik icin
    \fi
    \if@SosyalBilimler
      \def\th@Enstitu{Sosyal B\. il\. imler Enst\. it\"us\"u}
      \def\th@Institute{The Graduate School of Arts}            % To fill the text properly to the first line - SBÖ
      \def\th@Instituteiki{and Social Sciences} 				% Added for onay page simplicity - SBÖ
    \fi
    \if@Enerji
      \def\th@Enstitu{Enerj\. i Enst\. it\"us\"u}
      \def\th@Institute{Institute of Energy}
      \def\th@Instituteiki{} 									% Added for onay page simplicity - SBÖ
    \fi
    \if@Avrasya
      \def\th@Enstitu{Avrasya Yer B\. il\. imler\. i Enst\. it\"us\"u}
      \def\th@Institute{Eurasia Institute of}                   % To fill the text properly to the first line - SBÖ
      \def\th@Instituteiki{Earth Sciences} 						% Added for onay page simplicity - SBÖ
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

%================================== ALL PAGES FROM KAPAK TO FORWARD ==================================  
\newcommand{\kapak}[1]{\th@StoreIn{\th@Kapak}{#1}}
\if@Bez
  \kapak{\th@DisKapak\th@IcKapak\if@Ingilizce \th@IcKapakTurkce\fi \th@onaypage}
\else
  \kapak{\th@DisKapak\th@IcKapak\if@Ingilizce \th@IcKapakTurkce\fi \th@onaypage}
\fi

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
\newcommand*{\tezvermetarih}[2]{
  \th@StoreIn{\th@tezvermetarih}{#1}
  \th@StoreIn{\th@submissiondate}{#2}
}
\newcommand*{\tezsavunmatarih}[2]{
  \th@StoreIn{\th@tezsavunmatarih}{#1}
  \th@StoreIn{\th@defencedate}{#2}
}
\newcommand*{\esdanismani}[2]{
  \th@StoreIn{\th@esdanisman}{#1}
  \th@StoreIn{\th@esdanismanuniv}{#2}
}

%========================= KAPAK AND EKLERIN INGILIZCE TURKCE TANIMLAMALARI ==========================
\if@Ingilizce
  \if@Doktora
    \def\TezSeviyesi{Ph.D. THESIS}
    \def\TezSeviyesiTR{DOKTORA TEZ{\.I}}
  \fi
  \if@YuksekLisans
    \def\TezSeviyesi{M.Sc. THESIS}
    \def\TezSeviyesiTR{Y\"UKSEK L{\.I}SANS TEZ{\.I}}
  \fi
  \if@Lisans
    \def\TezSeviyesi{GRADUATION THESIS}
    \def\TezSeviyesiTR{ B{\.I}T{\.I}RME ÇALIŞMASI}
  \fi
  % Modification of the size and the placement of bigstar - SBÖ
  \def\th@EnstituUpper{ISTANBUL TECHNICAL UNIVERSITY \raisebox{1.6pt}{\footnotesize$\bigstar$} \MakeUppercase{\th@Institute}}
  \def\th@EnstituUpperTR{İSTANBUL TEKNİK ÜNİVERSİTESİ \raisebox{1.6pt}{\footnotesize$\bigstar$} \MakeUppercase{\th@Enstitu}}
  %\def\th@EnstituUpper{İSTANBUL TECHNICAL UNIVERSITY $\bigstar$ INSTITUTE OF SCIENCE AND TECHNOLOGY}
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
  \def\VermeTarihi{\th@submissiondate}
  \def\VermeTarihiBaslik{Date of Submission}
  \def\SavunmaTarihi{\th@defencedate}
  \def\SavunmaTarihiBaslik{Date of Defense Examination}
  \def\YoneticiBaslik{Supervisor (Chairman)}
  \def\DanismanBaslik{Thesis Advisor}
  \def\JuriBaslik{Members of the Examining Committee}
  \def\EklerinBasligi{APPENDICES}
\else
  \if@Doktora
    \def\TezSeviyesi{DOKTORA TEZİ}
  \fi
  \if@YuksekLisans
    \def\TezSeviyesi{YÜKSEK LİSANS TEZİ}
  \fi
  \if@Lisans
    \def\TezSeviyesi{BİTİRME ÇALIŞMASI}
  \fi
  % Modification of the size and the placement of bigstar - SBÖ
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
  \def\VermeTarihi{\th@tezvermetarih}
  \def\VermeTarihiBaslik{Tezin Enstitüye Verildiği Tarih}
  \def\SavunmaTarihi{\th@tezsavunmatarih}
  \def\SavunmaTarihiBaslik{Tezin Savunulduğu Tarih}
  \def\YoneticiBaslik{Tez Danışmanı}
  \def\DanismanBaslik{Tez Danışmanı}
  \def\JuriBaslik{Diğer Jüri Üyeleri}
  \def\EklerinBasligi{EKLER}
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
        %\setlength{\hoffset}{14.6mm} 
        \setlength{\oddsidemargin}{14.6mm}      %% Sayfa Solu = 1 in (25.4 mm) + 14.6mm = 40 mm %% [A4 297mm X 210mm] - SBÖ
        \setlength{\evensidemargin}{-0.4mm}     %% Sayfa Solu = 1 in (25.4 mm) - 0.4mm = 25 mm - SBÖ
        %\setlength{\topmargin}{-3.0mm}   
        \setlength{\topmargin}{0mm}             %% To set the bottom text not to be less than 25mm from the bottom - SBÖ  
        \setlength{\headheight}{0mm}         	%% Sayfa Başlığı (Numarası) = 0 mm
        \setlength{\headsep}{0mm}               %% Sayfa Başlığı ile Sayfa Metni Arası Boşluk
        \setlength{\textheight}{247mm}          %% Sayfa Metni Yüksekliği = 297mm - 25mm - 25mm = 247mm - SBÖ     
        \setlength{\textwidth}{145mm}           %% Sayfa Metni Genişliği = 210mm - 25mm - 40mm = 145mm
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
    \th@ozgecmispage
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
\newcommand*{\abstractnameToC}{\fontfamily{ptm}\normalsize\selectfont SUMMARY\normalfont}
\newcommand*{\onaynameToC}{\fontfamily{ptm}\normalsize\selectfont KABUL VE ONAY\normalfont}
\newcommand*{\ozetnameToC}{\fontfamily{ptm}\normalsize\selectfont ÖZET\normalfont}
\newcommand*{\onsoznameToC}{\fontfamily{ptm}\normalsize\selectfont \if@Ingilizce FOREWORD\else ÖNSÖZ\fi\normalfont}
\newcommand*{\ozgecmisnameToC}{\fontfamily{ptm}\normalsize\selectfont \if@Ingilizce CURRICULUM VITAE\else
ÖZGEÇMİŞ\fi\normalfont}
\newcommand*{\appendixnameToC}{\fontfamily{ptm}\normalsize\selectfont \if@Ingilizce APPENDICES\else EKLER\fi\normalfont}
\newcommand*{\symbolnameToC}{\fontfamily{ptm}\normalsize\selectfont \if@Ingilizce SYMBOLS\else SEMBOLLER\fi\normalfont}
\newcommand*{\bibnameToC}{\fontfamily{ptm}\normalsize\selectfont \if@Ingilizce REFERENCES\else KAYNAKLAR\fi\normalfont}
\newcommand*{\symbolname}{\th@ChapHead{\if@Ingilizce SYMBOLS\else SEMBOLLER\fi}}
\newcommand*{\kisaltmanameToC}{\fontfamily{ptm}\normalsize\selectfont \if@Ingilizce ABBREVIATIONS\else
KISALTMALAR\fi\normalfont}
\newcommand*{\kisaltmaname}{\th@ChapHead{\if@Ingilizce ABBREVIATIONS\else KISALTMALAR\fi}} 

\def\prefacename{\th@ChapHead{\if@Ingilizce FOREWORD\else ÖNSÖZ\fi}}
\def\refname{\th@ChapHead{\if@Ingilizce REFERENCES\else KAYNAKLAR\fi}}
\def\abstractname{\th@ChapHead{ÖZET}}
\def\summaryname{\th@ChapHead{SUMMARY}}
\def\ozgecmisname{\th@ChapHead{\if@Ingilizce CURRICULUM VITAE\else ÖZGEÇMİŞ\fi}}
\def\bibname{\th@ChapHead{\if@Ingilizce REFERENCES\else KAYNAKLAR\fi}}
\def\chaptername{\th@ChapHead{\if@Ingilizce CHAPTER\else BÖLÜM\fi}}
\def\appendixname{\th@ChapHead{\if@Ingilizce APPENDIX\else EK\fi}}
\def\contentsname{\th@ChapHead{\if@Ingilizce TABLE OF CONTENTS\else İÇİNDEKİLER\fi}}
\def\listfigurename{\th@ChapHead{\if@Ingilizce LIST OF FIGURES\else ŞEKİL LİSTESİ\fi}}
\def\listtablename{\th@ChapHead{\if@Ingilizce LIST OF TABLES\else ÇİZELGE LİSTESİ\fi}}
\def\indexname{\th@ChapHead{\if@Ingilizce INDEX\else DİZİN\fi}}
\def\figurename{\bf \if@Ingilizce Figure\else Şekil\fi}
\def\tablename{\bf \if@Ingilizce Table\else Çizelge\fi}
\def\partname{\th@ChapHead{\if@Ingilizce PART\else KISIM\fi}}
\def\glossaryname{\th@ChapHead{\if@Ingilizce DICTIONARY\else TERİMLER SÖZLÜĞÜ\fi}}

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
\renewcommand*\l@part[2]{
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}
    \vskip 0.1em \@plus\p@
    \setlength\@tempdima{1.5em}
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

% Chapter Settings in TOC (Same as below) - SBÖ 
%\renewcommand*\l@chapter[2]{
%	\ifnum \c@tocdepth >\m@ne
%	\addpenalty{-\@highpenalty}
%	\vskip 1.0em \@plus\p@
%	\setlength\@tempdima{1.5em}
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
\renewcommand*\l@chapter[2]{
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}
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
\def\@tocline#1#2#3#4#5{
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
\def\@lofline#1#2#3#4#5{
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
		\par}
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

%\newcommand*\l@mistix{\@tocline{1}{0mm}{0mm}}
%\renewcommand*\l@section{\@tocline{1}{1.1em}{1.5em}}
%\renewcommand*\l@subsection{\@tocline{2}{1.9em}{2.3em}}
%\renewcommand*\l@subsubsection{\@toclinealper{3}{3.5em}{3.9em}}
%\renewcommand*\l@table{\@tocline{1}{0em}{5.5em}}
%\renewcommand*\l@figure\l@table

%==================== WARNINGS IF SOME IMPORTANT PARTS ARE MISSING WHEN COMPILED ======================
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
        
\newcommand{\th@abstractStash}{
    \ClassError{itutez}{*** You must specify an abstract! ***}
    {Use the \protect\abstractpage[]{} command in the \MessageBreak
        preamble. If your abstract runs over a page, \MessageBreak
        use the optional argument with the word 'long'.}
}

\newcommand{\th@ozetStash}{
    \ClassError{itutez}{*** You must specify an ozet! ***}
    {Use the \protect\ozetpage[]{} command in the \MessageBreak
        preamble. If your abstract runs over a page, \MessageBreak
        use the optional argument with the word 'long'.}
}

\newcommand{\th@AnaBilimDali}{
    \ClassError{itutez}{*** You must specify an AnaBilimDali! ***}
    {Use the \protect\anabilimdali[]{} command in the \MessageBreak
        preamble. If your abstract runs over a page, \MessageBreak
        use the optional argument with the word 'long'.}
}

\newcommand{\th@ozgecmisStash}{
    \ClassError{itutez}{*** You must specify an ozgecmis ***}
    {Use the \protect\ozgecmispage[]{} command in the \MessageBreak
        preamble. If your abstract runs over a page, \MessageBreak
        use the optional argument with the word 'long'.}
}

%==================================== NEW COMMANDS ARE DEFINED ========================================
% Tesekkur, symbol lists, and abbreviation lists were set to false earlier now they are all true - SBÖ
\newcommand{\summary}[1]{\th@StoreIn{\th@abstractStash}{#1}}
\newcommand{\ozet}[1]{\th@StoreIn{\th@ozetStash}{#1}}
\newcommand{\ozgecmis}[1]{\th@StoreIn{\th@ozgecmisStash}{#1}}
\newcommand{\onsoz}[1]{\@TesekkurVartrue\th@StoreIn{\th@tesekkurStash}{#1}}
\newcommand{\sembollistesi}[1]{\@SembolListesiVartrue\th@StoreIn{\th@symbollistStash}{#1}}
\newcommand{\kisaltmalistesi}[1]{\@KisaltmaListesiVartrue\th@StoreIn{\th@kisaltmalistStash}{#1}}

%======================== SECTION, SUBSECTION, AND SUBSUBSECTION SETTINGS =============================
% Numbered and unnumbered section settings - SBÖ
\def\section{\@ifstar\unnumberedsection\numberedsection}
\def\numberedsection{\@ifnextchar[%]
  \numberedsectionwithtwoarguments\numberedsectionwithoneargument}
\def\unnumberedsection{\@ifnextchar[%]
  \unnumberedsectionwithtwoarguments\unnumberedsectionwithoneargument}
\def\numberedsectionwithoneargument#1{\numberedsectionwithtwoarguments[#1]{#1}}
\def\unnumberedsectionwithoneargument#1{\unnumberedsectionwithtwoarguments[#1]{#1}}
\def\numberedsectionwithtwoarguments[#1]#2{
  \ifhmode\par\fi  
  \removelastskip
  \vspace*{12pt}\goodbreak % It was 18pt, but this is before the section spacing, therefore it should be 12pt - SBÖ
  \refstepcounter{section}%
  \noindent
  \leavevmode
  \begingroup
  \th@HdFnt\th@ScSz
  \thesection\;\ 
  #2\quad
  \endgroup\goodbreak 
  \vskip 6pt\nobreak   		% Added for spacing after the section title - SBÖ
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
  \vskip 6pt\nobreak   		% Added for spacing after the section title - SBÖ
  \addcontentsline{toc}{section}{#1}}

% Numbered and Unnumbered subsection settings - SBÖ    
\def\subsection{\@ifstar\unnumberedsubsection\numberedsubsection}
\def\numberedsubsection{\@ifnextchar[%]
  \numberedsubsectionwithtwoarguments\numberedsubsectionwithoneargument}
\def\unnumberedsubsection{\@ifnextchar[%]
  \unnumberedsubsectionwithtwoarguments\unnumberedsubsectionwithoneargument}
\def\numberedsubsectionwithoneargument#1{\numberedsubsectionwithtwoarguments[#1]{#1}}
\def\unnumberedsubsectionwithoneargument#1{\unnumberedsubsectionwithtwoarguments[#1]{#1}}
\def\numberedsubsectionwithtwoarguments[#1]#2{
  \ifhmode\par\fi
  \removelastskip
   \vspace*{6pt}\goodbreak 	% It was 12pt, but this is before the section spacing, therefore it should be 6pt - SBÖ
  \refstepcounter{subsection}
  \noindent
  \leavevmode
  \begingroup
  \th@HdFnt\th@ScSz
  \thesubsection\;\ 
  #2\quad
  \endgroup\goodbreak 		% \goodbreak is removed (the below part is added) - SBÖ
  \vskip 0pt\nobreak   		% Added for spacing after the section title - SBÖ
  \addcontentsline{toc}{subsection}{\protect\numberline{\thesubsection}#1}}
\def\unnumberedsubsectionwithtwoarguments[#1]#2{%
  \ifhmode\par\fi
  \removelastskip
  \vspace*{6pt}\goodbreak
  \noindent
  \leavevmode
  \begingroup
  \bfseries
  #2\quad
  \endgroup\goodbreak
  \vskip 0pt\nobreak   		% Added for spacing after the section title - SBÖ
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
  \vspace*{0pt}\goodbreak 	% It was 6pt, but this is before the section spacing, therefore it should be 0pt - SBÖ
  \noindent
  \leavevmode
  \begingroup
  \bfseries
  #2\quad
  \endgroup\goodbreak 
  \vskip -6pt\nobreak  		% Added for spacing after the section title - SBÖ
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
\def\@chapter[#1]#2{\BolumSagdaKalsinNolu
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
\def\@eklerkapak[#1]#2{\BolumSagdaKalsinNolu
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
                    \chaptermark{\EklerinBasligi}%
                    %LoT ve LoF da bölümler arası geçişde bir boşluk bırakılacaksa...
                    %\addtocontents{lof}{\protect\addvspace{10\p@}}
                   \if@twocolumn
                     \@topnewpage[\@makechapterheadEK{\EklerinBasligi}]
                   \else
                     \@makechapterheadEK{\EklerinBasligi}
                     \@afterheading
                   \fi
}

%==================================== CHAPTER TITLE SETTINGS ==========================================
\def\@makechapterhead#1{
    \vspace*{\ChapterUstenBosluk}					% That is strange; there is spacing even if it is empty - SBÖ
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

%======================================== EK TITLE SETTINGS ===========================================
%%EK BÖLÜMÜNDE BÖLÜM NUMARASI OLMASIN DİYE
\def\@makechapterheadEK#1{
    \vspace*{\ChapterUstenBosluk}					% That is strange; there is spacing even if it is empty - SBÖ
    {\parindent \z@ \raggedright
    \normalfont
    \ifnum \c@secnumdepth >\m@ne
         \th@HdFnt\th@ScSz #1
     \fi
    \interlinepenalty\@M
    \th@HdFnt\th@ScSz \par\nobreak
    \vskip 18\p@ 									% This is the Appendices 18 pt spacing after the title - SBÖ
  }}


\def\@schapter#1{\BolumSagdaKalsinNolu
    \@makeschapterhead{#1}
    \@afterheading
    }

%======================================== DIŞ KAPAK SETTINGS ========================================== - SBÖ
\newcommand*{\th@DisKapak}{					% Remodified for better vertical spacing - SBÖ
	%\BolumSagdaKalsin % This is the trick that allow us to remove first couple of empty pages generated unwantedly - SBÖ
	\thispagestyle{empty}
    \if@FenBilimleri
    \begin{textblock*}{\textwidth}[0,0](37.5mm,30.5mm)
    \fi
    \if@Bilisim	
    \begin{textblock*}{\textwidth}[0,0](40mm,30.5mm)
    \fi
    \if@SosyalBilimler
    \begin{textblock*}{\textwidth}[0,0](36mm,30.5mm)
    \fi
    \if@Avrasya
    \begin{textblock*}{\textwidth}[0,0](40mm,30.5mm)
    \fi
    	\singlespacing  					% For single spacing in the top portion of kapak - SBÖ
    	\renewcommand{\ULdepth}{2.75pt} 	% Added using ulem package for \uline command - SBÖ
    	\renewcommand{\ULthickness}{1.5pt} 	% Added for underline tickness change which was 0.4pt - SBÖ
    	\centering
    	\uline{{\bf\th@EnstituUpper}}\\ 	% Instead of \underline{text} - SBÖ
	\end{textblock*}

    \begin{textblock*}{\textwidth}[0,0](40mm,35.5mm)
	    \renewcommand{\ULdepth}{2.75pt} 	% Added using ulem package for \uline command - SBÖ
	    \renewcommand{\ULthickness}{1.5pt} 	% Added for underline tickness change which was 0.4pt - SBÖ
	    \centering
	    \uline{\MakeUppercase{\bf\th@Instituteiki}}\\ % FBE ingilizce yeni baslik icin
    \end{textblock*}
    
	\begin{textblock*}{\textwidth}[0,0](40mm,80.5mm)
		\centering
		\th@titleFtSz\Baslikspacing \Baslikbir \\
        \th@titleFtSz\Baslikspacing \Baslikiki \\
        \th@titleFtSz\Baslikspacing \Baslikuc \\
	\end{textblock*}

	\begin{textblock*}{\textwidth}[0,0](40mm,150mm)
	    \centering
	    \th@titleFtSz \TezSeviyesi  \\
	\end{textblock*}

	\begin{textblock*}{\textwidth}[0,0](40mm,160mm)
	    \centering
        \th@titleFtSz \th@isimsoyisim  \\
    \end{textblock*}

	\begin{textblock*}{\textwidth}[0,0](40mm,200mm)
	   \centering
	   \th@titleAnaBilimDaliFtSz \Anabilim\\
    \end{textblock*}
 
 	\begin{textblock*}{\textwidth}[0,0](40mm,210mm)
 	   \centering
 	   \th@titleAnaBilimDaliFtSz \Program \\
    \end{textblock*}

	\begin{textblock*}{\textwidth}[0,0](40mm,260mm)
	   \centering
       \th@titleFtSz \TarihBuyuk \\
    \end{textblock*}

\vspace*{\fill}
}

%======================================== İÇ KAPAK SETTINGS =========================================== - SBÖ
\newcommand*{\th@IcKapak}{					% Remodified for better vertical spacing - SBÖ
	\BolumSagdaKalsin
	\thispagestyle{empty}
    \if@FenBilimleri
    \begin{textblock*}{\textwidth}[0,0](37.5mm,30.5mm)
	\fi
	\if@Bilisim	
	\begin{textblock*}{\textwidth}[0,0](40mm,30.5mm)
	\fi
	\if@SosyalBilimler
	\begin{textblock*}{\textwidth}[0,0](36mm,30.5mm)
    \fi
    \if@Avrasya
    \begin{textblock*}{\textwidth}[0,0](40mm,30.5mm)
    \fi
		\singlespacing  					% For single spacing in the top portion of kapak - SBÖ
		\renewcommand{\ULdepth}{2.75pt} 	% Added using ulem package for \uline command - SBÖ
		\renewcommand{\ULthickness}{1.5pt} 	% Added for underline tickness change which was 0.4pt - SBÖ
		\centering
		\uline{{\bf\th@EnstituUpper}}\\ %Instead of \underline{text} - SBÖ
	\end{textblock*}
		
	\begin{textblock*}{\textwidth}[0,0](40mm,35.5mm)
		\renewcommand{\ULdepth}{2.75pt} 	% Added using ulem package for \uline command - SBÖ
		\renewcommand{\ULthickness}{1.5pt} 	% Added for underline tickness change which was 0.4pt - SBÖ
		\centering
		\uline{\MakeUppercase{\bf\th@Instituteiki}}\\ % FBE ingilizce yeni baslik icin
	\end{textblock*}
      
	\begin{textblock*}{\textwidth}[0,0](40mm,80.5mm)
		\centering
		\th@titleFtSz\Baslikspacing \Baslikbir \\
		\th@titleFtSz\Baslikspacing \Baslikiki \\
		\th@titleFtSz\Baslikspacing \Baslikuc \\
	\end{textblock*}
	
	\begin{textblock*}{\textwidth}[0,0](40mm,150mm)
		\centering
		\th@titleFtSz \TezSeviyesi  \\
	\end{textblock*}
	
	\begin{textblock*}{\textwidth}[0,0](40mm,160mm)
		\centering
		\th@titleFtSz \th@isimsoyisim  \\
		\th@titleFtSz (\th@ogrencino) \\
	\end{textblock*}
	
	\begin{textblock*}{\textwidth}[0,0](40mm,200mm)
		\centering
		\th@titleAnaBilimDaliFtSz \Anabilim\\
	\end{textblock*}
	
	\begin{textblock*}{\textwidth}[0,0](40mm,210mm)
		\centering
		\th@titleAnaBilimDaliFtSz \Program \\
	\end{textblock*}
	
    \begin{textblock*}{\textwidth}[0,0](40mm,230mm)
	    \centering
        \th@titleFtSz\DanismanBaslik : \th@titleFtSz \th@TezYoneticisi \\
        %\ifthenelse{\equal{\th@esdanisman}{}}{}{ \bf{Thesis Co-Advisor:} \bf{\th@esdanisman} \\}
	\end{textblock*}

    \begin{textblock*}{\textwidth}[0,0](40mm,235mm)
	    \centering
	    %\th@titleFtSz\DanismanBaslik : \th@titleFtSz \th@TezYoneticisi \\
	    \ifthenelse{\equal{\th@esdanisman}{}}{}{ \bf{Thesis Co-Advisor:} \bf{\th@esdanisman} \\}
    \end{textblock*}
	
	\begin{textblock*}{\textwidth}[0,0](40mm,260mm)
		\centering
		\th@titleFtSz \TarihBuyuk \\
	\end{textblock*}
	
	\vspace*{\fill}
}

%===================================== TÜRKÇE İÇ KAPAK SETTINGS ======================================= - SBÖ
\newcommand*{\th@IcKapakTurkce}{ 			% Remodified for better vertical spacing - SBÖ
	\BolumSagdaKalsin
	\thispagestyle{empty}
	\if@Avrasya
	\begin{textblock*}{\textwidth}[0,0](35mm,30.5mm)
	\else
	\begin{textblock*}{\textwidth}[0,0](40mm,30.5mm)
	\fi
		\singlespacing  					% For single spacing in the top portion of kapak - SBÖ
		\renewcommand{\ULdepth}{2.75pt} 	% Added using ulem package for \uline command - SBÖ
		\renewcommand{\ULthickness}{1.5pt} 	% Added for underline tickness change which was 0.4pt - SBÖ
		\centering
		\uline{{\bf\th@EnstituUpperTR}}\\ 	% Instead of \underline{text} - SBÖ
	\end{textblock*}
	
	\begin{textblock*}{\textwidth}[0,0](40mm,80.5mm)
		\centering
        \th@titleFtSz\Baslikspacing \th@baslikbir \\
		\th@titleFtSz\Baslikspacing \th@baslikiki \\
		\th@titleFtSz\Baslikspacing \th@baslikuc \\
	\end{textblock*}
	
	\begin{textblock*}{\textwidth}[0,0](40mm,150mm)
		\centering
		\th@titleFtSz \TezSeviyesiTR  \\
	\end{textblock*}
	
	\begin{textblock*}{\textwidth}[0,0](40mm,160mm)
		\centering
		\th@titleFtSz \th@isimsoyisim  \\
		\th@titleFtSz (\th@ogrencino) \\
	\end{textblock*}
	
	\begin{textblock*}{\textwidth}[0,0](40mm,200mm)
		\centering
		\th@titleAnaBilimDaliFtSz \th@AnaBilimDali \\
	\end{textblock*}
	
	\begin{textblock*}{\textwidth}[0,0](40mm,210mm)
		\centering
		\th@titleAnaBilimDaliFtSz \th@Programi \\
	\end{textblock*}
	
	\begin{textblock*}{\textwidth}[0,0](40mm,230mm)
		\centering
		\th@titleFtSz {Tez Dan{\i}\c{s}man{\i}}: \th@titleFtSz \th@TezYoneticisi \\
		%\ifthenelse{\equal{\th@esdanisman}{}}{}{ \bf{(Varsa) E\c{s} Dan\i \c{s}man:} \bf{\th@esdanisman} \\}
	\end{textblock*}
	
	\begin{textblock*}{\textwidth}[0,0](40mm,235mm)
		\centering
		%\th@titleFtSz {Tez Dan{\i}\c{s}man{\i}}: \th@titleFtSz \th@TezYoneticisi \\
		\ifthenelse{\equal{\th@esdanisman}{}}{}{ \bf{(Varsa) E\c{s} Dan\i \c{s}man:} \bf{\th@esdanisman} \\}
	\end{textblock*}
	
	\begin{textblock*}{\textwidth}[0,0](40mm,260mm)
		\centering
		\th@titleFtSz \TarihBuyukTR \\ 		% Made Uppercase Turkish Month and Year
	\end{textblock*}
	
	\vspace*{\fill}
}

%========================================= ONAY PAGE SETTINGS ========================================= - SBÖ
\newcommand{\th@onaypage}{					% onaypage is modified to match with word template as much as possible - SBÖ	
	\BolumSagdaKalsin
	\hyphenpenalty=100
	\singlespacing
	\if@Ingilizce 			
	\begin{textblock*}{\textwidth}[0,0](40mm,50.5mm)
	{\bf\th@isimsoyisim}, {\bf a} \if@Doktora {\bf Ph.D.}\ \fi  \if@YuksekLisans  {\bf M.Sc.}\ \fi \if@Lisans {\bf B.Sc.}\ \fi student of
	ITU~\if@YuksekLisans {\bf\th@Institute~\th@Instituteiki\ \fi \if@Doktora \th@Institute~\th@Instituteiki\ \fi \if@Lisans \if@ElektrikElektronik \th@Institute~\th@Instituteiki \fi \fi}student ID \th@ogrencino,\ successfully defended the {\bf\if@Lisans graduation project\ \fi \if@YuksekLisans thesis\ \fi \if@Doktora dissertation\ \fi}entitled {``{\bf\Baslikbir\ifthenelse{\equal{\Baslikiki}{}}{}{
	\Baslikiki\ifthenelse{\equal{\Baslikuc}{}}{}{\
	\Baslikuc}}}''}, which he/she prepared after fulfilling the
	requirements specified in the associated legislations,
	before the jury whose signatures are below.
    \end{textblock*}
 
\begin{textblock*}{\textwidth}[0,0](40mm,100.5mm)
	\begin{tabular}{@{}p{33mm} l l}
		\bf{Thesis Advisor :}& \bf{\th@TezYoneticisi} & 
		\hspace*{44pt}\hfill.............................. \\		% Matching to the word template - SBÖ
		& \th@TezYoneticisiUniv  &  \\
		\ifthenelse{\equal{\th@esdanisman}{}}{}{   &  &  \\
			&  &  \\
			\bf{Co-advisor :}& \bf{\th@esdanisman} & 
			\hspace*{44pt}\hfill.............................. \\	% Matching to the word template - SBÖ
			& \th@esdanismanuniv  &  \\}
		&  &  \\
		&  &  \\
		\bf{Jury Members :}& \bf{\th@juribir} & 
		\hspace*{44pt}\hfill.............................. \\		% Matching to the word template - SBÖ
		& \th@juribiruniv  &  \\
		&  &  \\
		&  &  \\
		& \bf{\th@juriiki} & 
		\hspace*{44pt}\hfill.............................. \\		% Matching to the word template - SBÖ
		& \th@juriikiuniv  &  \\
		&  &  \\
		&  &  \\
		& \bf{\th@juriuc} & 
		\hspace*{44pt}\hfill.............................. \\		% Matching to the word template - SBÖ
		& \th@juriucuniv  &  \\
		&  &  \\
		&  &  \\
		\ifthenelse{\equal{\th@juridort}{}}{}{ & 
			\bf{\th@juridort} & 
			\hspace*{44pt}\hfill.............................. \\	% Matching to the word template - SBÖ
			& \th@juridortuniv  &  \\}
		&  &  \\
		&  &  \\
		\ifthenelse{\equal{\th@juribes}{}}{}{ & \bf{\th@juribes} & 
			\hspace*{44pt}\hfill.............................. \\	% Matching to the word template - SBÖ
			& \th@juribesuniv  &  \\}
		&  &  \\
		&  &  \\
	\end{tabular}
\end{textblock*}
	

\begin{textblock*}{\textwidth}[0,0](40mm,260mm)
	\begin{tabular}{@{}l l}
		\bf{Date of Submission~~:} &\hspace*{-10pt}\hfill\bf{\th@submissiondate}  \\
		\bf{Date of Defense\hspace*{25pt}\hfill:} &\hspace*{-10pt}\hfill\bf{\th@defencedate}  \\
	\end{tabular}
\end{textblock*}

	\else
	
\begin{textblock*}{\textwidth}[0,0](40mm,50.5mm)
	\.IT\"U, \th@Enstitu'n\"un \th@ogrencino\ numaral{\i} \if@Doktora Doktora\ \fi 
	\if@YuksekLisans Y\"uksek Lisans\ \fi \if@Lisans Lisans\ \fi\ \"O\u{g}rencisi 
	{\th@isimsoyisim}, ilgili 
	y\"onetmeliklerin belirledi\u{g}i gerekli t\"um \c{s}artlar{\i} yerine getirdikten
	sonra haz{\i}rlad{\i}\u{g}{\i} 
	{``\Baslikbir\ifthenelse{\equal{\Baslikiki}{}}{}{   
	\Baslikiki\ifthenelse{\equal{\Baslikuc}{}}{}{\ 
	\Baslikuc}}''}
	ba\c{s}\-l\i k\-l{\i}
	tezini a\c{s}a\u{g}\i daki imzalar{\i} olan j\"uri \"on\"unde
	ba\c{s}ar{\i} ile sunmu\c{s}tur.
\end{textblock*}

\begin{textblock*}{\textwidth}[0,0](40mm,100.5mm)
	\begin{tabular}{@{}p{33mm} l l}
		\bf{Tez Dan\i \c{s}man{\i} :}& \bf{\th@TezYoneticisi} & 
		.............................. \\
		& \th@TezYoneticisiUniv  &  \\
		\ifthenelse{\equal{\th@esdanisman}{}}{}{   &  &  \\
			&  &  \\
			\bf{E\c{s} Dan\i \c{s}man :}& \bf{\th@esdanisman} & 
			.............................. \\
			& \th@esdanismanuniv  &  \\}
		&  &  \\
		&  &  \\
		\bf{J\"uri \"Uyeleri :}& \bf{\th@juribir} & 
		.............................. \\
		& \th@juribiruniv  &  \\
		&  &  \\
		&  &  \\
		& \bf{\th@juriiki} & 
		.............................. \\
		& \th@juriikiuniv  &  \\
		&  &  \\
		&  &  \\
		& \bf{\th@juriuc} & 
		.............................. \\
		& \th@juriucuniv  &  \\
		&  &  \\
		&  &  \\
		\ifthenelse{\equal{\th@juridort}{}}{}{ & 
			\bf{\th@juridort} & 
			.............................. \\
			& \th@juridortuniv  &  \\}
		&  &  \\
		&  &  \\
		\ifthenelse{\equal{\th@juribes}{}}{}{ & \bf{\th@juribes} 
			& 
			.............................. \\
			& \th@juribesuniv  &  \\}
		&  &  \\
		&  &  \\
	\end{tabular}
\end{textblock*}	

\begin{textblock*}{\textwidth}[0,0](40mm,260mm)
	\begin{tabular}{@{}l l}
		\bf{Teslim Tarihi~~:} & \bf{\th@tezvermetarih}  \\
		\bf{Savunma Tarihi\hspace*{25pt}\hfill:} & \bf{\th@tezsavunmatarih}  \\
	\end{tabular}
\end{textblock*}
	\fi
	\sloppy 
	\vspace*{\fill}
}

%======================================== İTHAF PAGE SETTINGS ========================================= - SBÖ
\newcommand*{\th@IthafSayfasi}{
    \BolumSagdaKalsinNolu 			% Change this to without Nolu shifts the margins down for some reason - SBÖ
    \setlength{\voffset}{-5mm}      % Strange that it is needed to make it page num. 1.5cm from bottom for the rest - SBÖ
	\vspace*{0.3\textheight}
    \begin{flushright}
	\textbf{\emph{\th@Ithaf}}
    \end{flushright}
}

%======================================== ÖNSÖZ PAGE SETTINGS ========================================= - SBÖ
\newcommand{\th@Onsoz}{
    \BolumSagdaKalsinNolu
    \singlespacing
    \hyphenpenalty=5000
    \vspace*{\UstenBosluk}
    \begin{list}{}{\setlength{\leftmargin}{0cm}\setlength{\rightmargin}{0cm}}
    \item[]
    \th@ChapterStyle\prefacename\\
    \end{list}
    \sloppy
    \th@tesekkurStash   % the actual tesekkur
    \vspace{30pt} \\
    \TarihKucuk \hfill \th@isimsoyisim
    
    \vspace*{-2.54mm} \hfill \th@Unvan\\
    \addcontentsline{toc}{part}{\bf{\protect\onsoznameToC}}
}

%======================================== ÖZET PAGE SETTINGS ========================================== - SBÖ
\newcommand{\th@ozetpage}{
    \BolumSagdaKalsinNolu
    \addcontentsline{toc}{part}{\bf{\protect\ozetnameToC}}
    \vspace*{\UstenBosluk}
       \begin{center}
        \begin{tabular}{c}
         \th@titleFtSz\Baslikspacing \th@baslikbir \\
         \th@titleFtSz\Baslikspacing \th@baslikiki \\
         \th@titleFtSz\Baslikspacing \th@baslikuc \\
             \vspace*{6pt}\\
         \th@titleFtSz\abstractname\ \\
             %\\
        \end{tabular}
       \end{center}
%   \begin{list}{}{\setlength{\leftmargin}{0cm}\setlength{\rightmargin}{0cm}}
%   \item[]
%   \th@ChapterStyle \th@baslikbir\ \th@baslikiki\ \th@baslikuc  \\
%   \vspace*{10pt}\\
%   \th@ChapterStyle \abstractname\ \\
%   \end{list}
    \singlespacing
    \vspace*{6pt}
    \sloppy
    \th@ozetStash   % the actual ozet
}

%======================================= SUMMARY PAGE SETTINGS ======================================== - SBÖ
\newcommand{\th@Summarypage}{
    \BolumSagdaKalsinNolu
    \addcontentsline{toc}{part}{\bf{\protect\abstractnameToC}}
    \vspace*{\UstenBosluk}
       \begin{center}
        \begin{tabular}{c}
         \th@titleFtSz\Baslikspacing \th@Titlebir \\
         \th@titleFtSz\Baslikspacing \th@Titleiki \\
         \th@titleFtSz\Baslikspacing \th@Titleuc \\
              \vspace*{6pt}\\
         \th@titleFtSz\summaryname\ \\
              %\\
        \end{tabular}
       \end{center}
    \singlespacing
    \vspace*{6pt}
    \sloppy
    \th@abstractStash   % the actual abstract
}

%====================================== ÖZGEÇMİŞ PAGE SETTINGS ======================================== - SBÖ
\newcommand{\th@ozgecmispage}{
    \BolumSagdaKalsinNolu
    \vspace*{\UstenBosluk}
    \begin{list}{}{\setlength{\leftmargin}{0cm}\setlength{\rightmargin}{0cm}}
    \item[]
    \th@ChapterStyle\ozgecmisname\\
    \addtocontents{toc}{\protect\addvspace{-10\p@}} % For propoer page numbering in TOC, this is placed here - SBÖ
    \addcontentsline{toc}{chapter}{\bf{\protect\ozgecmisnameToC}}% For propoer page num. in TOC, this is placed here - SBÖ
    \end{list}
	\singlespacing
    \sloppy
    \th@ozgecmisStash   % the actual ozgecmis
}

%======================================== TOC PAGE SETTINGS =========================================== - SBÖ
\renewcommand\tableofcontents{
    %\vspace*{\ChapterUstenBosluk} 				% This is not effective - SBÖ
    {\chapter*{\contentsname}\addcontentsline{toc}{part}{\bf{\protect\contentsnameToC}}%
    \vspace*{-18pt}
    \renewcommand{\ULdepth}{4pt} % Added using ulem package for \uline command - SBÖ
    \renewcommand{\ULthickness}{1.5pt} % Added for underline tickness change which was 0.4pt default - SBÖ
    \if@Ingilizce\hfill\vspace*{0truecm}{\bf\uline{Page}}~\else~\hfill\vspace*{0truecm}{\bf\uline{Sayfa}}\fi}\\ %Instead of \underline{text} - SBÖ
    %\hfill\vspace*{0.5truecm}{\bf\underline{\if@Ingilizce Page\else Sayfa\fi}}} % Removed by SBÖ

    \let\orig@numberline\numberline
    \@mkboth{\MakeUppercase\listtablename}{\MakeUppercase\listtablename}
    \newlength{\th@oldparskip}
    \setlength{\th@oldparskip}{\parskip}
    \setlength{\parskip}{\ToCparskip}
    \@starttoc{toc}
    \setlength{\parskip}{\th@oldparskip}
    }

%======================================= ABBR. PAGE SETTINGS ========================================== - SBÖ
\newcommand\kisaltmalist{
    %\vspace*{\ChapterUstenBosluk} 				% This is not effective - SBÖ
    \chapter*{\kisaltmaname\@mkboth{\MakeUppercase\kisaltmaname}{\MakeUppercase\kisaltmaname}}
    \addcontentsline{toc}{part}{\bf{\protect\kisaltmanameToC}}
    \vspace*{-18pt}
    \th@kisaltmalistStash}

%====================================== SYMBOLS PAGE SETTINGS ========================================= - SBÖ     
\newcommand\symbollist{
    %\vspace*{\ChapterUstenBosluk} 				% This is not effective - SBÖ
    \chapter*{\symbolname\@mkboth{\MakeUppercase\symbolname}{\MakeUppercase\symbolname}}
    \addcontentsline{toc}{part}{\bf{\protect\symbolnameToC}}
    \vspace*{-18pt}
    \th@symbollistStash
    }

%======================================== LOT PAGE SETTINGS =========================================== - SBÖ
\renewcommand\listoftables{
    %\vspace*{\ChapterUstenBosluk} 				% This is not effective - SBÖ   
    {\chapter*{\listtablename}
    \vspace*{-18pt}
    \renewcommand{\ULdepth}{4pt} 				% Added using ulem package for \uline command - SBÖ
    \renewcommand{\ULthickness}{1.5pt} 			% Added for underline tickness change which was 0.4pt - SBÖ
    \if@Ingilizce\hfill\vspace*{0truecm}{\bf\uline{Page}}~\else~\hfill\vspace*{0truecm}{\bf\uline{Sayfa}}\fi}\\ % Instead of \underline{text} - SBÖ
    %\hfill\vspace*{0.5truecm}{\bf\underline{\if@Ingilizce Page\else Sayfa\fi}}} % Removed - SBÖ

    \let\orig@numberline\numberline   
    \@mkboth{\MakeUppercase\listtablename}{\MakeUppercase\listtablename}
    \renewcommand*{\numberline}[1]{
    \orig@numberline{\bf\tablename\ ##1}\hspace{-8pt}{\bf:}\hspace{4pt}} % Better spacing - SBÖ
    \addcontentsline{toc}{part}{\bf{\protect\listtablenameToC}}
    \setlength{\th@oldparskip}{\parskip}
    \setlength{\parskip}{\LoTparskip}
    \@starttoc{lot}
    \setlength{\parskip}{\th@oldparskip}
    \let\numberline\orig@numberline
    }

%======================================== LOF PAGE SETTINGS =========================================== - SBÖ  
\renewcommand\listoffigures{
    %\vspace*{\ChapterUstenBosluk} 				% This is not effective - SBÖ
    {\chapter*{\listfigurename}
    \vspace*{-18pt}
    \renewcommand{\ULdepth}{4pt} 				% Added using ulem package for \uline command - SBÖ
    \renewcommand{\ULthickness}{1.5pt} 			% Added for underline tickness change which was 0.4pt - SBÖ
    \if@Ingilizce\hfill\vspace*{0truecm}{\bf\uline{Page}}~\else~\hfill\vspace*{0truecm}{\bf\uline{Sayfa}}\fi}\\ % Instead of \underline{text} - SBÖ
    %\hfill\vspace*{0.5truecm}{\bf\underline{\if@Ingilizce Page\else Sayfa\fi}}}

    \let\orig@numberline\numberline
    \@mkboth{\MakeUppercase\listfigurename}{\MakeUppercase\listfigurename}
    \renewcommand*{\numberline}[1]{
    \orig@numberline{\bf\figurename\ ##1}\hspace{-8pt}{\bf:}\hspace{4pt}} % Better spacing - SBÖ
    \addcontentsline{toc}{part}{\bf{\protect\listfigurenameToC}}
    \setlength{\th@oldparskip}{\parskip}
    \setlength{\parskip}{\LoFparskip}
    \@starttoc{lof}
    \setlength{\parskip}{\th@oldparskip}
    \let\numberline\orig@numberline
    }

%===================================== APPENDICES PAGE SETTINGS ======================================= - SBÖ
\newcommand{\eklerbolum}[1]{\par
    \newpage
    \singlespacing
    \setcounter{chapter}{#1}
    \setcounter{section}{0}
	%\renewcommand{\theequation}{{\bf A.\arabic{equation}}} 			% Removed - SBÖ
	\renewcommand{\theequation}{{\bf \thechapter.\arabic{equation}}}
	\setcounter{equation}{0}
    %\renewcommand\@chapapp{\appendixname}
    
    \renewcommand\thechapter{\@Alph\c@chapter} 						
    %\renewcommand{\thechapter}{\@Alph\c@chapter.\arabic{chapter}}
    %\renewcommand{\thesection}{A.\arabic{section}}
    
    %\addtocontents{toc}{\protect\addvspace{-10\p@}}
    %\addcontentsline{toc}{chapter}{\bf{\protect\appendixnameToC}}
    \global \@appendixtrue
    }

%==================================== BIBLIOGRAPHY PAGE SETTINGS ====================================== - SBÖ
\renewcommand{\@biblabel}[1]{#1}
\renewenvironment{thebibliography}[1]{%\singlespacing
    %\vspace*{\ChapterUstenBosluk} 				% This is not effective - SBÖ
    \chapter*{\bibname}
    \vspace*{-18pt} 							% Better spacing from the Reference title at start-up - SBÖ
    \singlespacing
    \addtocontents{toc}{\protect\addvspace{-10\p@}}
    \addcontentsline{toc}{chapter}{\bf{\protect\bibnameToC}}
    \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}
    \list{\@biblabel{[\@arabic\c@enumiv]}}
         {\settowidth\labelwidth{\@biblabel{999}}
          \leftmargin\labelwidth
          \advance\leftmargin\labelsep
          \setlength{\leftmargin}{-\leftmargin}
          \advance\leftmargin by 31.8mm 					% Adjusted - SBÖ
          \setlength{\itemindent}{-15.25mm}					% Adjusted - SBÖ
  %       \setlength{\listparindent}{-20mm}
          \@openbib@code
          \usecounter{enumiv}
          \let\p@enumiv\@empty
          \renewcommand\theenumiv{\@arabic\c@enumiv}}
    \sloppy
    \clubpenalty4000
    \@clubpenalty \clubpenalty
    \widowpenalty4000
    \sfcode`\.\@m
    }
    {\def\@noitemerr
      {\@latex@warning{Empty `thebibliography' environment}}
    \endlist}

%========================================= ALL PAGES CALLED =========================================== - SBÖ
\newcommand{\th@MakeThesisPrologue}{
    \thispagestyle{empty}
    \fontfamily{ptm}
    \selectfont
    \th@Kapak
    \fontfamily{cmr}
    \selectfont
    \pagenumbering{roman}								
    \renewcommand*{\thepage}{\small{\roman{page}}}  	% Page number font size set to 11 pt for roman pages - SBÖ
%   \setcounter{page}{\if@Bez 3\else 1\fi}%{\if@Ingilizce\if@Bez 3\else 1\fi\else 1\fi}
    \setcounter{page}{\if@Ingilizce \if@Onluarkali 5 \else 3 \fi \else 
       \if@Onluarkali 3 \else 2 \fi \fi}
    \singlespacing
	\renewcommand{\ttdefault}{pcr}   % MS Times fontu için
	\normalfont\selectfont	      	 % MS Times fontu için

    \ifthenelse{\equal{\th@Ithaf}{}}{}{\th@IthafSayfasi} 

        \if@TesekkurVar
	\th@Onsoz
        \fi
        \ToCspacing
        \tableofcontents
        \if@KisaltmaListesiVar
	\kisaltmalist
        \fi
        \if@SembolListesiVar
	\symbollist
        \fi
        \if@TabloListesiVar
	\LoTspacing
	\listoftables
        \fi
        \if@SekilListesiVar
	\LoFspacing
	\listoffigures
        \fi
    \if@Ingilizce
      \th@Summarypage
        \th@ozetpage
	      \else
	    \th@ozetpage		% Turkish thesis order - SBÖ
	  \th@Summarypage
	\fi
     %\newpage				% Seems like no need (it is defined below) - SBÖ
	\BolumSagdaKalsinNolu
    \oneandonehalf
     }

\let\th@OldBeginDocument\document
\renewcommand*{\document}{
    \th@OldBeginDocument
    \th@MakeThesisPrologue
    %\oneandonehalf          % Seems like no need that (it is defined above) - SBÖ
    \pagenumbering{arabic}
    \renewcommand*{\thepage}{\small{\arabic{page}}} % Page number font size set to 11 pt = small - SBÖ
}

\endinput

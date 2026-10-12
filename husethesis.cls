\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{husethesis}[2026/10/12 Hunan University of Science and Engineering thesis class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexart}}
\ProcessOptions\relax
\LoadClass[a4paper,zihao=-4,oneside,scheme=plain,fontset=none]{ctexart}
\RequirePackage{husestyle}
\endinput

# Configure latexmk to build with XeLaTeX and BibTeX (compatible with Overleaf and local MiKTeX)
$pdf_mode = 5;
$bibtex_use = 2;
$xelatex = 'xelatex -interaction=nonstopmode -synctex=1 %O %S';

# survey-reporting
a rmarkdown to generate automatic survey data reporting. 


## Starting with Docker

1. Start with Steps 1-2 above
2. Build Docker container: `docker-compose.exe build`
3. Start Docker container `docker-compose.exe up`
4. Open Jupyter Lab notebook by typing `localhost:8888/lab/` in the browser. RStudio is avaliable at port `8787`.


## Overview

This  folder repository contains tools and templates for creating Caltrans Styled PDF or HTML factsheets in [R Markdown](https://rmarkdown.rstudio.com/). Despite the RMarkdown filename, you can use this to create reports with Python, R, and Julia code. 

We borrow heavily from the Urban Insitute guide and repo. For more information, read [Iterated fact sheets with R Markdown](https://medium.com/@urban_institute/iterated-fact-sheets-with-r-markdown-d685eb4eafce) and [Iterated PDFs with R Markdown](https://medium.com/@urban_institute/iterated-pdfs-with-r-markdown-144e2a6d6a1a).

## Getting started

### LaTeX distribution

Creating PDFs with R Markdown requires a [LaTeX](https://www.latex-project.org/about/) distribution. In the past, this too often meant installing and maintaining the large and clunky MiKTeX. Fortunately, Yihui Xie created TinTeX, a custom LaTeX distribution based on TeX Live that is lightweight and can be managed in R.

Submit the following code in R to install TinyTex ([full instructions here](https://yihui.name/tinytex/)):

```
  install.packages(c("tinytex", "rmarkdown"))
tinytex::install_tinytex()
  ```
  **Note:** If you installed MiKTeX in the past, uninstall it before installing TinyTex. 

## Use

  `preamble.tex` contain settings and code to put R Markdown PDFs into the City of LA factsheet title.

  * To build the report in an Rstudio session, open `report.Rmd` and click "knit". 
  * To build the report from the command line, run `make report` 

  If you a building an iterated report (ie, multiple sheets per LA City neighborhood), use the included `iterate.R`. 
  
## Iteration

  The template (for example, simple-factsheet.Rmd) is iterated with the `iterate.R` script. 

  `iterate.R` takes an index, creates a data frame with outfile names and parameters, and iterates the template across each row of the data frame. 


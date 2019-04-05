# beamermq: Macquarie University PDF presentations built from RMarkdown

Rmarkdown Beamer template for Department of Mathematics and Statistics at Macquarie University. Allows quick creation of PDF beamer presentations using the Macquarie branding template. Beamer is superior to MS Office applications for typesetting mathematical or other scientific content since it uses LaTeX as a backend to typeset the output. This allows quick and University branded presentations to be created for conference presentations/meetings or lecture delivery.

### Installation

The user is expected (but not required) to install via Rstudio since the interface helps facilitate quick creation of content. This is achieved with the following command

`devtools::install_github('jrwishart/beamermq')`

A TeX distribution is required to compile the beamer output. This has been tested on TeXlive but should work on MacTeX (based on TeXlive) and should work on MikTeX and other commonly supported tex distributions.

### File creation

Then the user can create a presentation file from the template in RStudio using the menu 

` File > New File > Rmarkdown > From Template > beamermq`

and then select the desired location to make the files. This will by default download the associated graphics files and copy them to your prespecified directory.

Alternatively, if one doesn't want to download all the graphics files for one can download the tar file of all the graphics files and extract to a localtexmf directory so that pdflatex can locate the files during compilation. Then a flag in the yaml header is set to prevent the automatic copy of graphics (see below)

### Example Rmarkdown file

```

---
title: "MATH/STATxxx: A great course or (My great Research Presentation)"
subtitle: "Topic/Week x: A great topic/week of material (or Special Session on great maths held at  good conference, great city, great country)"
date: "Semester 1, 20xx (or some date for a conf presentation)"
fontsize: 10pt
classoption: "aspectratio=169"
output: 
  beamermq::macquarie:
     keep_tex: yes
     toc: no
     # Change texmflocal to yes if you install the template files into your local tex installation.
     texmflocal: no
bibliography: references.bib
---

\`\`\`{r setup, include=FALSE}
knitr::opts_chunk$set(echo = FALSE, message=FALSE, warning=FALSE, cache=TRUE)
\`\`\`

# Intro

## Slide with bullets

- Bullet 1
- Bullet 2
- Bullet 3

```

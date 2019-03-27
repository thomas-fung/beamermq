##' Templates for RMarkdown-based Beamer PDF presentations inspired by
##' the \sQuote{binb} package of Dirk Eddelbuettel and Ista Zahn and
##' Rob Hyndman.
##'##'
##' @title Beamer MQ - PDF Presentation Theme for Macquarie University
##'
##' @param toc A logical variable defaulting to \code{FALSE}.
##' @param slide_level A numeric variable defaulting to two.
##' @param incremental A logical variable defaulting to \code{FALSE}.
##' @param fig_width A numeric variable defaulting to ten.
##' @param fig_height A numeric variable defaulting to seven.
##' @param fig_crop A logical variable defaulting to \code{TRUE}.
##' @param fig_caption A logical variable defaulting to \code{TRUE}.
##' @param dev A character variable defaulting to \dQuote{pdf}.
##' @param df_print A character variable defaulting to \dQuote{default}.
##' @param fonttheme A character variable defaulting to \dQuote{default}.
##' @param highlight A character variable defaulting to \dQuote{tango}.
##' @param keep_tex A logical variable defaulting to \code{FALSE}.
##' @param latex_engine A character variable defaulting to \dQuote{pdflatex}.
##' @param citation_package An optional character variable with possible value
##' \dQuote{none}, \dQuote{natbib} (the default), or \dQuote{biblatex}.
##' @param includes An optional character variable defaulting to \code{NULL}.
##' @param md_extensions An optional character variable defaulting to \code{NULL}.
##' @param pandoc_args An optional character variable defaulting to \code{NULL}.
##' @param texmflocal A logical variable defaulting to \code{FALSE} if the user
##' has the required files available locally in their TeX installation.
##'
##' @section macquarie details: We currently set \code{slide_level} to two and
##' use slide level three as a block environment for Theorems or other definitions
##' This means section use one hash mark, new slides use two, and \dQuote{box/block}
##' environments start with three.
##'
##' @return RMarkdown content processed is returned for use by the
##' \code{\link[rmarkdown]{render}} function but the function is invoked
##' for it side effect of creating the pdf file.
##'
##' @author Justin Wishart
##'
##' @examples
##' \dontrun{
##' library(rmarkdown)
##' draft("myslides.Rmd", template="macquarie", package="beamermq", edit=FALSE)
##' setwd("myslides")       ## template creates a new subdir
##' render("myslides.Rmd")
##' }
macquarie <- function(toc = FALSE,
                      slide_level = 2,
                      incremental = FALSE,
                      fig_width = 8,
                      fig_height = 5,
                      fig_crop = TRUE,
                      fig_caption = TRUE,
                      dev = 'pdf',
                      df_print = "default",
                      fonttheme = "default",
                      highlight = "tango",
                      keep_tex = FALSE,
                      latex_engine = "pdflatex",
                      citation_package = c("none", "natbib", "biblatex"),
                      includes = NULL,
                      md_extensions = NULL,
                      pandoc_args = NULL,
                      texmflocal = FALSE) {
  if(!texmflocal) {
    for (f in c("beamercolorthememacquarie.sty", "beamerfontthememacquarie.sty",
                "MQ_INT_HOR_RGB_POS.png", "MQ_MAS_HOR_CMYK_POS.pdf",
                "beamerthememacquarie.sty", "back-title.png", "MQfullMQcolors.pdf",
                "sectionpage.pdf",  "figs/"))
      if (!file.exists(f))
        file.copy(system.file("rmarkdown", "templates", "macquarie", "skeleton",
                              f, package="beamermq"),
                  ".", recursive=TRUE)
  }

  template <- system.file("rmarkdown", "templates", "macquarie",
                          "resources", "template.tex",
                          package = "beamermq")

  rmarkdown::beamer_presentation(template = template,
                                 toc = toc,
                                 slide_level = slide_level,
                                 incremental = incremental,
                                 fig_width = fig_width,
                                 fig_height = fig_height,
                                 fig_crop = fig_crop,
                                 fig_caption = fig_caption,
                                 dev = dev,
                                 df_print = df_print,
                                 theme = "macquarie",
                                 fonttheme = fonttheme,
                                 highlight = highlight,
                                 keep_tex = keep_tex,
                                 latex_engine = latex_engine,
                                 citation_package = citation_package,
                                 includes = includes,
                                 md_extensions = md_extensions,
                                 pandoc_args = pandoc_args)

}


# Call rmarkdown::pdf_documet and mark the return value as inheriting pdf_document
inherit_pdf_document <- function(...) {
  fmt <- rmarkdown::pdf_document(...)
  fmt$inherits <- "pdf_document"
  fmt
}

knitr_fun <- function(name) utils::getFromNamespace(name, 'knitr')

output_asis <- knitr_fun('output_asis')

"
Install and test requisite packages
"

#install directory input
library(devtools)

#=======================      Shiny-directory-input     ==========================#
devtools::install_github('wleepang/shiny-directory-input')
#test it out:
library(shinyDirectoryInput)
shinyDirectoryInput::runDirinputExample()




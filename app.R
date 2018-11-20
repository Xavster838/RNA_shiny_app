"
Shiny App for barcode processing.

Author: Xavi Guitart

Description:
Sequence monkey samples without touching anything
"

library(shiny)
#directory input widget package
library(shinyDirectoryInput)

#===========================      Organization of App     ===========================#

#displaying master data frame column names
masterColNames <- c("core_files",
                    "i5 Primer",
                    "Sibmission Template Discription",
                    "Biological Description",
                    "Monkey",
                    "Lib ID",
                    "Sort Data",
                    "Output Directory"
                    )



#=====================================================================================#


#navbarPage is a function presented by shiny to allow for navigation pages
ui <- navbarPage(

  #Title of app
  title = "Barcode-App",
  #make sure it's fluid so that the tabs and panels all orient correctly
  fluid = T,

  #first tab page: input information
  tabPanel(
    title = "Input",
    #organization: maybe change this to fluidRow...
    sidebarLayout(

      sidebarPanel(
        width = 3,

        #checkbox for previous serialization:
        checkboxInput(inputId = "isSerialization",
                      label = "Working with mid step data?",   #To Do: change the question here...
                      value = F),

        #if working with serialization file then only need to pass that
        conditionalPanel(condition = "input.isSerialization",
                         #text input for serialization file
                         fileInput(inputId = "serialFile", label = "Name of serialization file")
                         ),

        #otherwise need to pass other stuff:
        conditionalPanel(condition = "!(input.isSerialization)",
                         #radio buttons for Single Cell pipeline
                         radioButtons("pipeline",
                                      label = h5("single cell pipeline"),
                                      #To Do: compartmentalize this so it can change easily
                                      choices = list("DropSeq" = 1, "Monocle2" = 2, "Monocle3" = 3, "URD" = 4),
                                      selected = 1
                         ),
                         #species radio buttons
                         radioButtons(inputId = "species",
                                      label = h5("Data Species"),
                                      choices = list("Human" = 1, "Macaque" = 2, "Mouse" = 3),
                                      selected = 1),

                         #text input for experiment name
                         textInput(inputId = "exp.name", label = "Name for Experiment", value = ""),

                         #add base results directory: maybe text but I like choosing a directory more
                         # To Do: make this a smarter check box
                         directoryInput(inputId = "base.results.dir" , label = "Directory for Results", value = ""),

                         #ortholog file name
                         fileInput(inputId = "ortholog.file", label = "ortholog file")
                         )
      ),
      mainPanel(

        #output the name of the directory chosen:
        textOutput(outputId = "selectedDir", )

      )
    )
  ),
  #end of first tab page

  #second tab page
  tabPanel("Log File View...")



)


server = function(input, output){
  #nothing so far
}


shinyApp(ui = ui , server = server)

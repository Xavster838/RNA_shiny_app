"
Helper functions for app:
"

"
getFastQsFromDir

Description: return character vector of Fastq Files given the fastq directory
"
getFastQsFromDir <- function(inputDir){
  #stop if inputDir doesn't exist
  if(!dir.exists(inputDir)){
    stop(paste0("Error in getFastQsFromDir. Dir: ",inputDir, " does not exist." ))
  }
  list.files(path = inputDir)
}


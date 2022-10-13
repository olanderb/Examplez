library(haven)
library(codebook)
library(labelled)
library(tidyverse)
library(sjPlot)
library(DataExplorer)

#1 - import SPSS data
data <- read_sav("1_RawData/exampledataEnglish_raw.sav")

#2 - make data dictionary with sjPlot - there are other packages but they are really slow especially with big datasets - sjPLot is fast
view_df(data)

#3 - How to work with labels with out messing up things ?
#example geographic information where both the value name and the value label are useful
#shows value name
table(data$ADMIN1Name)
str(data$ADMIN1Name)

#to_factor to more easily use labels
data <- to_factor(data)
#see now it displays the value labels
table(data$ADMIN1Name)

#save as sav file
write_sav(data, "3_ProcessedData\\data.sav")

#open up the new file
data1 <- read_sav("3_ProcessedData\\data.sav")

#see ,by converting to factor - i've removed the valuable information in value names
table(data1$ADMIN1Name)

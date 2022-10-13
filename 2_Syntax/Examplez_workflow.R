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
#example livelihood coping strategy
#shows values
table(data$ADMIN1Name)
str(data$ADMIN1Name)

#converts to labels
data <- to_factor(data)
table(data$ADMIN1Name)

#save as sav file
write_sav(data, "3_ProcessedData\\data.sav")

#open up the new file
data1 <- read_sav("3_ProcessedData\\data.sav")

#see ,by converting to factor - i've removed the valuable information in value names
table(data1$ADMIN1Name)

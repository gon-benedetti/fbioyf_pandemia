library(tidyverse)
library("writexl")


setwd("C:/Users/Gonzalo/Dropbox/Gonzalo 3.0/Acreditacion/alumnos_y_graduados")

filenames_alumnos_y_graduados <- list.files(pattern="*.TXT", full.names=TRUE)

ldf_alumnos_y_graduados <- lapply(filenames_alumnos_y_graduados, 
                                  read_delim, locale = locale(encoding = "WINDOWS-1252"))

alumnos_y_graduados <- dplyr::bind_rows(ldf_alumnos_y_graduados)
alumnos_y_graduados <- alumnos_y_graduados[-1]
alumnos_y_graduados <- alumnos_y_graduados[-1]

write_xlsx(alumnos_y_graduados, 
           "C:/Users/Gonzalo/Dropbox/Gonzalo 3.0/Acreditacion/alumnos_y_graduados/alumnos_y_graduados.xlsx")

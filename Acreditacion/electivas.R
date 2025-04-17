library(tidyverse)

#### Bioquimica ####

setwd("C:/Users/Gonzalo/Dropbox/Gonzalo 3.0/Acreditacion/electivas_B")
filenames_electivas_B <- list.files(pattern="*.TXT", full.names=TRUE)

ldf_electivas_B <- lapply(filenames_electivas_B, read_delim, locale = locale(encoding = "WINDOWS-1252"))

elec_bioquimica <- dplyr::bind_rows(ldf_electivas_B)
elec_bioquimica2 <- as.data.frame(elec_bioquimica %>% 
                               group_by(nombre_materia, anio) %>% 
                               summarize(inscriptos = sum(inscriptos),
                                         aprobados = sum(aprobados),
                                         reprobados = sum(reprobados),
                                         promocionados = sum(promocionados),
                                         ausentes = sum(ausentes)))
elec_bioquimica2['carrera'] <- 'Bioquímica'

elec_bioquimica_spliteado <- split(elec_bioquimica2, elec_bioquimica2$nombre_materia)

n <- 1
for(i in 1:20) {
  nombre <- names(elec_bioquimica_spliteado[n])
  write_xlsx(assign(nombre, as.data.frame(elec_bioquimica_spliteado[n])), 
             paste("C:/Users/Gonzalo/Dropbox/Gonzalo 3.0/Acreditacion/electivas/bioquimica/",nombre, ".xlsx", 
                   sep = ""))
  n <- n +1
}


#### FARMACIA ####

setwd("C:/Users/Gonzalo/Dropbox/Gonzalo 3.0/Acreditacion/electivas_F")
filenames_electivas_F <- list.files(pattern="*.TXT", full.names=TRUE)

ldf_electivas_F <- lapply(filenames_electivas_F, read_delim, locale = locale(encoding = "WINDOWS-1252"))

elec_fcia <- dplyr::bind_rows(ldf_electivas_F)
elec_fcia2 <- as.data.frame(elec_fcia %>% 
                                    group_by(nombre_materia, anio) %>% 
                                    summarize(inscriptos = sum(inscriptos),
                                              aprobados = sum(aprobados),
                                              reprobados = sum(reprobados),
                                              promocionados = sum(promocionados),
                                              ausentes = sum(ausentes)))
elec_fcia2['carrera'] <- 'Farmacia'

elec_fcia_spliteado <- split(elec_fcia2, elec_fcia2$nombre_materia)

n <- 1
for(i in 1:10) {
  nombre <- names(elec_fcia_spliteado[n])
  write_xlsx(assign(nombre, as.data.frame(elec_fcia_spliteado[n])), 
             paste("C:/Users/Gonzalo/Dropbox/Gonzalo 3.0/Acreditacion/electivas/farmacia/",nombre, ".xlsx", 
                   sep = ""))
  n <- n +1
}

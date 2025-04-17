library(tidyverse)

#### Bioquimica ####

setwd("C:/Users/Gonzalo/Dropbox/Gonzalo 3.0/Acreditacion/cursada_materia_anio_B")
filenames_B <- list.files(pattern="*.TXT", full.names=TRUE)

ldf_B <- lapply(filenames_B, read_delim, locale = locale(encoding = "WINDOWS-1252"))

bioquimica <- dplyr::bind_rows(ldf_B)
bioquimica2 <- as.data.frame(bioquimica %>% 
                               group_by(nombre_materia, anio) %>% 
                               summarize(inscriptos = sum(inscriptos),
                                         aprobados = sum(aprobados),
                                         reprobados = sum(reprobados),
                                         promocionados = sum(promocionados),
                                         ausentes = sum(ausentes)))
bioquimica2['carrera'] <- 'Bioquímica'


#### Farmacia ####

setwd("C:/Users/Gonzalo/Dropbox/Gonzalo 3.0/Acreditacion/cursada_materia_anio_F")
filenames_F <- list.files(pattern="*.TXT", full.names=TRUE)

ldf_F <- lapply(filenames_F, read_delim, locale = locale(encoding = "WINDOWS-1252"))

farmacia <- dplyr::bind_rows(ldf_F)
farmacia2 <- as.data.frame(farmacia %>% 
                               group_by(nombre_materia, anio) %>% 
                               summarize(inscriptos = sum(inscriptos),
                                         aprobados = sum(aprobados),
                                         reprobados = sum(reprobados),
                                         promocionados = sum(promocionados),
                                         ausentes = sum(ausentes)))
farmacia2['carrera'] <- 'Farmacia'

#### Biotec #### 

setwd("C:/Users/Gonzalo/Dropbox/Gonzalo 3.0/Acreditacion/cursada_materia_anio_LB")
filenames_LB <- list.files(pattern="*.TXT", full.names=TRUE)

ldf_LB <- lapply(filenames_LB, read_delim, locale = locale(encoding = "WINDOWS-1252"))

LB <- dplyr::bind_rows(ldf_LB)
LB2 <- as.data.frame(LB %>% 
                       group_by(nombre_materia, anio) %>% 
                       summarize(inscriptos = sum(inscriptos),
                                 aprobados = sum(aprobados),
                                 reprobados = sum(reprobados),
                                 promocionados = sum(promocionados),
                                 ausentes = sum(ausentes)))
LB2['carrera'] <- 'Lic. Biotecnología'

#### LQ ####

setwd("C:/Users/Gonzalo/Dropbox/Gonzalo 3.0/Acreditacion/cusada_materia_anio_LQ")
filenames_LQ <- list.files(pattern="*.TXT", full.names=TRUE)

ldf_LQ <- lapply(filenames_LQ, read_delim, locale = locale(encoding = "WINDOWS-1252"))

LQ <- dplyr::bind_rows(ldf_LQ)
LQ2 <- as.data.frame(LQ %>% 
                       group_by(nombre_materia, anio) %>% 
                       summarize(inscriptos = sum(inscriptos),
                                 aprobados = sum(aprobados),
                                 reprobados = sum(reprobados),
                                 promocionados = sum(promocionados),
                                 ausentes = sum(ausentes)))
LQ2['carrera'] <- 'Lic. Química'


#### LA #### 


setwd("C:/Users/Gonzalo/Dropbox/Gonzalo 3.0/Acreditacion/cursada_materia_anio_LA")
filenames_LA <- list.files(pattern="*.TXT", full.names=TRUE)

ldf_LA <- lapply(filenames_LA, read_delim, locale = locale(encoding = "WINDOWS-1252"))

LA <- dplyr::bind_rows(ldf_LA)
LA2 <- as.data.frame(LA %>% 
                       group_by(nombre_materia, anio) %>% 
                       summarize(inscriptos = sum(inscriptos),
                                 aprobados = sum(aprobados),
                                 reprobados = sum(reprobados),
                                 promocionados = sum(promocionados),
                                 ausentes = sum(ausentes)))
LA2['carrera'] <- 'Lic. Alimentos'


#### PQ #### 

setwd("C:/Users/Gonzalo/Dropbox/Gonzalo 3.0/Acreditacion/cursada_materia_anio_PQ")
filenames_PQ <- list.files(pattern="*.TXT", full.names=TRUE)

ldf_PQ <- lapply(filenames_PQ, read_delim, locale = locale(encoding = "WINDOWS-1252"))

PQ <- dplyr::bind_rows(ldf_PQ)
PQ2 <- as.data.frame(PQ %>% 
                       group_by(nombre_materia, anio) %>% 
                       summarize(inscriptos = sum(inscriptos),
                                 aprobados = sum(aprobados),
                                 reprobados = sum(reprobados),
                                 promocionados = sum(promocionados),
                                 ausentes = sum(ausentes)))
PQ2['carrera'] <- 'Profesorado en Química'





#### Unión #### 

todas <- full_join(bioquimica, farmacia) %>% 
  full_join(LA) %>% 
  full_join(LB) %>% 
  full_join(PQ) %>% 
  full_join(LQ)

todas2 <- full_join(bioquimica2, farmacia2) %>% 
  full_join(LA2) %>% 
  full_join(LB2) %>% 
  full_join(PQ2) %>% 
  full_join(LQ2)

#### Por materia sin distinción de carrera #### 

por_materia <- as.data.frame(todas2 %>% 
                               group_by(nombre_materia, anio) %>% 
                               summarize(inscriptos = sum(inscriptos),
                                         aprobados = sum(aprobados),
                                         reprobados = sum(reprobados),
                                         promocionados = sum(promocionados),
                                         ausentes = sum(ausentes)))


#### Exportar #### 

library("writexl")
write_xlsx(todas2,"cursada")

por_materia_spliteado <- split(por_materia, por_materia$nombre_materia)

n <- 1
for(i in 1:60) {
  nombre <- names(por_materia_spliteado[n])
  write_xlsx(assign(nombre, as.data.frame(por_materia_spliteado[n])), 
             paste("C:/Users/Gonzalo/Dropbox/Gonzalo 3.0/Acreditacion/materias/",nombre, ".xlsx", 
                   sep = ""))
  n <- n +1
}

write_xlsx(por_materia, "C:/Users/Gonzalo/Dropbox/Gonzalo 3.0/Acreditacion/materias_todo_junto.xlsx")

write_xlsx(bioquimica2, "C:/Users/Gonzalo/Dropbox/Gonzalo 3.0/Acreditacion/bioquimica.xlsx")
write_xlsx(farmacia2, "C:/Users/Gonzalo/Dropbox/Gonzalo 3.0/Acreditacion/farmacia.xlsx")
write_xlsx(LB2, "C:/Users/Gonzalo/Dropbox/Gonzalo 3.0/Acreditacion/LB.xlsx")
write_xlsx(LQ2, "C:/Users/Gonzalo/Dropbox/Gonzalo 3.0/Acreditacion/LQ.xlsx")
write_xlsx(LA2, "C:/Users/Gonzalo/Dropbox/Gonzalo 3.0/Acreditacion/LA.xlsx")
write_xlsx(PQ2, "C:/Users/Gonzalo/Dropbox/Gonzalo 3.0/Acreditacion/PQ.xlsx")



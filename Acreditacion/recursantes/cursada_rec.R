library(tidyverse)

#### Bioquimica ####

setwd("C:/Users/Gonzalo/Dropbox/Gonzalo 3.0/Acreditacion/recursantes/cursada_rec_B")
filenames_B <- list.files(pattern="*.TXT", full.names=TRUE)

ldf_B <- lapply(filenames_B, read_delim, locale = locale(encoding = "WINDOWS-1252"))

bioquimica <- dplyr::bind_rows(ldf_B)
bioquimica2 <- as.data.frame(bioquimica %>% 
                               group_by(compute_0003, compute_0004, compute_0011) %>% 
                               summarize(inscriptos = sum(compute_0005, na.rm = T),
                                         aprobados = sum(compute_0006, na.rm = T),
                                         reprobados = sum(compute_0007, na.rm = T),
                                         promocionados = sum(compute_0008, na.rm = T)))
colnames(bioquimica2)[1] <- 'materia'
colnames(bioquimica2)[2] <- 'anio'
colnames(bioquimica2)[3] <- 'condicion'
bioquimica2['carrera'] <- 'Bioquímica'


#### Farmacia ####

setwd("C:/Users/Gonzalo/Dropbox/Gonzalo 3.0/Acreditacion/recursantes/cursada_rec_F")
filenames_F <- list.files(pattern="*.TXT", full.names=TRUE)

ldf_F <- lapply(filenames_F, read_delim, locale = locale(encoding = "WINDOWS-1252"))

farmacia <- dplyr::bind_rows(ldf_F)
farmacia2 <- as.data.frame(farmacia %>% 
                               group_by(compute_0003, compute_0004, compute_0011) %>% 
                               summarize(inscriptos = sum(compute_0005, na.rm = T),
                                         aprobados = sum(compute_0006, na.rm = T),
                                         reprobados = sum(compute_0007, na.rm = T),
                                         promocionados = sum(compute_0008, na.rm = T)))
colnames(farmacia2)[1] <- 'materia'
colnames(farmacia2)[2] <- 'anio'
colnames(farmacia2)[3] <- 'condicion'
farmacia2['carrera'] <- 'Farmacia'
#### Biotec #### 

setwd("C:/Users/Gonzalo/Dropbox/Gonzalo 3.0/Acreditacion/recursantes/cursada_rec_LB")
filenames_LB <- list.files(pattern="*.TXT", full.names=TRUE)

ldf_LB <- lapply(filenames_LB, read_delim, locale = locale(encoding = "WINDOWS-1252"))

LB <- dplyr::bind_rows(ldf_LB)
LB2 <- as.data.frame(LB %>% 
                             group_by(compute_0003, compute_0004, compute_0011) %>% 
                             summarize(inscriptos = sum(compute_0005, na.rm = T),
                                       aprobados = sum(compute_0006, na.rm = T),
                                       reprobados = sum(compute_0007, na.rm = T),
                                       promocionados = sum(compute_0008, na.rm = T)))
colnames(LB2)[1] <- 'materia'
colnames(LB2)[2] <- 'anio'
colnames(LB2)[3] <- 'condicion'
LB2['carrera'] <- 'Lic. Biotecnología'

#### LQ ####

setwd("C:/Users/Gonzalo/Dropbox/Gonzalo 3.0/Acreditacion/recursantes/cursada_rec_LQ")
filenames_LQ <- list.files(pattern="*.TXT", full.names=TRUE)

ldf_LQ <- lapply(filenames_LQ, read_delim, locale = locale(encoding = "WINDOWS-1252"))

LQ <- dplyr::bind_rows(ldf_LQ)
LQ2 <- as.data.frame(LQ %>% 
                       group_by(compute_0003, compute_0004, compute_0011) %>% 
                       summarize(inscriptos = sum(compute_0005, na.rm = T),
                                 aprobados = sum(compute_0006, na.rm = T),
                                 reprobados = sum(compute_0007, na.rm = T),
                                 promocionados = sum(compute_0008, na.rm = T)))
colnames(LQ2)[1] <- 'materia'
colnames(LQ2)[2] <- 'anio'
colnames(LQ2)[3] <- 'condicion'
LQ2['carrera'] <- 'Lic. Química'

#### LA #### 



setwd("C:/Users/Gonzalo/Dropbox/Gonzalo 3.0/Acreditacion/recursantes/cursada_rec_LA")
filenames_LA <- list.files(pattern="*.TXT", full.names=TRUE)

ldf_LA <- lapply(filenames_LA, read_delim, locale = locale(encoding = "WINDOWS-1252"))

LA <- dplyr::bind_rows(ldf_LA)
LA2 <- as.data.frame(LA %>% 
                       group_by(compute_0003, compute_0004, compute_0011) %>% 
                       summarize(inscriptos = sum(compute_0005, na.rm = T),
                                 aprobados = sum(compute_0006, na.rm = T),
                                 reprobados = sum(compute_0007, na.rm = T),
                                 promocionados = sum(compute_0008, na.rm = T)))
colnames(LA2)[1] <- 'materia'
colnames(LA2)[2] <- 'anio'
colnames(LA2)[3] <- 'condicion'
LA2['carrera'] <- 'Lic. Alimentos'



#### PQ #### 

setwd("C:/Users/Gonzalo/Dropbox/Gonzalo 3.0/Acreditacion/recursantes/cursada_rec_PQ")
filenames_PQ <- list.files(pattern="*.TXT", full.names=TRUE)

ldf_PQ <- lapply(filenames_PQ, read_delim, locale = locale(encoding = "WINDOWS-1252"))

PQ <- dplyr::bind_rows(ldf_PQ)
PQ2 <- as.data.frame(PQ %>% 
                       group_by(compute_0003, compute_0004, compute_0011) %>% 
                       summarize(inscriptos = sum(compute_0005, na.rm = T),
                                 aprobados = sum(compute_0006, na.rm = T),
                                 reprobados = sum(compute_0007, na.rm = T),
                                 promocionados = sum(compute_0008, na.rm = T)))
colnames(PQ2)[1] <- 'materia'
colnames(PQ2)[2] <- 'anio'
colnames(PQ2)[3] <- 'condicion'
PQ2['carrera'] <- 'Prof. Química'






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
                               group_by(materia, anio, condicion) %>% 
                               summarize(inscriptos = sum(inscriptos, na.rm = T),
                                         aprobados = sum(aprobados, na.rm = T),
                                         reprobados = sum(reprobados, na.rm = T),
                                         promocionados = sum(promocionados, na.rm = T)))


#### Exportar #### 

library("writexl")
write_xlsx(todas2,"cursada.xlsx")

por_materia_spliteado <- split(por_materia, por_materia$materia)

n <- 1
for(i in 1:60) {
  nombre <- names(por_materia_spliteado[n])
  write_xlsx(assign(nombre, as.data.frame(por_materia_spliteado[n])), 
             paste("C:/Users/Gonzalo/Dropbox/Gonzalo 3.0/Acreditacion/recursantes/materias/",nombre, ".xlsx", 
                   sep = ""))
  n <- n +1
}

write_xlsx(por_materia, "C:/Users/Gonzalo/Dropbox/Gonzalo 3.0/Acreditacion/recursantes/materias/materias_todo_junto.xlsx")

write_xlsx(bioquimica2, "C:/Users/Gonzalo/Dropbox/Gonzalo 3.0/Acreditacion/recursantes/bioquimica.xlsx")
write_xlsx(farmacia2, "C:/Users/Gonzalo/Dropbox/Gonzalo 3.0/Acreditacion/recursantes/farmacia.xlsx")
write_xlsx(LB2, "C:/Users/Gonzalo/Dropbox/Gonzalo 3.0/Acreditacion/recursantes/LB.xlsx")
write_xlsx(LQ2, "C:/Users/Gonzalo/Dropbox/Gonzalo 3.0/Acreditacion/recursantes/LQ.xlsx")
write_xlsx(LA2, "C:/Users/Gonzalo/Dropbox/Gonzalo 3.0/Acreditacion/recursantes/LA.xlsx")
write_xlsx(PQ2, "C:/Users/Gonzalo/Dropbox/Gonzalo 3.0/Acreditacion/recursantes/PQ.xlsx")



library(here)
library(tidyverse)

filenames_B <- list.files(path = here("Acreditacion", "ausentes", "cursada_rec_B"),
                          pattern="*.TXT", full.names=TRUE)

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
bioquimica2 <- bioquimica2 %>%
  mutate(ausentes = ifelse(inscriptos - aprobados - reprobados - promocionados >= 0,
                           inscriptos - aprobados - reprobados - promocionados, 0))
bioquimica2['carrera'] <- 'Bioquímica'



#### Farmacia ####

filenames_F <- list.files(path = here("Acreditacion", "ausentes", "cursada_rec_F"),
                          pattern="*.TXT", full.names=TRUE)

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
farmacia2 <- farmacia2 %>%
  mutate(ausentes = ifelse(inscriptos - aprobados - reprobados - promocionados >= 0,
                           inscriptos - aprobados - reprobados - promocionados, 0))
farmacia2['carrera'] <- 'Farmacia'

#### Biotec #### 

filenames_LB <- list.files(path = here("Acreditacion", "ausentes", "cursada_rec_LB"),
                           pattern="*.TXT", full.names=TRUE)

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
LB2 <- LB2 %>%
  mutate(ausentes = ifelse(inscriptos - aprobados - reprobados - promocionados >= 0,
                           inscriptos - aprobados - reprobados - promocionados, 0))
LB2['carrera'] <- 'Lic. Biotecnología'

#### LQ ####

filenames_LQ <- list.files(path = here("Acreditacion", "ausentes", "cursada_rec_LQ"),
                           pattern="*.TXT", full.names=TRUE)

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
LQ2 <- LQ2 %>%
  mutate(ausentes = ifelse(inscriptos - aprobados - reprobados - promocionados >= 0,
                           inscriptos - aprobados - reprobados - promocionados, 0))
LQ2['carrera'] <- 'Lic. Química'



#### LA #### 



filenames_LA <- list.files(path = here("Acreditacion", "ausentes", "cursada_rec_LA"),
                           pattern="*.TXT", full.names=TRUE)

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
LA2 <- LA2 %>%
  mutate(ausentes = ifelse(inscriptos - aprobados - reprobados - promocionados >= 0,
                           inscriptos - aprobados - reprobados - promocionados, 0))
LA2['carrera'] <- 'Lic. Alimentos'



#### PQ #### 

filenames_PQ <- list.files(path = here("Acreditacion", "ausentes", "cursada_rec_PQ"),
                           pattern="*.TXT", full.names=TRUE)

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
PQ2 <- PQ2 %>%
  mutate(ausentes = ifelse(inscriptos - aprobados - reprobados - promocionados >= 0,
                           inscriptos - aprobados - reprobados - promocionados, 0))
PQ2['carrera'] <- 'Prof. Química'






#### Unión #### 

todas <- full_join(bioquimica, farmacia) %>% 
  full_join(LA) %>% 
  full_join(LB) %>% 
  full_join(PQ) %>% 
  full_join(LQ)

todas_cursada <- full_join(bioquimica2, farmacia2) %>% 
  full_join(LA2) %>% 
  full_join(LB2) %>% 
  full_join(PQ2) %>% 
  full_join(LQ2)

#### Por materia sin distinción de carrera #### 

por_materia_cursada <- as.data.frame(todas_cursada %>% 
                                       group_by(materia, anio, condicion) %>% 
                                       summarize(inscriptos = sum(inscriptos, na.rm = T),
                                                 aprobados = sum(aprobados, na.rm = T),
                                                 reprobados = sum(reprobados, na.rm = T),
                                                 promocionados = sum(promocionados, na.rm = T),
                                                 ausentes = sum(ausentes, na.rm = T)))

filenames_B <- list.files(path = here("Acreditacion", "examenes_materia_anio_B"),
                          pattern="*.TXT", full.names=TRUE)

ldf_B <- lapply(filenames_B, read_delim, locale = locale(encoding = "WINDOWS-1252"))

bioquimica <- dplyr::bind_rows(ldf_B)
bioquimica2 <- as.data.frame(bioquimica %>% 
                               group_by(nombre_materia, anio_academico) %>% 
                               summarize(presentes = sum(presentes),
                                         aprobados = sum(aprobados),
                                         reprobados = sum(reprobados)))
bioquimica2['carrera'] <- 'Bioquímica'


#### Farmacia ####

filenames_F <- list.files(path = here("Acreditacion", "examenes_materia_anio_F"),
                          pattern="*.TXT", full.names=TRUE)

ldf_F <- lapply(filenames_F, read_delim, locale = locale(encoding = "WINDOWS-1252"))

farmacia <- dplyr::bind_rows(ldf_F)
farmacia2 <- as.data.frame(farmacia %>% 
                             group_by(nombre_materia, anio_academico) %>% 
                             summarize(presentes = sum(presentes),
                                       aprobados = sum(aprobados),
                                       reprobados = sum(reprobados)))
farmacia2['carrera'] <- 'Farmacia'

#### Biotec #### 

filenames_LB <- list.files(path = here("Acreditacion", "examenes_materia_anio_LB"),
                           pattern="*.TXT", full.names=TRUE)

ldf_LB <- lapply(filenames_LB, read_delim, locale = locale(encoding = "WINDOWS-1252"))

LB <- dplyr::bind_rows(ldf_LB)
LB2 <- as.data.frame(LB %>% 
                       group_by(nombre_materia, anio_academico) %>% 
                       summarize(presentes = sum(presentes),
                                 aprobados = sum(aprobados),
                                 reprobados = sum(reprobados)))
LB2['carrera'] <- 'Lic. Biotecnología'

#### LQ ####

filenames_LQ <- list.files(path = here("Acreditacion", "examenes_materia_anio_LQ"),
                           pattern="*.TXT", full.names=TRUE)

ldf_LQ <- lapply(filenames_LQ, read_delim, locale = locale(encoding = "WINDOWS-1252"))

LQ <- dplyr::bind_rows(ldf_LQ)
LQ2 <- as.data.frame(LQ %>% 
                       group_by(nombre_materia, anio_academico) %>% 
                       summarize(presentes = sum(presentes),
                                 aprobados = sum(aprobados),
                                 reprobados = sum(reprobados)))
LQ2['carrera'] <- 'Lic. Química'


#### LA #### 


filenames_LA <- list.files(path = here("Acreditacion", "examenes_materia_anio_LA"),
                           pattern="*.TXT", full.names=TRUE)

ldf_LA <- lapply(filenames_LA, read_delim, locale = locale(encoding = "WINDOWS-1252"))

LA <- dplyr::bind_rows(ldf_LA)
LA2 <- as.data.frame(LA %>% 
                       group_by(nombre_materia, anio_academico) %>% 
                       summarize(presentes = sum(presentes),
                                 aprobados = sum(aprobados),
                                 reprobados = sum(reprobados)))
LA2['carrera'] <- 'Lic. Alimentos'


#### PQ #### 

filenames_PQ <- list.files(path = here("Acreditacion", "examenes_materia_anio_PQ"),
                           pattern="*.TXT", full.names=TRUE)

ldf_PQ <- lapply(filenames_PQ, read_delim, locale = locale(encoding = "WINDOWS-1252"))

PQ <- dplyr::bind_rows(ldf_PQ)
PQ2 <- as.data.frame(PQ %>% 
                       group_by(nombre_materia, anio_academico) %>% 
                       summarize(presentes = sum(presentes),
                                 aprobados = sum(aprobados),
                                 reprobados = sum(reprobados)))
PQ2['carrera'] <- 'Profesorado en Química'





#### Unión #### 

todas <- full_join(bioquimica, farmacia) %>% 
  full_join(LA) %>% 
  full_join(LB) %>% 
  full_join(PQ) %>% 
  full_join(LQ)

todas_examenes <- full_join(bioquimica2, farmacia2) %>% 
  full_join(LA2) %>% 
  full_join(LB2) %>% 
  full_join(PQ2) %>% 
  full_join(LQ2)

#### Por materia sin distinción de carrera #### 

por_materia_examenes <- as.data.frame(todas_examenes %>% 
                                        group_by(nombre_materia, anio_academico) %>% 
                                        summarize(presentes = sum(presentes),
                                                  aprobados = sum(aprobados),
                                                  reprobados = sum(reprobados)))

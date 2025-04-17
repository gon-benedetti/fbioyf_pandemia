library(tidyverse)
library(ggpubr)
library(plotly)
library(extrafont)
library(readr)
loadfonts('win')
source('fuente.R')



### Materias por año #####

primer_anio <- c('Matemática I', 'Matemática II', 'Física I', 'Química General e Inorgánica',
                 'Seminario Introductorio a la Problemática Bioquímica',
                 'Seminario Introductorio a la Problemática Farmaceútica', 'Seminario Introductorio a la Problemática Farmacéutica
')
segundo_anio <- c('Biología', 'Estadística', 'Física II', 'Fisicoquímica I', 
                  'Química Orgánica I', 'Química Orgánica II', 'Morfología', 
                  'Taller de Problemática Profesional I')
tercer_anio <- c('Bioquímica', 'Epistemología y Metodología de la Investigación I', 
                 'Epistemología y Metodología de la Investigación',
                 'Farmacobotánica', 'Fisicoquímica II', 'Microbiología',
                 'Química Analítica I', 'Química Analítica II', 'Química Biológica',
                 'Taller de Problemática Profesional II')
cuarto_anio <- c('Bacteriología', 'Biología Molecular', 'Farmacia y Sociedad', 
                 'Epistemología y Metodología de la Investigación II',
                 'Farmacognosia', 'Farmacología', 'Hematología I', 'Inmunología I',
                 'Inmunología II', 'Microbiología General', 'Práctica Profesional Nivel I',
                 'Química Analítica Clínica', 'Química Medicinal', 'Tecnología Farmacéutica',
                 'Tecnología Farmacéutica y Biofarmacia', 'Fisiología', 'Biología Molecular 
')
quinto_anio <- c('Bioquímica Clínica y Fisiopatología', 'Bromatología y Nutrición',
                 'Farmacia Asistencial', 'Farmacia Clínica', 'Garantía de Calidad de Medicamentos',
                 'Hematología II', 'Micología', 'Nutrición y Bromatología', 'Parasitología',
                 'Práctica Profesional', 'Práctica Profesional Nivel II', 'Toxicología',
                 'Virología','Nutrición
')


####### Materias por ciclo #######

ciclo_basico <- c(primer_anio, segundo_anio, tercer_anio)
ciclo_superior <- c(cuarto_anio, quinto_anio)

############# Añadir columna año de cursada ######

datos_cursada <- por_materia_cursada %>%
  mutate(anio_cursada = case_when(
    materia %in% primer_anio ~ 1,
    materia %in% segundo_anio ~ 2,
    materia %in% tercer_anio ~ 3,
    materia %in% cuarto_anio ~ 4,
    materia %in% quinto_anio ~ 5,
    TRUE ~ NA_integer_
  ))

todas_cursada_ <- todas_cursada %>% 
  mutate(anio_cursada = case_when(
    materia %in% primer_anio ~ 1,
    materia %in% segundo_anio ~ 2,
    materia %in% tercer_anio ~ 3,
    materia %in% cuarto_anio ~ 4,
    materia %in% quinto_anio ~ 5,
    TRUE ~ NA_integer_
  ))

todas_cursada_ <- todas_cursada_ %>% 
  mutate(ciclo = case_when(
    materia %in% ciclo_basico ~ 'ciclo_basico',
    materia %in% ciclo_superior ~ 'ciclo_superior'
  ))


datos_exam <- por_materia_examenes %>%
  mutate(anio_cursada = case_when(
    nombre_materia %in% primer_anio ~ 1,
    nombre_materia %in% segundo_anio ~ 2,
    nombre_materia %in% tercer_anio ~ 3,
    nombre_materia %in% cuarto_anio ~ 4,
    nombre_materia %in% quinto_anio ~ 5,
    TRUE ~ NA_integer_
  ))

datos_cursada_ciclo <- datos_cursada %>% 
  mutate(ciclo = case_when(
    materia %in% ciclo_basico ~ 'ciclo_basico',
    materia %in% ciclo_superior ~ 'ciclo_superior'
  ))

datos_exam_ciclo <- todas_examenes %>% 
  mutate(ciclo = case_when(
    nombre_materia %in% ciclo_basico ~ 'ciclo_basico',
    nombre_materia %in% ciclo_superior ~ 'ciclo_superior'
  ))


####### Condiciones finales de cursada y exámenes por año de cursada #####
por_anio_cursada <- as.data.frame(datos_cursada %>% 
                                    group_by(anio_cursada) %>% 
                                    summarize(inscriptos = sum(inscriptos, na.rm = T),
                                              aprobados = sum(aprobados, na.rm = T),
                                              reprobados = sum(reprobados, na.rm = T),
                                              promocionados = sum(promocionados, na.rm = T),
                                              ausentes = sum(ausentes, na.rm = T),
                                              aprobados_ = (aprobados/inscriptos) * 100))


por_anio_cursada_exam <- as.data.frame(datos_exam %>% 
                                         group_by(anio_cursada) %>% 
                                         summarize(presentes = sum(presentes, na.rm = T),
                                                   aprobados = sum(aprobados, na.rm = T),
                                                   reprobados = sum(reprobados, na.rm = T),
                                                   aprobados_ = (aprobados/presentes) * 100))


por_ciclo_cursada <- as.data.frame(datos_cursada_ciclo %>% 
                                     group_by(ciclo, carrera) %>% 
                                     summarize(inscriptos = sum(inscriptos, na.rm = T),
                                               aprobados = sum(aprobados, na.rm = T),
                                               reprobados = sum(reprobados, na.rm = T),
                                               promocionados = sum(promocionados, na.rm = T),
                                               ausentes = sum(ausentes, na.rm = T),
                                               aprobados_ = (aprobados/inscriptos) * 100))
por_ciclo_exam <- as.data.frame(datos_exam_ciclo %>% 
                                  group_by(ciclo, carrera) %>% 
                                  summarize(inscriptos = sum(inscriptos, na.rm = T),
                                            aprobados = sum(aprobados, na.rm = T),
                                            reprobados = sum(reprobados, na.rm = T),
                                            promocionados = sum(promocionados, na.rm = T),
                                            ausentes = sum(ausentes, na.rm = T),
                                            aprobados_ = (aprobados/inscriptos) * 100))

por_ciclo_cursada <- por_ciclo_cursada[-3, ]

####### Condiciones finales de cursada y exámenes por año académico #####


cursada_anios <- as.data.frame(datos_cursada %>% 
                                 group_by(anio, anio_cursada) %>% 
                                 summarize(inscriptos = sum(inscriptos, na.rm = T),
                                           aprobados = sum(aprobados, na.rm = T),
                                           reprobados = sum(reprobados, na.rm = T),
                                           promocionados = sum(promocionados, na.rm = T),
                                           ausentes = sum(ausentes, na.rm = T),
                                           aprobados_ = (aprobados/inscriptos) * 100))

cursada_anios_sin_23<-subset(cursada_anios, anio!= 2023)

exam_anios <- as.data.frame(datos_exam %>% 
                              group_by(anio_academico, anio_cursada) %>% 
                              summarize(presentes = sum(presentes, na.rm = T),
                                        aprobados = sum(aprobados, na.rm = T),
                                        reprobados = sum(reprobados, na.rm = T),
                                        aprobados_ = (aprobados/presentes) * 100))
###### condiciones finales cursada y exámenes por carrera ######

cursada_carrera <- as.data.frame(todas_cursada_ %>%
                                   filter(anio!= 2023) %>% 
                                   group_by(carrera, anio) %>% 
                                   summarize(inscriptos = sum(inscriptos, na.rm = T),
                                             aprobados = sum(aprobados, na.rm = T),
                                             reprobados = sum(reprobados, na.rm = T),
                                             promocionados = sum(promocionados, na.rm = T),
                                             ausentes = sum(ausentes, na.rm = T),
                                             aprobados_ = (aprobados/inscriptos) * 100))

exam_carrera <- as.data.frame(datos_exam_ciclo %>% 
                                group_by(carrera, anio_academico) %>% 
                                summarize(presentes = sum(presentes, na.rm = T),
                                          aprobados = sum(aprobados, na.rm = T),
                                          reprobados = sum(reprobados, na.rm = T),
                                          aprobados_ = (aprobados/presentes) * 100))

exam_carrera_ciclo_b <- as.data.frame(datos_exam_ciclo %>%
                                        filter(ciclo == 'ciclo_basico') %>% 
                                        group_by(carrera, anio_academico) %>% 
                                        summarize(presentes = sum(presentes, na.rm = T),
                                                  aprobados = sum(aprobados, na.rm = T),
                                                  reprobados = sum(reprobados, na.rm = T),
                                                  aprobados_ = (aprobados/presentes) * 100))

cursada_carrera_ciclo_b <- as.data.frame(todas_cursada_ %>%
                                           filter(anio!= 2023) %>%
                                           filter(ciclo == 'ciclo_basico') %>% 
                                           group_by(carrera, anio) %>% 
                                           summarize(inscriptos = sum(inscriptos, na.rm = T),
                                                     aprobados = sum(aprobados, na.rm = T),
                                                     reprobados = sum(reprobados, na.rm = T),
                                                     promocionados = sum(promocionados, na.rm = T),
                                                     ausentes = sum(ausentes, na.rm = T),
                                                     aprobados_ = (aprobados/inscriptos) * 100))
cursada_carrera_ciclo_s <- as.data.frame(todas_cursada_ %>%
                                           filter(anio!= 2023) %>%
                                           filter(ciclo == 'ciclo_superior') %>% 
                                           group_by(carrera, anio) %>% 
                                           summarize(inscriptos = sum(inscriptos, na.rm = T),
                                                     aprobados = sum(aprobados, na.rm = T),
                                                     reprobados = sum(reprobados, na.rm = T),
                                                     promocionados = sum(promocionados, na.rm = T),
                                                     ausentes = sum(ausentes, na.rm = T),
                                                     aprobados_ = (aprobados/inscriptos) * 100))

######### Algunos gráficos #######

cursadas <- ggplot(por_anio_cursada, aes(x = anio_cursada, y = aprobados_))+
  geom_col()

exams <- ggplot(por_anio_cursada_exam, aes(x = anio_cursada, y = aprobados_))+
  geom_col()


ggarrange(cursadas, exams)

###### Tasa de regularidad por año de cursada 2017-2022 ######

ggplot(data=na.omit(cursada_anios_sin_23[c("anio","aprobados_", 'anio_cursada')]), aes(x = anio, y = aprobados_, color = as.factor(anio_cursada))) +
  geom_point() +
  geom_line()+
  labs(title = 'Porcentaje de regularización \n por año de cursada 2017-2022',
       x = "Año", y = "Porcentaje de regularización") +
  scale_color_discrete(name = "Año de Cursada") +
  scale_y_continuous(limits = c(0,90),breaks = seq(0,90, by = 10))+
  geom_hline(yintercept = c(10,20,30,40,50,60,70,80,90), linetype = "dashed", color = "gray")+
  theme_classic(base_family = 'Montserrat')+
  theme(text=element_text(size=10,  family= 'Montserrat ExtraBold'))+
  theme(
    panel.background = element_rect(fill='transparent'), #transparent panel bg
    plot.background = element_rect(fill='transparent', color=NA), #transparent plot bg
    panel.grid.major = element_blank(), #remove major gridlines
    panel.grid.minor = element_blank(), #remove minor gridlines
    legend.background = element_rect(fill='transparent'), #transparent legend bg
    legend.box.background = element_rect(fill='transparent'),
    legend.position= c(0.5, 0.075),
    legend.direction = 'horizontal',
    plot.title = element_text(hjust = 0.5))

###### Tasa de aprobación de finales por año de cursada 2017-2023 #######

ggplot(data=na.omit(exam_anios[c("anio_academico","aprobados_", 'anio_cursada')]), aes(x = anio_academico, y = aprobados_, color = as.factor(anio_cursada))) +
  geom_point() +
  geom_line()+
  labs(title = 'Tasa de aprobación de finales \n por año de cursada 2017-2023',
       x = "Año", y = "Aprobados") +
  scale_color_discrete(name = "Año de Cursada") +
  #scale_x_discrete(labels = waiver())+
  scale_y_continuous(limits= c(10,90),breaks = seq(30,90, by = 10))+
  geom_hline(yintercept = c(30,40,50,60,70,80,90), linetype = "dashed", color = "gray")+
  theme_classic(base_family = 'Montserrat')+
  theme(text=element_text(size=10,  family= 'Montserrat ExtraBold'))+
  theme(
    panel.background = element_rect(fill='transparent'), #transparent panel bg
    plot.background = element_rect(fill='transparent', color=NA), #transparent plot bg
    panel.grid.major = element_blank(), #remove major gridlines
    panel.grid.minor = element_blank(), #remove minor gridlines
    legend.background = element_rect(fill='transparent'), #transparent legend bg
    legend.box.background = element_rect(fill='transparent'),
    legend.position= c(0.5, 0.15),
    legend.direction = 'horizontal',
    plot.title = element_text(hjust = 0.5))


##### gráfico barras tasa de aprobación por carrera para ciclo básico ####

ggplot(data=exam_carrera_ciclo_b, aes(x = anio_academico, y = aprobados_, color = as.factor(carrera))) +
  geom_point() +
  geom_line()+
  labs(title = 'Evolución tasa de aprobación de finales por carrera \n 2017-2023 \n Ciclo básico',
       x = "Año", y = "Aprobados") +
  scale_color_discrete(name = "Carrera") +
  #scale_x_discrete(labels = waiver())+
  scale_y_continuous(limits= c(10,80),breaks = seq(30,90, by = 10))+
  geom_hline(yintercept = c(30,40,50,60,70,80), linetype = "dashed", color = "gray")+
  theme_classic(base_family = 'Montserrat')+
  theme(text=element_text(size=10,  family= 'Montserrat ExtraBold'))+
  theme(
    panel.background = element_rect(fill='transparent'), #transparent panel bg
    plot.background = element_rect(fill='transparent', color=NA), #transparent plot bg
    panel.grid.major = element_blank(), #remove major gridlines
    panel.grid.minor = element_blank(), #remove minor gridlines
    legend.background = element_rect(fill='transparent'), #transparent legend bg
    legend.box.background = element_rect(fill='transparent'),
    legend.position= c(0.5, 0.15),
    legend.direction = 'horizontal',
    plot.title = element_text(hjust = 0.5))


#### gráfico barras tasa de regularidad por carrera para ciclo básico ####

ggplotly(ggplot(data= cursada_carrera, aes(x = anio, y = aprobados_, color = as.factor(carrera))) +
           geom_point() +
           geom_line()+
           labs(title = 'Evolución tasa de regularización \n por carrera 2017-2022',
                x = "Año", y = "Aprobados") +
           scale_color_discrete(name = "Carrera") +
           scale_y_continuous(limits= c(10,75),breaks = seq(10,90, by =10))+
           geom_hline(yintercept = c(10,20,30,40,50,60,70), linetype = "dashed", color = "gray")+
           theme_classic(base_family = 'Montserrat')+
           theme(text=element_text(size=10,  family= 'Montserrat ExtraBold'))+
           theme(
             panel.background = element_rect(fill='transparent'), #transparent panel bg
             plot.background = element_rect(fill='transparent', color=NA), #transparent plot bg
             panel.grid.major = element_blank(), #remove major gridlines
             panel.grid.minor = element_blank(), #remove minor gridlines
             legend.background = element_rect(fill='transparent'), #transparent legend bg
             legend.box.background = element_rect(fill='transparent'),
             legend.position= c(0.5, 0.2),
             legend.direction = 'horizontal',
             plot.title = element_text(hjust = 0.5)))


ggplot(data= cursada_carrera_ciclo_b, aes(x = anio, y = aprobados_, color = as.factor(carrera))) +
  geom_point() +
  geom_line()+
  labs(title = 'Evolución tasa de regularización por carrera \n  2017-2022 \n Ciclo básico',
       x = "Año", y = "Tasa de regularización") +
  scale_color_discrete(name = "Carrera") +
  scale_y_continuous(limits= c(10,75),breaks = seq(10,90, by =10))+
  geom_hline(yintercept = c(10,20,30,40,50,60), linetype = "dashed", color = "gray")+
  theme_classic(base_family = 'Montserrat')+
  theme(text=element_text(size=10,  family= 'Montserrat ExtraBold'))+
  theme(
    panel.background = element_rect(fill='transparent'), #transparent panel bg
    plot.background = element_rect(fill='transparent', color=NA), #transparent plot bg
    panel.grid.major = element_blank(), #remove major gridlines
    panel.grid.minor = element_blank(), #remove minor gridlines
    legend.background = element_rect(fill='transparent'), #transparent legend bg
    legend.box.background = element_rect(fill='transparent'),
    legend.position= c(0.5, 0.9),
    legend.direction = 'horizontal',
    plot.title = element_text(hjust = 0.5))

ggplotly(ggplot(data= cursada_carrera_ciclo_s, aes(x = anio, y = aprobados_, color = as.factor(carrera))) +
           geom_point() +
           geom_line()+
           labs(title = 'Evolución tasa de regularización por carrera \n  2017-2022 \n Ciclo superior',
                x = "Año", y = "Tasa de regularización") +
           scale_color_discrete(name = "Carrera") +
           scale_y_continuous(limits= c(40,100),breaks = seq(10,95, by =10))+
           geom_hline(yintercept = c(50, 60,70,80,90), linetype = "dashed", color = "gray")+
           theme_classic(base_family = 'Montserrat')+
           theme(text=element_text(size=10,  family= 'Montserrat ExtraBold'))+
           theme(
             panel.background = element_rect(fill='transparent'), #transparent panel bg
             plot.background = element_rect(fill='transparent', color=NA), #transparent plot bg
             panel.grid.major = element_blank(), #remove major gridlines
             panel.grid.minor = element_blank(), #remove minor gridlines
             legend.background = element_rect(fill='transparent'), #transparent legend bg
             legend.box.background = element_rect(fill='transparent'),
             legend.position= c(0.5, 0.2),
             legend.direction = 'horizontal',
             plot.title = element_text(hjust = 0.5)))

### Sacar datos materias ciclo superior otras carreras y comparar? ####

#### Ver egresos pre y post pandemia ###

egresados_LQ <- read_delim("C:/Users/Gonzalo/Desktop/datos/egresados_LQ.TXT", 
                           delim = "\t", escape_double = FALSE, 
                           col_types = cols(fecha_ingreso = col_date(format = "%d/%m/%Y"), 
                                            fecha_egreso = col_date(format = "%d/%m/%Y")), 
                           locale = locale(encoding = "WINDOWS-1252"), 
                           trim_ws = TRUE)

egresados_LQ<-subset(egresados_LQ, nomtitulo!= "Bachiller Universitario con Mención en Química")
egresados_LQ$years_difference <- as.numeric(difftime(egresados_LQ$fecha_egreso, egresados_LQ$fecha_ingreso, units = "weeks") / 52.177457)
egresados_LQ <- subset(egresados_LQ, years_difference >= 5)

egresados_F <- read_delim("C:/Users/Gonzalo/Desktop/datos/egresados_F.TXT", 
                          delim = "\t", escape_double = FALSE, 
                          col_types = cols(fecha_ingreso = col_date(format = "%d/%m/%Y"), 
                                           fecha_egreso = col_date(format = "%d/%m/%Y")), 
                          locale = locale(encoding = "WINDOWS-1252"), 
                          trim_ws = TRUE)
egresados_F<-subset(egresados_F, nomtitulo!= "Bachiller Universitario con Mención en Química")
egresados_F$years_difference <- as.numeric(difftime(egresados_F$fecha_egreso, 
                                                    egresados_F$fecha_ingreso, units = "weeks") / 52.177457)
egresados_F <- subset(egresados_F, years_difference >= 5)


egresados_B <- read_delim("C:/Users/Gonzalo/Desktop/datos/egresados_B.TXT", 
                          delim = "\t", escape_double = FALSE, 
                          col_types = cols(fecha_ingreso = col_date(format = "%d/%m/%Y"), 
                                           fecha_egreso = col_date(format = "%d/%m/%Y")), 
                          locale = locale(encoding = "WINDOWS-1252"), 
                          trim_ws = TRUE)
egresados_B<-subset(egresados_B, nomtitulo!= "Bachiller Universitario con Mención en Química")
egresados_B$years_difference <- as.numeric(difftime(egresados_B$fecha_egreso, 
                                                    egresados_B$fecha_ingreso, units = "weeks") / 52.177457)

egresados_B <- subset(egresados_B, years_difference >= 5)


egresados_LA <- read_delim("C:/Users/Gonzalo/Desktop/datos/egresados_LA.TXT", 
                           delim = "\t", escape_double = FALSE, 
                           col_types = cols(fecha_ingreso = col_date(format = "%d/%m/%Y"), 
                                            fecha_egreso = col_date(format = "%d/%m/%Y")), 
                           locale = locale(encoding = "WINDOWS-1252"), 
                           trim_ws = TRUE)
egresados_LA<-subset(egresados_LA, nomtitulo!= "Bachiller Universitario con Mención en Química")
egresados_LA$years_difference <- as.numeric(difftime(egresados_LA$fecha_egreso, 
                                                     egresados_LA$fecha_ingreso, units = "weeks") / 52.177457)

egresados_LA <- subset(egresados_LA, years_difference >= 5)

egresados_LB <- read_delim("C:/Users/Gonzalo/Desktop/datos/egresados_LB.TXT", 
                           delim = "\t", escape_double = FALSE, 
                           col_types = cols(fecha_ingreso = col_date(format = "%d/%m/%Y"), 
                                            fecha_egreso = col_date(format = "%d/%m/%Y")), 
                           locale = locale(encoding = "WINDOWS-1252"), 
                           trim_ws = TRUE)
egresados_LB<-subset(egresados_LB, nomtitulo!= "Bachiller Universitario con Mención en Química")
egresados_LB$years_difference <- as.numeric(difftime(egresados_LB$fecha_egreso, 
                                                     egresados_LB$fecha_ingreso, units = "weeks") / 52.177457)

egresados_LB <- subset(egresados_LB, years_difference >= 5)

egresados_PQ <- read_delim("C:/Users/Gonzalo/Desktop/datos/egresados_PQ.TXT", 
                           delim = "\t", escape_double = FALSE, 
                           col_types = cols(fecha_ingreso = col_date(format = "%d/%m/%Y"), 
                                            fecha_egreso = col_date(format = "%d/%m/%Y")), 
                           locale = locale(encoding = "WINDOWS-1252"), 
                           trim_ws = TRUE)
egresados_PQ<-subset(egresados_PQ, nomtitulo!= "Bachiller Universitario con Mención en Química")
egresados_PQ$years_difference <- as.numeric(difftime(egresados_PQ$fecha_egreso, 
                                                     egresados_PQ$fecha_ingreso, units = "weeks") / 52.177457)

egresados_PQ <- subset(egresados_PQ, years_difference >= 5)

egresados_LB$anio_ingreso <- year(egresados_LB$fecha_ingreso)


ingresos_2000 <- subset(egresados_LB, anio_ingreso > 1999)

median_excluding_outliers <- function(x) {
  q <- quantile(x, probs = c(0.25, 0.75))  # Calculate the first and third quartiles
  iqr <- q[2] - q[1]  # Calculate the interquartile range (IQR)
  lower_bound <- q[1] - 1.5 * iqr  # Calculate the lower bound
  upper_bound <- q[2] + 1.5 * iqr  # Calculate the upper bound
  
  # Exclude outliers
  x <- x[x >= lower_bound & x <= upper_bound]
  
  # Recalculate the median
  median(x)
}

median_excluding_outliers(ingresos_2000$years_difference)











median(ingresos_2000$years_difference)
median(egresados_LB$years_difference)
boxplot(egresados_LB$years_difference)

b


##### gráfico egresos #####

egresados_B$anio_egreso <- format(egresados_B$fecha_egreso, "%Y")
egresados_LB$anio_egreso <- format(egresados_LB$fecha_egreso, "%Y")
egresados_F$anio_egreso <- format(egresados_F$fecha_egreso, "%Y")
egresados_LQ$anio_egreso <- format(egresados_LQ$fecha_egreso, "%Y")
egresados_LA$anio_egreso <- format(egresados_LA$fecha_egreso, "%Y")
egresados_PQ$anio_egreso <- format(egresados_PQ$fecha_egreso, "%Y")

egresados_t <- full_join(egresados_B, egresados_F)
egresados_t <- full_join(egresados_t, egresados_LB)
egresados_t <- full_join(egresados_t, egresados_LQ)
egresados_t <- full_join(egresados_t, egresados_LA)
egresados_t <- full_join(egresados_t, egresados_PQ)

egresados_PQ$numero_per_lect <- as.character(egresados_PQ$numero_per_lect)
egresados_PQ$unidad_per_lect <- as.character(egresados_PQ$unidad_per_lect)


ggplot(egresados_t, aes(x = anio_egreso)) +
  geom_bar(stat = "count", fill = "blue") +
  labs(title = "Número de egresados por año",
       x = "Año de egreso",
       y = "Número de egresados") +
  theme_classic(base_family = 'Montserrat')+
  theme(text=element_text(size=10,  family= 'Montserrat ExtraBold'))+
  theme(
    panel.background = element_rect(fill='transparent'), #transparent panel bg
    plot.background = element_rect(fill='transparent', color=NA), #transparent plot bg
    panel.grid.major = element_blank(), #remove major gridlines
    panel.grid.minor = element_blank(), #remove minor gridlines
    legend.background = element_rect(fill='transparent'), #transparent legend bg
    legend.box.background = element_rect(fill='transparent'),
    legend.position= c(0.5, 0.2),
    legend.direction = 'horizontal',
    plot.title = element_text(hjust = 0.5))

ggplot(egresados_t, aes(x = anio_egreso)) +
  geom_point(stat = "count", size = 2) + # Add dots representing the count
  geom_line(stat = "count", aes(group = 1), color = "blue") + # Add a line connecting the dots
  labs(title = "Número de egresados por año \n 2017-2022",
       x = "Año de egreso",
       y = "Número de egresados")+
  scale_y_continuous(limits = c(90,215), breaks = seq(90,210, by = 10))+
  theme_classic(base_family = 'Montserrat')+
  theme(text=element_text(size=10,  family= 'Montserrat ExtraBold'))+
  theme(
    panel.background = element_rect(fill='transparent'), #transparent panel bg
    plot.background = element_rect(fill='transparent', color=NA), #transparent plot bg
    panel.grid.major = element_blank(), #remove major gridlines
    panel.grid.minor = element_blank(), #remove minor gridlines
    legend.background = element_rect(fill='transparent'), #transparent legend bg
    legend.box.background = element_rect(fill='transparent'),
    legend.position= c(0.5, 0.2),
    legend.direction = 'horizontal',
    plot.title = element_text(hjust = 0.5))


egresados_t <- filter(egresados_t, nomtitulo != 'Bachiller Universitario')

egresados_2020 <- egresados_t %>% filter(anio_egreso == 2020)
egresados_2020$nombre...2 <- factor(egresados_2020$nombre...2)

egresados_2019 <- egresados_t %>% filter(anio_egreso == 2019)

egresados_2019_ <- egresados_2019 %>% 
  group_by(nomtitulo) %>% 
  summarise(graduados_2019 = n())

egresados_2020_$graduados_2019 <- egresados_2019_$graduados_2019
egresados_2020_$caida <- ((egresados_2020_$num_graduates-egresados_2020_$graduados_2019)/egresados_2020_$graduados_2019)*100

summary_df <- egresados_2020 %>%
  group_by(nomtitulo) %>%
  summarise(num_graduates = n())

egresados_2020_ <- egresados_2020 %>%
  group_by(nombre...2) %>%
  summarise(num_graduates = n())





ggplot(egresados_2020_, aes(x = nombre...2, y = num_graduates)) +
  geom_segment(aes(xend = nombre...2, yend = 0), size = 1, color = "blue") +
  geom_point(size = 3, color = "orange") +
  scale_y_continuous(limits = c(0,45), breaks = seq(0,45, by = 5))+
  coord_flip() +  # To make it a horizontal lollipop plot
  labs(title = "Total Number of Graduates in 2020 by Carrera",
       x = "Field of Study",
       y = "Total Number of Graduates")+
  theme_classic(base_family = 'Montserrat')+
  theme(text=element_text(size=10,  family= 'Montserrat ExtraBold'))+
  theme(
    panel.background = element_rect(fill='transparent'), #transparent panel bg
    plot.background = element_rect(fill='transparent', color=NA), #transparent plot bg
    panel.grid.major = element_blank(), #remove major gridlines
    panel.grid.minor = element_blank(), #remove minor gridlines
    legend.background = element_rect(fill='transparent'), #transparent legend bg
    legend.box.background = element_rect(fill='transparent'),
    legend.position= c(0.5, 0.2),
    legend.direction = 'horizontal',
    plot.title = element_text(hjust = 0.5))

ggplot(egresados_2020_, aes(x = nombre...2, y = caida)) +
  geom_segment(aes(xend = nombre...2, yend = 0), size = 1, color = "blue") +
  geom_point(size = 3, color = "orange") +
  scale_y_continuous(limits = c(-100,200), breaks = seq(-100,200, by = 20))+
  geom_hline(yintercept = 0, linetype = "dashed", color = "gray")+
  coord_flip() +  # To make it a horizontal lollipop plot
  labs(title = "Cambio porcentual de número de egresados en 2020 \n con respecto a 2019 \n por carrera",
       x = "",
       y = "Cambio porcentual (%)")+
  theme_classic(base_family = 'Montserrat')+
  theme(text=element_text(size=10,  family= 'Montserrat ExtraBold'))+
  theme(
    panel.background = element_rect(fill='transparent'), #transparent panel bg
    plot.background = element_rect(fill='transparent', color=NA), #transparent plot bg
    panel.grid.major = element_blank(), #remove major gridlines
    panel.grid.minor = element_blank(), #remove minor gridlines
    legend.background = element_rect(fill='transparent'), #transparent legend bg
    legend.box.background = element_rect(fill='transparent'),
    legend.position= c(0.5, 0.2),
    legend.direction = 'horizontal',
    plot.title = element_text(hjust = 0.5))



ggplot(egresados_B, aes(x = anio_egreso)) +
  geom_bar(stat = "count", fill = "blue") +
  labs(title = "Número de egresados por año \n Bioquímica",
       x = "Año de egreso",
       y = "Número de egresados") +
  theme_classic(base_family = 'Montserrat')+
  theme(text=element_text(size=10,  family= 'Montserrat ExtraBold'))+
  theme(
    panel.background = element_rect(fill='transparent'), #transparent panel bg
    plot.background = element_rect(fill='transparent', color=NA), #transparent plot bg
    panel.grid.major = element_blank(), #remove major gridlines
    panel.grid.minor = element_blank(), #remove minor gridlines
    legend.background = element_rect(fill='transparent'), #transparent legend bg
    legend.box.background = element_rect(fill='transparent'),
    legend.position= c(0.5, 0.2),
    legend.direction = 'horizontal',
    plot.title = element_text(hjust = 0.5))

ggplot(egresados_LB, aes(x = anio_egreso)) +
  geom_bar(stat = "count", fill = "blue") +
  labs(title = "Número de egresados por año \n Lic. Biotecnología",
       x = "Año de egreso",
       y = "Número de egresados") +
  theme_classic(base_family = 'Montserrat')+
  theme(text=element_text(size=10,  family= 'Montserrat ExtraBold'))+
  theme(
    panel.background = element_rect(fill='transparent'), #transparent panel bg
    plot.background = element_rect(fill='transparent', color=NA), #transparent plot bg
    panel.grid.major = element_blank(), #remove major gridlines
    panel.grid.minor = element_blank(), #remove minor gridlines
    legend.background = element_rect(fill='transparent'), #transparent legend bg
    legend.box.background = element_rect(fill='transparent'),
    legend.position= c(0.5, 0.2),
    legend.direction = 'horizontal',
    plot.title = element_text(hjust = 0.5))

ggplot(egresados_F, aes(x = anio_egreso)) +
  geom_bar(stat = "count", fill = "blue") +
  labs(title = "Número de egresados por año \n Farmacia",
       x = "Año de egreso",
       y = "Número de egresados") +
  theme_classic(base_family = 'Montserrat')+
  theme(text=element_text(size=10,  family= 'Montserrat ExtraBold'))+
  theme(
    panel.background = element_rect(fill='transparent'), #transparent panel bg
    plot.background = element_rect(fill='transparent', color=NA), #transparent plot bg
    panel.grid.major = element_blank(), #remove major gridlines
    panel.grid.minor = element_blank(), #remove minor gridlines
    legend.background = element_rect(fill='transparent'), #transparent legend bg
    legend.box.background = element_rect(fill='transparent'),
    legend.position= c(0.5, 0.2),
    legend.direction = 'horizontal',
    plot.title = element_text(hjust = 0.5))

ggplot(egresados_LQ, aes(x = anio_egreso)) +
  geom_bar(stat = "count", fill = "blue") +
  labs(title = "Número de egresados por año \n Lic. Química",
       x = "Año de egreso",
       y = "Número de egresados") +
  theme_classic(base_family = 'Montserrat')+
  theme(text=element_text(size=10,  family= 'Montserrat ExtraBold'))+
  theme(
    panel.background = element_rect(fill='transparent'), #transparent panel bg
    plot.background = element_rect(fill='transparent', color=NA), #transparent plot bg
    panel.grid.major = element_blank(), #remove major gridlines
    panel.grid.minor = element_blank(), #remove minor gridlines
    legend.background = element_rect(fill='transparent'), #transparent legend bg
    legend.box.background = element_rect(fill='transparent'),
    legend.position= c(0.5, 0.2),
    legend.direction = 'horizontal',
    plot.title = element_text(hjust = 0.5))

ggplot(egresados_LA, aes(x = anio_egreso)) +
  geom_bar(stat = "count", fill = "blue") +
  labs(title = "Número de egresados por año \n LCyT Alimentos",
       x = "Año de egreso",
       y = "Número de egresados") +
  theme_classic(base_family = 'Montserrat')+
  theme(text=element_text(size=10,  family= 'Montserrat ExtraBold'))+
  theme(
    panel.background = element_rect(fill='transparent'), #transparent panel bg
    plot.background = element_rect(fill='transparent', color=NA), #transparent plot bg
    panel.grid.major = element_blank(), #remove major gridlines
    panel.grid.minor = element_blank(), #remove minor gridlines
    legend.background = element_rect(fill='transparent'), #transparent legend bg
    legend.box.background = element_rect(fill='transparent'),
    legend.position= c(0.5, 0.2),
    legend.direction = 'horizontal',
    plot.title = element_text(hjust = 0.5))

ggplot(egresados_PQ, aes(x = anio_egreso)) +
  geom_bar(stat = "count", fill = "blue") +
  labs(title = "Número de egresados por año \n Prof. Química",
       x = "Año de egreso",
       y = "Número de egresados") +
  theme_classic(base_family = 'Montserrat')+
  theme(text=element_text(size=10,  family= 'Montserrat ExtraBold'))+
  theme(
    panel.background = element_rect(fill='transparent'), #transparent panel bg
    plot.background = element_rect(fill='transparent', color=NA), #transparent plot bg
    panel.grid.major = element_blank(), #remove major gridlines
    panel.grid.minor = element_blank(), #remove minor gridlines
    legend.background = element_rect(fill='transparent'), #transparent legend bg
    legend.box.background = element_rect(fill='transparent'),
    legend.position= c(0.5, 0.2),
    legend.direction = 'horizontal',
    plot.title = element_text(hjust = 0.5))





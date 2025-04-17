library(tidyverse)
egresados_B <- read_delim("C:/Users/Gonzalo/Desktop/egresados_B.TXT", delim = "\t", escape_double = FALSE, 
col_types = cols(fecha_ingreso = col_date(format = "%d/%m/%Y"), 
                 fecha_egreso = col_date(format = '%d/%m/%Y')), 
locale = locale(date_names = "es", date_format = "%d%m%y", 
decimal_mark = ",", encoding = "WINDOWS-1252"), 
trim_ws = TRUE)


##### Cursada primer cuatrimestre ##########

cursada_1c_2017 <- read_delim("C:/Users/Gonzalo/Desktop/cursadas/cursada_1c_2017.TXT", 
delim = "\t", escape_double = FALSE, 
col_types = cols(fecha_inscN = col_datetime(format = "%d/%m/%Y %H:%M:%S")), 
locale = locale(date_names = "es", encoding = "WINDOWS-1252"), 
trim_ws = TRUE)

cursada_1c_2018 <- read_delim("C:/Users/Gonzalo/Desktop/cursadas/cursada_1c_2018.TXT", 
                              delim = "\t", escape_double = FALSE, 
                              col_types = cols(fecha_inscN = col_datetime(format = "%d/%m/%Y %H:%M:%S")), 
                              locale = locale(date_names = "es", encoding = "WINDOWS-1252"), 
                              trim_ws = TRUE)

cursada_1c_2019 <- read_delim("C:/Users/Gonzalo/Desktop/cursadas/cursada_1c_2019.TXT", 
                              delim = "\t", escape_double = FALSE, 
                              col_types = cols(fecha_inscN = col_datetime(format = "%d/%m/%Y %H:%M:%S")), 
                              locale = locale(date_names = "es", encoding = "WINDOWS-1252"), 
                              trim_ws = TRUE)

cursada_1c_2020 <- read_delim("C:/Users/Gonzalo/Desktop/cursadas/cursada_1c_2020.TXT", 
                              delim = "\t", escape_double = FALSE, 
                              col_types = cols(fecha_inscN = col_datetime(format = "%d/%m/%Y %H:%M:%S")), 
                              locale = locale(date_names = "es", encoding = "WINDOWS-1252"), 
                              trim_ws = TRUE)

cursada_1c_2021 <- read_delim("C:/Users/Gonzalo/Desktop/cursadas/cursada_1c_2021.TXT", 
                              delim = "\t", escape_double = FALSE, 
                              col_types = cols(fecha_inscN = col_datetime(format = "%d/%m/%Y %H:%M:%S")), 
                              locale = locale(date_names = "es", encoding = "WINDOWS-1252"), 
                              trim_ws = TRUE)
cursada_1c_2022 <- read_delim("C:/Users/Gonzalo/Desktop/cursadas/cursada_1c_2022.TXT", 
                              delim = "\t", escape_double = FALSE, 
                              col_types = cols(fecha_inscN = col_datetime(format = "%d/%m/%Y %H:%M:%S")), 
                              locale = locale(date_names = "es", encoding = "WINDOWS-1252"), 
                              trim_ws = TRUE)
cursada_1c_2023 <- read_delim("C:/Users/Gonzalo/Desktop/cursadas/cursada_1c_2023.TXT", 
                              delim = "\t", escape_double = FALSE, 
                              col_types = cols(fecha_inscN = col_datetime(format = "%d/%m/%Y %H:%M:%S")), 
                              locale = locale(date_names = "es", encoding = "WINDOWS-1252"), 
                              trim_ws = TRUE)


##### Cursada 2do cuatrimestre #####


cursada_2c_2017 <- read_delim("C:/Users/Gonzalo/Desktop/cursadas/cursada_2c_2017.TXT", 
                              delim = "\t", escape_double = FALSE, 
                              col_types = cols(fecha_inscN = col_datetime(format = "%d/%m/%Y %H:%M:%S")), 
                              locale = locale(date_names = "es", encoding = "WINDOWS-1252"), 
                              trim_ws = TRUE)

cursada_2c_2018 <- read_delim("C:/Users/Gonzalo/Desktop/cursadas/cursada_2c_2018.TXT", 
                              delim = "\t", escape_double = FALSE, 
                              col_types = cols(fecha_inscN = col_datetime(format = "%d/%m/%Y %H:%M:%S")), 
                              locale = locale(date_names = "es", encoding = "WINDOWS-1252"), 
                              trim_ws = TRUE)

cursada_2c_2019 <- read_delim("C:/Users/Gonzalo/Desktop/cursadas/cursada_2c_2019.TXT", 
                              delim = "\t", escape_double = FALSE, 
                              col_types = cols(fecha_inscN = col_datetime(format = "%d/%m/%Y %H:%M:%S")), 
                              locale = locale(date_names = "es", encoding = "WINDOWS-1252"), 
                              trim_ws = TRUE)

cursada_2c_2020 <- read_delim("C:/Users/Gonzalo/Desktop/cursadas/cursada_2c_2020.TXT", 
                              delim = "\t", escape_double = FALSE, 
                              col_types = cols(fecha_inscN = col_datetime(format = "%d/%m/%Y %H:%M:%S")), 
                              locale = locale(date_names = "es", encoding = "WINDOWS-1252"), 
                              trim_ws = TRUE)

cursada_2c_2021 <- read_delim("C:/Users/Gonzalo/Desktop/cursadas/cursada_2c_2021.TXT", 
                              delim = "\t", escape_double = FALSE, 
                              col_types = cols(fecha_inscN = col_datetime(format = "%d/%m/%Y %H:%M:%S")), 
                              locale = locale(date_names = "es", encoding = "WINDOWS-1252"), 
                              trim_ws = TRUE)

cursada_2c_2022 <- read_delim("C:/Users/Gonzalo/Desktop/cursadas/cursada_2c_2022.TXT", 
                              delim = "\t", escape_double = FALSE, 
                              col_types = cols(fecha_inscN = col_datetime(format = "%d/%m/%Y %H:%M:%S")), 
                              locale = locale(date_names = "es", encoding = "WINDOWS-1252"), 
                              trim_ws = TRUE)

cursada_2c_2023 <- read_delim("C:/Users/Gonzalo/Desktop/cursadas/cursada_2c_2023.TXT", 
                              delim = "\t", escape_double = FALSE, 
                              col_types = cols(fecha_inscN = col_datetime(format = "%d/%m/%Y %H:%M:%S")), 
                              locale = locale(date_names = "es", encoding = "WINDOWS-1252"), 
                              trim_ws = TRUE)


###### Cursadas anuales ###### 
cursada_anual_2017 <- read_delim("C:/Users/Gonzalo/Desktop/cursadas/cursada_anual_2017.TXT", 
                              delim = "\t", escape_double = FALSE, 
                              col_types = cols(fecha_inscN = col_datetime(format = "%d/%m/%Y %H:%M:%S")), 
                              locale = locale(date_names = "es", encoding = "WINDOWS-1252"), 
                              trim_ws = TRUE)

cursada_anual_2018 <- read_delim("C:/Users/Gonzalo/Desktop/cursadas/cursada_anual_2018.TXT", 
                                 delim = "\t", escape_double = FALSE, 
                                 col_types = cols(fecha_inscN = col_datetime(format = "%d/%m/%Y %H:%M:%S")), 
                                 locale = locale(date_names = "es", encoding = "WINDOWS-1252"), 
                                 trim_ws = TRUE)
cursada_anual_2019 <- read_delim("C:/Users/Gonzalo/Desktop/cursadas/cursada_anual_2019.TXT", 
                                 delim = "\t", escape_double = FALSE, 
                                 col_types = cols(fecha_inscN = col_datetime(format = "%d/%m/%Y %H:%M:%S")), 
                                 locale = locale(date_names = "es", encoding = "WINDOWS-1252"), 
                                 trim_ws = TRUE)
cursada_anual_2020 <- read_delim("C:/Users/Gonzalo/Desktop/cursadas/cursada_anual_2020.TXT", 
                                 delim = "\t", escape_double = FALSE, 
                                 col_types = cols(fecha_inscN = col_datetime(format = "%d/%m/%Y %H:%M:%S")), 
                                 locale = locale(date_names = "es", encoding = "WINDOWS-1252"), 
                                 trim_ws = TRUE)
cursada_anual_2021 <- read_delim("C:/Users/Gonzalo/Desktop/cursadas/cursada_anual_2021.TXT", 
                                 delim = "\t", escape_double = FALSE, 
                                 col_types = cols(fecha_inscN = col_datetime(format = "%d/%m/%Y %H:%M:%S")), 
                                 locale = locale(date_names = "es", encoding = "WINDOWS-1252"), 
                                 trim_ws = TRUE)
cursada_anual_2022 <- read_delim("C:/Users/Gonzalo/Desktop/cursadas/cursada_anual_2022.TXT", 
                                 delim = "\t", escape_double = FALSE, 
                                 col_types = cols(fecha_inscN = col_datetime(format = "%d/%m/%Y %H:%M:%S")), 
                                 locale = locale(date_names = "es", encoding = "WINDOWS-1252"), 
                                 trim_ws = TRUE)
cursada_anual_2023 <- read_delim("C:/Users/Gonzalo/Desktop/cursadas/cursada_anual_2023.TXT", 
                                 delim = "\t", escape_double = FALSE, 
                                 col_types = cols(fecha_inscN = col_datetime(format = "%d/%m/%Y %H:%M:%S")), 
                                 locale = locale(date_names = "es", encoding = "WINDOWS-1252"), 
                                 trim_ws = TRUE)




tabla_2017 <- tabyl(cursada_1c_2017, nombre_carrera, nombre_materia)

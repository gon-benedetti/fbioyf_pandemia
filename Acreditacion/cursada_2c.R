insc_2c <- read_delim("C:/Users/Gonzalo/Dropbox/Gonzalo 3.0/Acreditacion/12.9.TXT",
                        delim = "\t", escape_double = FALSE,
                        col_types = cols(tel_proc = col_double(),
                                         tel_per_lec = col_double(), celular = col_double(),
                                         fecha_inscN = col_datetime(format = "%d/%m/%Y %H:%M:%S")),
                        locale = locale(encoding = "WINDOWS-1252"),
                        trim_ws = TRUE)

fcia_clinica <- read_delim("C:/Users/Gonzalo/Dropbox/Gonzalo 3.0/Acreditacion/fciaclinica12.9.TXT",
                      delim = "\t", escape_double = FALSE,
                      col_types = cols(tel_proc = col_double(),
                                       tel_per_lec = col_double(), celular = col_double(),
                                       fecha_inscN = col_datetime(format = "%d/%m/%Y %H:%M:%S"),
                                       nro_inscripcion = col_double()),
                      locale = locale(encoding = "WINDOWS-1252"),
                      trim_ws = TRUE)

inscrip_2c <- full_join(insc_2c,fcia_clinica)

write_xlsx(inscrip_2c,"cursada_2c.xlsx")

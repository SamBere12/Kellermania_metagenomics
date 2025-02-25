library(readr)
library(ggplot2)
data <- read_delim("analisisR/allmetagenomassorted.tsv", 
                                   delim = "\t", escape_double = FALSE, 
                                   col_names = TRUE, trim_ws = TRUE)
as.data.frame(data)
#data= subset(data, data$gen != "kellermani_80s")
#View(allmetagenomassorted)

ggplot(data = data , aes(x = data$pos, y = log(data$depth))) +  
  geom_bar(stat = "identity", fill = "pink") +  # Crear las barras
  labs(x = "Columna 2", y = "Columna 3", title = "Gráfico de Barras") +
  facet_wrap(~ gen) +
  theme_minimal()

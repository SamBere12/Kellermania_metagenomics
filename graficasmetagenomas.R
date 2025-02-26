library(readr)
library(ggplot2)
data <- read_delim("analisisR/allmetagenomes.tsv", 
                                   delim = "\t", escape_double = FALSE, 
                                   col_names = TRUE, trim_ws = TRUE)
as.data.frame(data)
#data= subset(data, data$gen != "kellermani_80s")
data= subset(data, data$gen != "Kellermania_CBS136430_type_strain_RNA_polymerase_II")
data= subset(data, data$gen != "Kelag1scaffold_3")
data= subset(data, data$gen != "Kelag1_scaffold_2")
#View(allmetagenomassorted)

ggplot(data = data , aes(x = data$pos, y = log(data$depth))) +  
  geom_bar(stat = "identity", fill = "pink") +  # Crear las barras
  labs(x = "Position", y = "Depth", title = "Gráfico de Barras") +
  facet_grid(~ sample ~ gen ) +
  theme_minimal()

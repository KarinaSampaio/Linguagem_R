# Importando e manipulando bancos de dados

dados <- read.table("C:/Users/karin/OneDrive/Área de Trabalho/data science/AmostraBehavior.csv",
                    header = TRUE, sep = ";")

# Verificar as primeiras linhas do data frame para garantir que foi carregado corretamente
head(dados)

# Agora, você pode usar a função summary nas colunas apropriadas
summary(dados[, 2:6])

head(dados,5)

dim(dados)

nrow(dados)

dados <- dados[sample(nrow(dados), 1000), ]
dim(dados)

sample(100, 5)

names(dados)

# Resumos dados
head(dados, 3)

summary(dados[, 2:6])

# Operações dataframe
dados$Renda_por_dependente <- dados$RendaMensal/dados$N_dependentes
dados$soma1                <- dados$RendaMensal+dados$N_dependentes

dados["Renda_por_dependente"] <- dados["RendaMensal"]/(dados["N_dependentes"])

# Seleção de linhas e colunas
dados[1:5 ,]

dados[, c("Renda_por_dependente","soma1")]
dados[1:5 , c("Renda_por_dependente","soma1")]

# Seleção de casos
dados$RendaMensal[1:10]

dados$RendaMensal[1]

dados_depend <- subset(dados, dados$N_dependentes > 0)
head(dados_depend)

dados_depend2 <- subset(dados, dados$N_dependentes == 0 & dados$Idade > 40,
                        select = c(Id, Perf_final, UltPercLimit, N_dependentes, Idade))
head(dados_depend2)

dados_depend3 <- subset(dados, dados$N_dependentes %in% c(0,3,5,6,7) ,
                        select=c(Id, Perf_final, UltPercLimit, N_dependentes, Idade))
head(dados_depend3)

# Ordenar as infos
dados_ord <- dados_depend2[order(dados_depend2$Idade),]
head(dados_ord,10)

# Agrupamentos e tabelas
names(dados)

tab <- table(dados$Perf_final)
tab

prop.table(tab)*100

tab2 <- table(dados$Perf_final, dados$N_emprestimos)
round(prop.table(tab2),2)

library(dplyr)


library("dplyr")

# Resumo dos dados
sumar_dados <- dados %>%
  group_by(N_emprestimos) %>%
  summarise(
    mean_renda = mean(RendaMensal, na.rm = TRUE),
    mean_limite = mean(UltPercLimit, na.rm = TRUE),
    prop_mau = mean(Perf_final, na.rm = TRUE),
    volume = n()
  )

# Ver o resultado
sumar_dados

# Gerando alguns gráficos

counts <- table(dados$Perf_final)
barplot(counts, main = "Distribuição da performance",
                xlab = "Volume de bons e maus pagadores",
                names.arg=c("Bom", "Mau"),
                col = "#006699")

dados$Perf_final2[dados$Perf_final == 1] <- "Mau"
dados$Perf_final2[dados$Perf_final == 0] <- "Bom"

install.packages("ggplot2")
library(ggplot2)


# Criar gráfico
boxgg <- ggplot(data = dados, aes(x = Perf_final2, y = UltPercLimit, fill = Perf_final2,
                                  group = Perf_final2)) +
  geom_boxplot(aes(fill = Perf_final2), colour = "black") +
  geom_jitter(aes(color = Perf_final2), position = position_jitter(0.2), alpha = 0.1) +
  scale_fill_manual(values = c("#006699", "#ff0000")) +
  xlab("Bons e maus pagadores") + ylab("% de utilização do limite") +
  scale_colour_manual(values = c("#006699", "#ff0000")) +
  stat_summary(fun = median, geom = "point", shape = 23, size = 4, fill = "black",
               color = "black") +
  facet_wrap(~ CAT_RendaMensal, scales = "free", ncol = 6) +
  theme(
    axis.ticks.x = element_blank(),
    strip.background = element_rect(fill = "black"),
    strip.text.x = element_text(colour = "white", face = "bold"),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    plot.margin = margin(t = 0, r = 0, b = 0, l = 0, "cm")
  )

# Exibir o gráfico
boxgg
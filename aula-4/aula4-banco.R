#--- Script  ----
# Este script tem como base o instrumento Escala de autoestima de Roserberg. O download do banco de dados é feito rodando o script na sessão Importantdo banco de dados. Para rodar o código, lembre-se de clicar na linha e apertar as teclas control+enter ou o botão "Run".

#--- Importando banco de dados ----

dados  <- read.csv("autoestima.csv")

# ou use a função abaixo, tire o comentário.
# dados  <- read.csv(file.choose(), header=TRUE, sep=",")

#--- Estatística descritiva ----

# Dividindo grupos para comparação
# Usando a função subset

# objeto  <- subset(banco, critérios)
# dados$v6 igual a gênero, variando entre "Masculino" e "Feminino"
# dados$v3 igual a idade em anos

homens  <- subset(dados, dados$v6 == "Masculino" & dados$v3 < 25)

# repare que as variáveis do banco 'dados' sem mantém para o subset 'homens'.

# Função summary
summary(dados$v3)

# Função describe - requer pacote psych
install.packages("psych")

by(dados$v3, dados$v6, summary)

# Histograma - Variável númerica - ver se é normal
hist(dados$somaescala)

# qqplot - Variável númerica contra normal
qqnorm(dados$somaescala) # plota a distribuição
qqline(dados$somaescala) # plota a normal

# Boxplot - Variável númerica por categórica - Soma escala divido por gênero
boxplot(dados$somaescala ~ dados$v6)

# Scatter plot - Variavéis númericas - Soma escala por idade
plot(dados$somaescala, dados$v3)

# Gráfico de barras
barplot(table(dados$v6))

# Descrever dados
describe(dados$somaescala) # requer pacote psych carregado
summary(dados$somaescala)
mean(dados$somaescala, na.rm = TRUE)
sd(dados$somaescala, na.rm = TRUE)

# Teste T
t.test(dados$somaescala ~ dados$v6, paired=FALSE)

# Correlação bivariada
cor.test(dados$somaescala, dados$v3)

# Regressão
model1  <- lm(dados$somaescala ~ dados$v3)
summary(model1)
plot(model1) # ver diagnósticos



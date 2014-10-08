# Escala IDAT

##--- Importando Banco de Dados ---##
# Para importar o banco de dados, vá na planilha dos arquivos, escolha Arquivo -> Download -> arquivo csv.
# Digite o número de colunas do seu questionário
ncol  <-  32
# Escolha o arquivo baixado
idatBruto  <- read.csv(file.choose(), header=TRUE, fill = TRUE, col.names = paste0("v", seq_len(ncol)), na.strings = c("NA",""), encoding = "UTF8")

## Limpando a caquinha de ter editado o banco original no formulário docs
# Remover casos desnecessários. Casos maiores que 36 não existem, erros de importação devido a fórmula usada na coluna 32. Coluna 32 retirada porque o R will do the job for us below!

idat  <- idatBruto[1:36, 1:31]

#---- Soma do IDAT ----
idat$somaEscala  <- idat$v12 + idat$v13 + idat$v14 + idat$v15 + idat$v16 + idat$v17 + idat$v18 + idat$v19 + idat$v20 + idat$v21 + idat$v22 + idat$v23 + idat$v24 + idat$v25 + idat$v26 + idat$v27 + idat$v28 + idat$v29 + idat$v30 + idat$v31
  

#---- Recodificação segundo critério de  Spilberg, rs ----
# SPIELBERGER (1979):
# < 33 baixo
# 33-49 médio
# >49 alto

idat$trAnsiedade[idat$somaEscala < 33]  <- "baixo"
idat$trAnsiedade[idat$somaEscala >= 33 & idat$somaEscala <= 49 ]  <- "médio"
idat$trAnsiedade[idat$somaEscala > 49 ]  <- "alto"

# Em word, salvo em pdf
# 0 - Faça um guia das variáveis do banco com os valores possíveis segundo este exemplo - https://www.dropbox.com/s/2lccmbyqyscdn30/descricao-banco-auto-estima.pdf

# Script do R
# 1 - Qual a frequência de distribuição de pessoas por traços de ansiedade?
# 2 - Qual a medida de tendência central mais adequada para reportar a soma da escala (idat$somaEscala)?
# 4 - Qual gráfico você utilizaria para comparar os escores da escala (idat$somaEscala) por grupo que usa e não usa suplemento (idat$v9)?
# preparing the scale for efa ---------

# setting working directory
setwd("~/Dropbox/cursos/r-psicologia/efa-methods")

# packages
library(car)
library(psych)

# importing data.frame
dados  <- read.csv("self-stigma.csv", na.strings = c(777,888,999))
head(dados)

# subset self-stigma scale
selfStigma  <- dados[,16:44]
selfStigma  <- selfStigma[complete.cases(selfStigma), ]

# recoding resistência ao estigma
selfStigma$C14  <- Recode(selfStigma$C14, "4=1; 3=2; 2=3; 1=4")
selfStigma$C26  <- Recode(selfStigma$C26, "4=1; 3=2; 2=3; 1=4")
selfStigma$C27  <- Recode(selfStigma$C27, "4=1; 3=2; 2=3; 1=4")
selfStigma$C7  <- Recode(selfStigma$C7, "4=1; 3=2; 2=3; 1=4")
selfStigma$C24  <- Recode(selfStigma$C24, "4=1; 3=2; 2=3; 1=4")

#scale sum
soma  <- rowSums(selfStigma)

# cor entre fatores
round(cor(factors, method="kendall"),2)

#kmo - it seems marvelous .90
kmo = function( data ){
  library(MASS) 
  X <- cor(as.matrix(data)) 
  iX <- ginv(X) 
  S2 <- diag(diag((iX^-1)))
  AIS <- S2%*%iX%*%S2                      # anti-image covariance matrix
  IS <- X+AIS-2*S2                         # image covariance matrix
  Dai <- sqrt(diag(diag(AIS)))
  IR <- ginv(Dai)%*%IS%*%ginv(Dai)         # image correlation matrix
  AIR <- ginv(Dai)%*%AIS%*%ginv(Dai)       # anti-image correlation matrix
  a <- apply((AIR - diag(diag(AIR)))^2, 2, sum)
  AA <- sum(a) 
  b <- apply((X - diag(nrow(X)))^2, 2, sum)
  BB <- sum(b)
  MSA <- b/(b+a)                        # indiv. measures of sampling adequacy
  AIR <- AIR-diag(nrow(AIR))+diag(MSA)  # Examine the anti-image of the correlation matrix. That is the  negative of the partial correlations, partialling out all other variables.
  kmo <- BB/(AA+BB)                     # overall KMO statistic
  # Reporting the conclusion 
  if (kmo >= 0.00 && kmo < 0.50){test <- 'The KMO test yields a degree of common variance unacceptable for FA.'} 
  else if (kmo >= 0.50 && kmo < 0.60){test <- 'The KMO test yields a degree of common variance miserable.'} 
  else if (kmo >= 0.60 && kmo < 0.70){test <- 'The KMO test yields a degree of common variance mediocre.'} 
  else if (kmo >= 0.70 && kmo < 0.80){test <- 'The KMO test yields a degree of common variance middling.' } 
  else if (kmo >= 0.80 && kmo < 0.90){test <- 'The KMO test yields a degree of common variance meritorious.' }
  else { test <- 'The KMO test yields a degree of common variance marvelous.' }
  
  ans <- list( overall = kmo,
               report = test,
               individual = MSA,
               AIS = AIS,
               AIR = AIR )
  return(ans)
} 
kmo.selfStigma  <- kmo(selfStigma)
print(kmo.selfStigma$overall)

# Barlett test of homogeneity - ok - K^2 = 17758.05; p < 2.2e-16
bartlett.test(selfStigma)

# alpha or G6 and factors
alpha(selfStigma) # Overall - G6 = .92
# alienacao 
alpha(selfStigma[, c("C1", "C17","C21","C5","C16","C8")]) # G6 = .75
# aprovacao
alpha(selfStigma[, c("C29", "C18","C2","C19","C10","C6", "C23")]) # G6 = .70
# discriminacao
alpha(selfStigma[, c("C3", "C28","C22","C15","C25")]) # G6 = .69
# evitacao
alpha(selfStigma[, c("C11", "C9","C12","C20","C13","C4")]) # G6 = .78
# resistencia
alpha(selfStigma[, c("C14", "C26","C27","C7","C24")]) # G6 = .52

# efa - detecting factors techniques ------

# Cattel's Scree
pa  <- fa.parallel(selfStigma, fa="ml")
pa$nfact # nfactors 5
pa$ncomp # ncomp 2

# Very Simple Structure 
VSS(selfStigma) # nfactors 1

# ICLUST 
stigma.clus <- ICLUST(selfStigma)
stigma.clus # yelds 

# factor analysis
stigmaFa  <- fa(selfStigma, nfactors = 5 , rotate="varimax", fm = "ml")
print(stigmaFa)

print.psych(stigmaFa, cut = 0.4, sort = TRUE)

# Version 1 - Self-stigma ----
selfStigma  <- dados[,16:44]
selfStigma  <- selfStigma[complete.cases(selfStigma), ]

# Cattel's Scree
pa  <- fa.parallel(selfStigma, fa="ml")
pa$nfact # nfactors 5
pa$ncomp # ncomp 2

# Very Simple Structure 
VSS(selfStigma) # nfactors 1

# ICLUST 
stigma.clus <- ICLUST(selfStigma)
stigma.clus # yelds messy clusters

# factor analysis
stigmaFa  <- fa(selfStigma, nfactors = 5, rotate="varimax", fm = "ml")
print.psych(stigmaFa, cut = .39, sort = TRUE)

# One item showed high loading in factor 5. It seems a 4 factors model might be better.

# factor analysis
stigmaFa  <- fa(selfStigma, nfactors = 4, rotate="varimax", fm = "ml")
print.psych(stigmaFa, cut = .39, sort = TRUE)

# Version 2 - Self-stigma ----
# This version was created taking account lower loadings in 4 factors model - Items "C2", "C7","C14", "C18", "C20","C21","C24", "C25", "C29"" were wiped out.

selfStigma2  <- selfStigma[, c("C1", "C3", "C4", "C5", "C6", "C8", "C9", "C10", "C11", "C12", "C13", "C15", "C16", "C17", "C19", "C22", "C23", "C26", "C27","C28")]

# Cattel's Scree
pa2  <- fa.parallel(selfStigma2, fa="ml")
pa2$nfact # nfactors 5
pa2$ncomp # ncomp 2

# Very Simple Structure 
VSS(selfStigma2) # nfactors 1

# ICLUST 
stigma.clus2 <- ICLUST(selfStigma2)
stigma.clus2 # yelds messy clusters

# factor analysis
stigmaFa2  <- fa(selfStigma2, nfactors = 4 , rotate="varimax", fm = "ml")
print.psych(stigmaFa2, cut = .39, sort = TRUE)

# Factor 1 - "C9", "C12","C8","C5","C17","C13","C16","C11","C4","C1"
# Factor 2 - "C22", "C3", "C28", "C15", "C19"
# Factor 3 - "C26","C27"
# Factor 4 - "C6", "C23", "C10"

# Cronbach's alpha
alpha(selfStigma2)

# Cronbach's alpha
alpha(selfStigma)
# Factor 1
alpha(selfStigma[, c("C9", "C12","C8","C5","C13","C11","C4","C1")])
# Factor 2
alpha(selfStigma[, c("C22", "C3", "C28", "C15", "C19")])
# Factor 3
alpha(selfStigma[, c("C26","C27","C17","C16")])
# Factor 4
alpha(selfStigma[, c("C6", "C23", "C10")])
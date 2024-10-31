#Vektory
#Příklad 1:
vektor <- c(1.79, 3.28, 4.08, 0.65, 3.43, 3.51, 2.43, 2.45, 2.44, 2.11, 2.52, 2.00, 2.22, 3.06, 3.96)

cisla <- vektor[c(2,4,7,13)]
cisla

cisla2 <- cisla+10

prumerCisla <- mean(cisla)
prumerCisla

rozptylCisla <- var(cisla)

smerodatnaOdchylkaCislo <- sd(cisla)

kvartily <- quantile(cisla, probs = c(0.25, 0.75))
kvartily2 <- summary(cisla)

hist(cisla, col ='red', main = paste('Histogram: cisla'))

boxplot(cisla, col = 'blue', main = paste('Boxplot: cisla'))

#Matice
#příklad 2:

matice <- matrix(seq(2,24, by = 2), nrow = 4, ncol = 3, byrow = TRUE)
matice
m1 <- matice[3,] - 3
m1

m2 <- t(matice)
m2

m3 <- cbind(m2, rep(1, nrow(m2)))
m3
radek1 <- rep(c(6,10),length.out = 5)
radek2 <- rep(c(1,0), length.out = 5)

m4 <- rbind(m3, radek1, radek2)
m4

det(m4)

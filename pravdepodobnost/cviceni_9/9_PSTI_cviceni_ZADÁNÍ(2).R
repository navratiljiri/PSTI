################################################################################
## KIKM/PSTI: cviceni 9 - Bodove odhady a centralni limitni veta (CLV)
################################################################################

## -----------------------------------------------------------------------------
# Centralni limitni veta: ilustrace
## -----------------------------------------------------------------------------


# 1. Nagenerujeme si data, ktera nejsou normalne rozdelena -> uvazovana "populace"
set.seed(111)
population <- runif(1000, min = 0, max = 1) # Ro(0,1), 1000 ruznych hodnot

# Histogram populace
hist(population, breaks = 20, probability = TRUE, main = "Histogram: populace",
     col = "lightblue")
# probability = T -> k vykresleni hustoty ()

# 2. Z teto populace nagenerujeme nekolik NAHODNYCH VYBERU
sample_size <- 30   # velikost vyberu (30 se typicky udava jako nejmensi prijatelna velikost vyberu)
num_samples <- 300  # kolikrat nahodny vyber provedeme (K)

# provedeme vybery
?replicate # pomoci tento funkce muzeme provest K vyberu (daneho rozsahu) z dane populace
set.seed(234)
samples <- replicate(num_samples, sample(population, size = sample_size, replace = TRUE))
samples

# 3. Ciselne charakteristiky

# pro vyber:
sample_means <- colMeans(samples)
Ex <- mean(sample_mean)
Ex
var <- sd(sample_mean)


# pro populaci:
ExPopulation = mean(population)
VarPopulation = sd(population) / sample_size

# 4. Vizualizace

# Histogram pro vyberove prumery
hist(sample_means, breaks = 15, prob = TRUE, main = "Rozdeleni VYBEROVYCH PRUMERU",
     xlab = "Vyberovy prumer", col = "lightgreen")

# Krivka rozdeleni
curve(dnorm(x, mean = prum, sd = smodch), col = "red", lwd = 2, add = TRUE)

# srovnejme si populacni a vyberovy graf
par(mfrow = c(1,2)) # parametr mfrow -> rozlozeni vice grafu v 1 obrazku (zde 1 radek, 2 sloupce)

# a) Populace
hist(population, breaks = 20, probability = TRUE, main = "Histogram: populace", col = "lightblue")

# b) Histogram pro vyberove prumery
hist(sample_means, breaks = 15, prob = TRUE, main = "Rozdeleni VYBEROVYCH PRUMERU",
     xlab = "Vyberovy prumer", col = "lightgreen")
# Krivka rozdeleni
curve(dnorm(x, mean = prum, sd = smodch), col = "red", lwd = 2, add = TRUE)

par(mfrow = c(1,1)) # zpet k puvodnimu rozlozeni obrazku (1 obrazek -> 1 graf)

# -> z grafu vidime, ze rozdeleni VYBEROVYCH PRUMERU se blizi NORMALNIMU ROZDELENI,
# a to i presto, ze puvodni populace nebyla z normalniho rozdeleni

# ? Co kdybychom meli MENSI VYBER?
sample_size2 <- 5   # velikost vyberu 
num_samples <- 300  # kolikrat nahodny vyber provedeme (K)

# provedeme vybery
set.seed(234)
samples <- replicate(num_samples, sample(population, size = sample_size2, replace = TRUE))

# 3. Ciselne charakteristiky

# pro vyber:
sample_means2 <- colMeans(samples)
Ex2 <- mean(sample_means2)
Ex2
var2 <- sd(sample_means2)
var2
# pro populaci (zustava stejne)
mu;sigma;char2
Ex2Population = mean(population)
Var2Population = sd(population) / sample_size2


# -> vyberova smerodatna odchylka s rostouci velikosti vyberu KLESA

# srovnejme si populacni a vyberovy graf pro ruzne velikosti vyberu
par(mfrow = c(1,3)) # parametr mfrow -> rozlozeni vice grafu v 1 obrazku (zde 1 radek, 3 sloupce)

# a) Populace
hist(population, breaks = 20, probability = TRUE, main = "Histogram: populace", col = "lightblue")

# b) Histogram pro vyberove prumery, vyber = 5
hist(sample_means2, breaks = 15, prob = TRUE, main = "Rozdeleni VYBEROVYCH PRUMERU, size = 5",
     xlab = "Vyberovy prumer", col = "lightyellow")
# Krivka rozdeleni
curve(dnorm(x, mean = prum2, sd = smodch2), col = "red", lwd = 2, add = TRUE)

# c)Histogram pro vyberove prumery, vyber = 30
hist(sample_means, breaks = 15, prob = TRUE, main = "Rozdeleni VYBEROVYCH PRUMERU, size = 30",
     xlab = "Vyberovy prumer", col = "lightgreen")
# Krivka rozdeleni
curve(dnorm(x, mean = prum, sd = smodch), col = "red", lwd = 2, add = TRUE)

par(mfrow = c(1,1)) # zpet k puvodnimu rozlozeni obrazku (1 obrazek -> 1 graf)






## -----------------------------------------------------------------------------
# Centralni limitni veta: priklady
## -----------------------------------------------------------------------------

#### Priklad 1:
# Zamestnanec pravidelne dojizdi do prace tramvaji. Vime, doba cekani na prijezd tramvaje je 0-10min -> rovnomerne rozdeleni.
# Nahodna velicina Y: soucet cekacich dob pri 30 jizdach.
# Urcete:
# a) stredni hodnotu a rozptyl teto nahodne veliciny
# b) Jaka je pravdepodobnost, ze celkova doba cekani behem 30 jizd bude vyssi nez 170min?
# c) Urcete 92% oboustranny interval spolehlivosti pro cekaci dobu pri 30 jizdach (pomoci kvantilove funkce normalniho rozdeleni)
rm(list=ls())
# rovnomerne rozdeleni -> nahodna velicina X (cekani na tramvaj)

a <- 0
b <- 10

# a) pro 30 jizd -> nahodna velicina Y
EX <- (a+b)/2
varX <- (b-a)^2/12

n = 30
#číselní charakteristiky
Ey <- n * EX
varY <- n * varX
# b) P(Y > 170) = ?
                                #směrodatná odchylka 
Py <- 1 - pnorm(170, mean = Ey, sd = sqrt(varY))

# c) 92% interval spolehlivosti
# 1 - alfa = 0.92 -> alfa = 0.08
alfa <- 0.08
low <- qnorm(alfa/2, mean = Ey, sd = sqrt(varY))
up <- qnorm(1-alfa/2, mean = Ey, sd = sqrt(varY))

c(low, up)
#### Priklad 2:
# Vime, ze stredni hodnota hazeni kostkou je 3.5, rozptyl je 35/12. Predstavme si situaci,
# ze scitame vysledky nezavislych hodu kostkou.
# Nahodna velicina Y: soucet pri hodu 25 kostek naraz
# Urcete:
# a) stredny hodnotu a rozptyl nahodne veliciny Y
Ex <- 3.5
varX <- 35/12
n <- 25

Ey <- n * Ex
varY <- n * varX
# b) Jaka je pravdepodobnost, ze celkovy soucet pri 25 hodech bude vice nez 70?
Py2 <- 1 - pnorm(70, mean = Ey, sd = sqrt(varY))

# c) 99% interval spolehlivosti (pomoci vantilove funkce).


# a) Stredni hodnota a rozptyl nahodne veliciny Y


# b) P(Y > 70)

# c) 99% interval spolehlivost
# 1 - alfa = 0.99 -> alfa = 0.01
alfa <- 0.01
low <- qnorm(alfa/2, mean = Ey, sd = sqrt(varY))
up <- qnorm(1-alfa/2, mean = Ey, sd = sqrt(varY))


#### Priklad 3:
# Doba cekani na vyrizeni pozadavku "vyhledat zbozi ve skladu" se ridi exponencialnim rozdelenim.
# Jednotliva vyrizovani ozadavku jsou nezavisle jevy.
# Z delsiho pozorovani vime, ze stredni hodnota vyrizeni jednoho pozadavku je 10min.
# Nahodna veliciny Y: doba vyrizeni 25 pozadavku
# Urcete:
# a) stredni hodnotu a rozptyl nahodne veliciny Y
# b) Jaka je pravdepodobnost, ze celkova doba vyrizeni 25 pozadavku presahne 220min?
# c) 95% interval spolehlivosti

lambda <- 10 

# a) stredni hodnota a rozptyl
Ex <- lambda
varX <- lambda^2

# b) P(Y > 220) = ?
Ey <- 25 * Ex
varY <- 25 * varX
Py2 <- 1 - pnorm(220, mean = Ey, sd = sqrt(varY))

# c) 95% interval spolehlivosti
alfa <- 0.05
low <- qnorm(alfa/2, mean = Ey, sd = sqrt(varY))
up <- qnorm(1-alfa/2, mean = Ey, sd = sqrt(varY))


#### Priklad 4:
# Zamestnanec pravidelne dojizdi do prace metrem. Vime, ze doba cekani na prijezd metra je v 
# rannich hodinach mezi 0 a 3 minutami (jede kazde 3min).
# Nahodna velicina Y: soucet cekacich dob pri 35 jizdach
# Urcete:
# a) stredni hodnota a rozptyl nahodne veliciny Y
# b) Jaka je pravdepodobnost, ze celkova doba cekani behem techto 35 jizd bude vyssi nez 48min?
# c) 95% interval spolehlivosti



# a) stredni hodnota a rozptyl nahodne veliciny Y


# b) P(Y > 48)


# c) 95% interval spolehlivosti


rm(list=ls())
#### Priklad 5:
# Na zaklade drivejsich pozorovani vime, ze pravdepodobnost narozeni chlapce je 0.515.
# Urcete jaka je pravdepodobnost, ze mezi 10 000 novorozenci bude:
n = 10000
p = 0.515

Ex = n * p
varx = Ey * (1 - p)
# a) vice devcat nez chlapcu

sigma <- sqrt(varx)
Py2 <- pnorm(5000, mean = Ex, sd = sigma)

# b) chlapcu od 5000 do 5300
Py3 <-  pnorm(5300, mean = Ex, sd = sigma)
Py4 <- Py3 - Py2
# c) relativni cetnost chlapcu v mezich od 0.515 do 0.517
# Nahodna velicina X: pocet chlapcu mezi 10000 novorozenci
mu = p
sigma2 <- sqrt(p*(1-p)/2)
Py5 <- pnorm(0.515, mean = mu, sd = sigma2)
Py6 <- pnorm(0.517, mean = mu, sd = sigma2)
Py7 = Py6 - Py5
# -> aproximace binomickeho rozdeleni normalnim



# podle Moivreovey-Laplaceovy vety
# sigma = sqrt(n*p*(1-p))



# a) vice devcat nez chlapcu -> X < 5000



# b) chlapcu od 5000 do 5300


# c) relativni cetnost chlapcu v mezich od 0.515 do 0.517
# -> pouzijeme vetu pro podil



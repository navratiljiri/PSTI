################################################################################
## KIKM/PSTI: cviceni 8 - Spojita rozdeleni pravdepodobnosti
################################################################################

## -----------------------------------------------------------------------------
# Rovnomerne rozdeleni
## -----------------------------------------------------------------------------

# parametry rozdeleni: a,b (intervaly)
# stredni hodnota: E(X) = (a+b)/2
# rozptyl: var(X) = ((b-a)^2)/12

rm(list=ls())

?punif

#### Priklad 1:
# Pan XY dostal SMS, ze jeho zasilka bude dovezena mezi 13:00 a 16:00. Podle sdeleni dopravce
# lze dodani zasilky ocekavat kdykoliv v tomto casovem intervalu 3h.
# Nahodna velicina X: okamzik dodani zbozi mezi 13:00 a 16:00
# a) Urcete parametry rozdeleni
# b) Spocitejte stredni hodnotu nahodne veliciny
# c) Jaka je pravdepodobnost, ze bude zbozi dodano do 13:30?
# d) Jaka je pravdepodobnost, ze bude dodano mezi 14:00 a 15:30?
# e) Spocitejte kvartily nahodne veliciny X -> x_0.25, x_0.5, x_0.75
# f) Pokud zbozi neprislo do 13:30, jaka je pravdepodobnost, ze prijde do 14:30?


# a) Parametry:
a <- 13
b <- 16

# b) Stredni hodnota a rozptyl

Ex <- (a+b)/2
var <- ((b-a)^2)/12


# c) Jaka je pravdepodobnost, ze bude zbozi dodano do 13:30?
p1 <- punif(13.5, min = a, max = b)


# d) Jaka je pravdepodobnost, ze bude dodano mezi 14:00 a 15:30?
p2 <- punif(15.5, min = a, max = b) - punif(14, min = a, max = b)


# e) Spocitejte kvartily nahodne veliciny X -> x_0.25, x_0.5, x_0.75
qunif(p = c(0.25, 0.5, 0.75), min = a, max = b)

# f) Pokud zbozi neprislo do 13:30, jaka je pravdepodobnost, ze prijde do 14:30?
# podminka "po 13:30" -> P(X>13.5) = 1 - P(X<=13.5)
podminka1 <- 1 - punif(13.5, min = a, max = b)
p3 <- (punif(14.5, min = a, max = b) - punif(13.5, min = a, max = b)) / podminka1


#### Priklad 2:
# Autobus jezdi ze stanice v intervalech 5min. Predstavte si situaci, ze na zastavku
# prichazime nahodne (bez znalosti jizdniho radu). Vsechny doby na cekani, tj.
# od 0min po 5min, jsou stejne pravdepodobne. 
# a) Urcete E(X) a smerodatnou odchylku cekacich dob.
# b) Jaka je pravdepodobnost, ze budeme cekat mene nez 2min?
# c) Urcete kvantily 0.025, 0.5 a 0.975.
# d) Jaka je pravdepodobnost, ze budeme cekat dele nez 1min?

# parametry:


# a) Stredni hodnota a smerodatna odchylka


# b) P(X<2) = ?



# c) Urcete kvantily 0.25, 0.5 a 0.75.




# d) P(X>1) = ?




## -----------------------------------------------------------------------------
# Exponencialni rozdeleni
# doba když něco nastane 
## -----------------------------------------------------------------------------

# parametry: lambda
# stredni hodnota: E(X) = lambda
# rozptyl: var(X) = lambda^2

?pexp

#### Priklad 1:
# Vyrobni zarizeni ma poruchu v prumeru za 2000h.
# Nahodna velicina X: doba "cekani na poruchu" -> exponencialni rozdeleni
# a) Urcete parametry rozdeleni
# b) Urcete stredni hodnotu a rozptyl nahodne veliciny
# c) Jaka je pravdepodobnost, ze k poruse dojde mezi 5000h a 7000h?
# d) Stanovte hodnotu "t" tak, aby pravdepodobnost, ze zarizeni bude pracovat delsi dobu nez
#    "t" byla 0.99

# a) Parametry
lambda <- 2000

# b) Stredni hodota, rozptyl
ex <- lambda
var < lambda ^2


# c) Jaka je pravdepodobnost, ze k poruse dojde mezi 5000h a 7000h?
# -> P(5000 < X < 7000) = ?
F7000 <- pexp(7000, rate = 1/lambda)
F5000 <- pexp(5000, rate = 1/lambda)

pa <- F7000 - F5000

# d) Stanovte hodnotu "t" tak, aby pravdepodobnost, ze zarizeni bude pracovat delsi dobu nez
#    "t" byla 0.99

# hledame "t" tak, aby platilo: P(X>t) = 0.99
# P(X>t) = 1 - P(X<=t) = 1 - F(t) = 0.99
# z teto rovnice: 1 - F(t) = 0.99 -> F(t) = 0.01 -> 1-e^(-t/lambda) = 0.01 -> e^(-t/lambda) = 0.99
# dale tedy: -t/lambda = ln(0.99) -> t = -lambda*ln(0.99)

t <- lambda*log(0.99)

qexp(p = 0.01, rate = 1/lambda)



#### Priklad 2:
# Automobilka vyrabi model, ktery se v servise objevi s poruchou v prumeru za 2.5 roku.
# a) Urcete parametr rozdeleni, E(X) a var(X)
# b) urcete prvni a treti kvartil -> kvantily 0.25 a 0.75
# c) Jaka je pravdepodobnost, ze k poruse dojde nejdrive za 1 rok?
# d) Jaka je pravdepodobnost, ze k poruse dojde maximalne za 2 roky?
# e) Jaka je pravdepodobnost P(X<1|X<2)?

# a) Parametr, E(X), var(X)
lambda2 <- 2.5
ex2 <- lambda2
var <- lambda2^2

# b) urcete prvni a treti kvartil -> kvantily 0.25 a 0.75
qa <- qexp(p = c(0.25, 0.75), rate = 1/lambda2)

# c) P(X>1) = ?

p1 <- 1 - pexp(1, rate = 1/lambda2)


# d) P(X<2) = ?
p2 <- pexp(2, rate = 1/lambda2)

# e) P(X<1|X<2) = ?

px1 <- pexp(1, rate = 1/lambda2)
px2 <- pexp(2, rate = 1/lambda2)

px <- px1/px2

#### Priklad 3:
# Zivotnost vyrobku se ridi exponencialnim rozdelenim se stredni hodnotou 3 roky.
# Jak dlouhou zarucni dobu poskytne vyrobce zakaznikum, pokud chce, aby relativni cetnost
# vyrobku, ktere se behem zarucni doby porouchaji, byla 0.1 (x = 0.1)?


# vyjadrime: 1-e^(-x/lambda)  = 0,1
# odtud:  0,9 = e^(-x/lambda)
# odtud -x/3=ln(0,9) -> x = -lambda*ln(0,9)


## -----------------------------------------------------------------------------
# Normalni rozdeleni
## -----------------------------------------------------------------------------

# parametry: mu, sigma^2
# stredni hodnota: E(X) = mu
# rozptyl: var(X) = sigma^2

# pokud mu = 0, sigma^2 = 1 -> normovane normalni rozdeleni N(0,1)

?pnorm
# POZOR: parametry funkce jsou mean (mu -> stredni hodnota) a sd (sigma -> smerodatna odchylka, ne rozptyl!)

#### Priklad 1:
# Jaka je pravdepodobnost, ze nahodna velicina U s rozdelenim N(0,1) nabude hodnoty:
# a) mensi nez 1.64
# b) vetsi nez -1.64
# c) v mezich od -1.96 po 1.96
# d) vetsi nez 2.33
# e) mensi nez -2.33

# a) P(U < 1.64)
pnorm(1.64)
pnorm(1.64, mean = 0, sd = 1)

# b) P(U > -1.64) = 1 - P(U <= -1.64)

psigma <- 1 - pnorm(-1.64)

# c) P(-1.96 <= U <= 1.96)
p1sigma <- pnorm(1.96) - pnorm(-1.96)

# d) P(U > 2.33) = 1 - P(U <= 2.33)

p2sigma <- 1 - pnorm(2.33)


# e) P(U < -2.33)




#### Priklad 2:
# Uvazujme nahodnou velicinu X~N(20,16).
# Jaka je pravdepodobnost, ze nabude hodnoty:
# a) mensi nez 16
# b) vetsi nez 20
# c) v mezich od 12 do 28
# d) mensi nez 12 neo vetsi nez 28



# a) P(X < 16)

# b) P(X > 20) = 1 - P(X<=20)

# c) P(12 < X < 28)


# d) P(X<12 | X > 28)
# -> jevy nemaji prunik -> secteme pouze obe pravdepodobnosti

# P(X<12)

# P(X > 28) = 1 - P(X<=28)

# vysledek



#### Priklad 3:
# Nahodna velicina ma normalni rozdeleni, E(X) = 1.1, var(X) = 0.95.
# a) Urcete parametry rozdeleni
# b) Urcete prvni a treti kvartil -> x_0.25, x_0.75
# c) P(X > 1)
# d) P(X < 2)
# d) P(X<1 | X<2)

# a) Parametry:
mu <- 1.1
sigma <- sqrt(0.95)

# b) kvartily

qa <- qnorm(p = c(0.25,0.75), mean = mu, sd = sigma)

# c) P(X > 1) = 1 - P(X<=1)

px1 <- 1 - pnorm(1, mean = mu, sd = sigma)

# d) P(X < 2)

px2 <- pnorm(2, mean = mu, sd = sigma)
# d) P(X<1 | X<2)
pxx1 <- pnorm(1, mean = mu, sd = sigma)
pxx2 <- pnorm(2, mean = mu, sd = sigma)
pxx3 <- pxx1 / pxx2

#### Priklad 4: 
# Nahodna velicina X ma normalni rozdeleni s parametry mu, sigma^2 takove, ze plati
# P(X < 85) = 0.9 a P(X < 95) = 0.95. Jake jsou parametry tohoto rozdeleni?
# -> mu, sigma^2
# -> Pomuzeme si NORMOVANYM normalnim rozdelenim (velicina U) -> N(0,1)


# normovana velicina U: u = (x-mu)/sigma -> x = u*sigma + mu


# dve rovnice o dvou neznamych -> dosazujeme do x = u*sigma + mu
# 85 = 1.281552*sigma + mu
# 95 = 1.644854*sigma + mu
# -> druhou rovnici odecteme od prvni -> zbavime se mu:
# 10 = (1.644854 - 1.281552)*sigma


# sigma dosadime treba do prvni rovnice:


## -----------------------------------------------------------------------------
# Studentovo rozdeleni
## -----------------------------------------------------------------------------

# parametry: k (pocet stupnu volnosti)
# stredni hodnota:
# rozptyl:

?pt

#### Priklad 1
# Nahodna velicina X ma Studentovo rozdeleni se 3 stupni volnosti. 
# a) Urcete parametry rozdeleni
# b) Urcete prvni a treti kvartil -> x_0.25, x_0.75
# c) P(X > 1)
# d) P(X < 2)
# d) P(X<1 | X<2)

# a) Parametry
k <- 3

# b) Kvantily
qt <- qt(p = c(0.25,0.75), df = k)

# c) P(X > 1) = 1 - P(X<=1)

pt1 <- 1 - pt(1, df = k)

# d) P(X < 2)
pt2 <-pt(2, df = k)
# d) P(X<1 | X<2)
pt1 <-pt(1, df = k)
pt2 <-pt(2, df = k)

pt3 <- pt1/pt2


#### Priklad 2:
# Najdete kvantily 0.025 a 0.975 pro Studentovo rozdeleni s parametrem k = 8.
# a) Kolik procent je mezi temito kvantily?
# b) Jaka je pravdepodobnost, ze nahodna velicina s timto rozdelenim nabude hodnota nad 1,5?



# kvantily:



# a) Kolik procent je mezi kvantily: 97.5%, 2.5%


# b) Jaka je pravdepodobnost, ze nahodna velicina s timto rozdelenim nabude hodnota nad 1,5?
# P(X > 1.5) = ?



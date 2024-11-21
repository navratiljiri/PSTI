################################################################################
## KIKM/PSTI: cviceni 7 - Diskretni rozdeleni pravdepodobnosti
################################################################################

## -----------------------------------------------------------------------------
# Binomicke rozdeleni
# n krát opakujeme pokus, který má stejnou pravděpodobnost 
## -----------------------------------------------------------------------------

rm(list=ls())
# parametry rozdeleni: n,p
# stredni hodnota: E(X) = n*p
# rozptyl: var(X) = n*p*(1-p)
?dbinom


#### Priklad 1:
# Situace: 18x jsme hodili kostkou.
# Nahodna velicina X: pocet sestek v techto hodech.
# Urcete definicni obor, E(X), var(X), P(X>1), P(X<4)


# parametry rozdeleni:
n <- 18
p <- 1/6


# definicni obor:
x <- 0:18


# stredni hodnota a rozptyl
stred <- n * p
var <- n * p * (1-p)


# pravdepodobnostni funkce
p1 <- dbinom(x = x, size = n, p)
tab1 <- cbind(x, p1)
tab1
# P(X>1)
p2 <- sum(1-tab1[1:2, "p1"])


# P(X<4)

p3 <- sum(tab1[1:4, "p1"])

rm(list=ls())
#### Priklad 2:
# Jsou krizeny dva druhy hrachu (bily a fialovy kvet). Predpokladame, ze rostliny, na kterych pokus
# provadime, nebyly dosud krizeny. Podle pravidel dedicnosti muzeme ocekavat,
# ze 3/4 nove vzniklych rostlin pokvetou fialove a 1/4 bile. Zatim vzklicilo 1O rostlin.
# Jaka je pravdepodobnost, ze:
# a) Zadna nepokvete bile?
# b) Fialove pokvetou alespon 3?
# c) Fialove pokvete alespon 6 a nejvyse 8 rostlin?

# fialove:
n = 10
p = 3/4

stred = n * p
var = n * p * (1-p)

#definiční obor
x <- 0:10

p1 <- dbinom(x = x, size = n, p)

tab1 <- cbind(x, p1)
tab1

# a) Zadna nepokvete bile -> vsech 10 bude fialovych

a <- tab1[11, "p1"]

# b) Fialove pokvetou alespon 3 -> 3 a vice fialovych kytek

b <- sum(tab1[3:nrow(tab1), "p1"])

# c) Fialove pokvete alespon 6 a nejvyse 8 -> mezi 6 a 8 kytkami

c <- sum(tab1[7:9, "p1"])

rm(list=ls())
### Priklad 3:
# Na cviceni je zapsano 40 studentu. Pravdepodobnost, ze student pujde na
# cviceni k tabuli je stale stejna: 1/40. Student byl na 10 cvicenich.
# Jaka je pravdepodobnost:
# a) Ze nebyl u tabule vubec?
# b) Ze byl u tabule dvakrat?
# c) Ze byl u tabule vice nez 1?





# definicni obor:




# stredni hodnota a rozptyl:




# pravdepodobnostni funkce





# a) Ze nebyl u tabule vubec




# b) Ze byl u tabule dvakrat?




# c) Ze byl u tabule vice nez 1?




# druha varianta



rm(list=ls())
## -----------------------------------------------------------------------------
# Poissonovo rozdeleni
## -----------------------------------------------------------------------------

# parametry rozdeleni: lambda
# stredni hodnota: E(X) = lambda
# rozptyl: var(X) = lambda
?dpois

#### Priklad 1:
# V lonskem roce bylo v pocitacove siti celkem 4380 vypadku (neuvazujeme prestupny rok).
# Nahodna velicina X: pocet vypadku behem hodiny.
# Urcete definicni obor, E(X), var(X), P(X>1), P(X<4)


lambda <- 4380/(365*24)


# definicni obor -> 0,1,2,...,nekonecno -> pro ilustraci urcime pravdepodobnost pro 0,...,10

x <- 0:10


# stredni hodnota, rozptyl

stred <- lambda 

var <- lambda 



# pravdepodobnostni funkce

p1 <- dpois(x, lambda)

tab1 <- cbind(x, p1)
tab1


# P(X>1)


p2 <- sum(1-tab1[1, "p1"])

# P(X<4)

p3 <- sum(tab1[1:4, "p1"])


#### Priklad 2:
# Banker jedna v prumeru se 7 zakazniky denne.
# Nahodna velicina X: pocet zakazniku, se kterymi banker za den jedna
# a) Urcete E(X), D(X), pravdepodobnostni funkci.
# b) Pravdepodobnost, ze pocet klientu za den bude > 5
# c) Pravdepodobnost, ze pocet klientu za den bude prave 6




# a)
# stredni hodnota, rozptyl




# definicni obor -> 0,1,2,...,nekonecno -> pro ilustraci urcime pravdepodobnost pro 0,...,10




# pravdepodobnostni funkce




# b) Pravdepodobnost, ze pocet klientu za den bude > 5 -> P(X>5)




# c) Pravdepodobnost, ze pocet klientu za den bude prave 6



rm(list=ls())
## -----------------------------------------------------------------------------
# Geometricke rozdeleni
# Kolikrát musím něco udělat, abych došel k dané věci
## -----------------------------------------------------------------------------

# parametry rozdeleni: p
# stredni hodnota: E(X) = (1-p)/p
# rozptyl: var(X) = (1-p)/p^2

?dgeom

#### Priklad 1:
# Pravdepodobnost chyby pri přenosu 1 bitu je 0,1 (prenosy jsou navzajem NEZAVISLE). 
# Nahodna velicina X: pocet prenesenych bitu pred prvni chybou. 
# Spocitejte stredni hodnotu a rozptyl nahodne veliciny X.

p <- 0.1
stred <- (1-p) / p
var <- (1-p) / p^2

x <- 0:10

# Urcete pravdepodobnost, ze

p1 <- dgeom(x, p)

tab1 <- cbind(x, p1)
tab1

# a) bude preneseno prave 7 bitu,
a <- tab1[(which(tab1==7)),]
# b) bude preneseno alespon 5 bitu,
b <- 1 -  sum(tab1[1:5, "p1"])
# c) budou preneseny nejvyse 3 bity,
c <- sum(tab1[1:4, "p1"])
# d) bude preneseno nejmene 2 a nejvyse 6 bitu.
d <- sum(tab1[3:7, "p1"])



# definicni obor: opet muze jit do nekonecna -> budeme modelovat pouze nekolik pokusu



# stredni hodnota, rozptyl



# pravdepodobnostni funkce




# a) bude preneseno prave 7 bitu -> P(X=7) = ?



# b) bude preneseno alespon 5 bitu -> P(X>=5) = ? = 1 - P(X<5)



# c) budou preneseny nejvyse 3 bity -> P(X<=3)



# d) bude preneseno nejmene 2 a nejvyse 6 bitu -> P(2 <= X <= 6) = ?




#### Priklad 2:
# Z predchozich zkusenosti se vi, ze se ke zkousce dostavi student, ktery splnil dobrovolnou
# seminarni praci, s pravdepodobnosti 0.78, bez seminarky s pravdepodobnosti 0.32.
# a) E(X), D(X), rozdeleni pravdepodobnosti pro 15 studentu
# b) Urcete pravdepodobnost, ze az 6. student, co na zkousku prisel, mel splnenou dobrovolnou
# seminarni praci.




# stredni hodnota a rozptyl



# pravdepodobnostni funkce



# Pst, ze az 6. student, co na zkousku prisel, mel splnenou dobrovolnou seminarni praci




## -----------------------------------------------------------------------------
# Hypergeometricke rozdeleni
## -----------------------------------------------------------------------------

# parametry rozdeleni: N, M, n
# - N = celkovy pocet prvku
# - M = pocet prvku se sledovanou VLASTNOSTI
# - n = kolik prvku nahodne vybereme (bez vraceni) ze vsech N

# stredni hodnota: E(X) = n*(M/N)
# rozptyl: var(X) = n*(M/N)*(1 - M/N)*((N-n)/(N-1))

?dhyper

#### Priklad 1:
# Banka si pred poskytnutim uveru sve klienty vzdy proveri. Momentalne ma 
# seznam 45 zadatelu o uver: 34 je spolehlivych klientu, 11 je nespolehlivych.
# a) Jaka je pravdepodobnost, ze pokud bude uver poskytnut 13 lidem, ze mezi nimi
#     bude 9 spolehlivych a 4 nespolehlivi klienti.
# b) Jaka je pravdepodobnost, ze pokud bude uver poskytnut 13 lidem, ze nejvyse 5 lidi bude spolehlivych
# c) Urcete E(X), var(X)




# definicni obor

N <- 45
M <- 34
n <- 13

# pravdepodobnostni funkce

x <- 2:13


# a) pravdepodobnost, ze 9 bude spolehlivych a 4 nespolehlivi -> P(X=9)
pst8 <- dhyper(x = x, m = M, n = (N-M), k = n)

tab1 <- cbind(x, pst8)
tab1

tab1[which(tab1 == 9), "pst8"]


# b) nejvyse 5 spolehlivych -> P(X<=5)
sum(tab1[1:4, "pst8"])


# c) stredni hodnota a rozptyl

stred <- n * (M/N)
var <- n*(M/N)*(1 - M/N)*((N-n)/(N-1))


#### Priklad 2:
# Mezi 25 soucastkami je v krabici 7 spatnych.
# Jaka je pravdepodobnost, ze kdyz vybereme 5, budou mezi nimi:
# a) prave 3 spatne
# b) alespon 1 spatna
# c) E(X) a var(X)





# a) Prave 3 spatne -> P(X=3)



# b) alespon 1 spatna -> P(X>=1)



# c) stredni hodnota, rozptyl





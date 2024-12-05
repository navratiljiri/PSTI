################################################################################
## KIKM/PSTI: cviceni 10 - Intervalove odhady
################################################################################

## -----------------------------------------------------------------------------
# Intervalove odhady: prehled
## -----------------------------------------------------------------------------

## A) Intervalovy odhad PODILU

# -> pouzivame kvantily NORMOVANEHO NORMALNIHO ROZDELENI
# -> oboustranny interval: kvantil u(1-alfa/2)
# -> pravostranny/levostranny interval: kvantil u(1-alfa)

# Pravostranny interval:
# ( - nekonecno, p + u(1-alfa)*sqrt(p(1-p)/n))


# Levostranny interval:
# (p - u(1-alfa)*sqrt(p(1-p)/n), nekonecno)


# Oboustranny interval:
# (p - u(1-alfa/2)*sqrt(p(1-p)/n), p + u(1-alfa/2)*sqrt(p(1-p)/n))




## B) Intervalovy odhad STREDNI HODNOTY

# uvazujeme 2 situace:
#   - ZNAME parametr sigma -> kvantily NORMOVANEHO NORMALNIHO rozdeleni
#   - NEZNAME parametr sigma -> kvantily STUDENTOVA rozdeleni

# B1) Zname parametr sigma

# Pravostranny interval:
# ( - nekonecno, prum + u(1-alfa)*sigma/sqrt(n))


# Levostranny interval:
# (prum - u(1-alfa)*sigma/sqrt(n), nekonecno)


# Oboustranny interval:
# (prum - u(1-alfa/1)*sigma/sqrt(n), prum + u(1-alfa/2)*sigma/sqrt(n))


# B2) Nezname parametr sigma

# pouzijeme vyberovou smerodatnou odchylku -> s

# Pravostranny interval:
# ( - nekonecno, prum + t(n-1)*s/sqrt(n))


# Levostranny interval:
# (prum - t(n-1)*s/sqrt(n), nekonecno)

# Oboustranny interval:
# (prum - t(n-1)*s/sqrt(n), prum + t(n-1)*s/sqrt(n))



## -----------------------------------------------------------------------------
# Intervalovy odhad podilu
## -----------------------------------------------------------------------------

## Priklad 1:
# Politicka strana se rozhodla udelat pred volbami pruzkum preferenci. Z celkoveho
# poctu 1000 respondentu by tuto stranu volilo celkem 71 volicu. Aby se strana dostala
# do parlamentu, musi ji volit vice nez 5% volicu.
# Stanovte LEVOSTRANNY interval spolehlivost, spolehlivost = 99%.

n <- 1000
k <- 71
p <- k/n

alfa <- 0.01
kvantil <- qnorm(1-alfa)
lower <- p - kvantil * sqrt((p*(1-p))/n)

upper <- Inf

interval <- c(lower, upper)
round(interval, 3)


## Priklad 2:
# Sledujeme uspesnost studentu u zkousky. Vime, ze zkousku celkem skladalo 100 studentu.
# z nich uspelo 35.
# Urcete PRAVOSTRANNY interval spolehlivosti, spolehlivost 95%.

n <- 100
k <- 35
p <- k/n 
alfa <- 0.05

kvantil <- qnorm(1-alfa)
lower <- -Inf
upper<- p + kvantil * sqrt((p*(1-p))/n)

interval <- c(lower, upper)
round(interval, 3)


## Priklad 3:
# Vyrobce cigaret provadel behem nekolika let pruzkum. Ptali se celkem 10000 lidi, zda
# na otazku "Dali jste si minuly tyden alespon 1 cigaretu?". Podil kladnych odpovedi cinil
# celkem 27%.
# Sestrojte OBOUSTRANNY interval spolehlivost pro podil kuraku, spolehlivost = 95%.

n <- 10000
k <- n * 0.27

p <- k/n
alfa <- 0.05

kvantil <- qnorm(1-(alfa/2))
lower <- p - kvantil * sqrt((p*(1-p))/n)
upper <- p + kvantil * sqrt((p*(1-p))/n)

interval <- c(lower, upper)
round(interval, 3)

rm(list=ls())

## -----------------------------------------------------------------------------
# Intervalovy odhad stredni hodnoty
## -----------------------------------------------------------------------------


## Priklad 1: NEZNAME SIGMA
# Urcete OBOUSTRANNY interval spolehlivost pro stredni hodnotu normalniho rozdeleni.
# Vime, ze pro vyber hodnot Xi o velikost n = 30 byl spocten vyberovy prumer (45) a vyberova smerodatna
# odchylka (6.7)
# Pozadovana spolehlivost: 0.99

# -> NEZNAME sigma -> kvantily Studentova rozdeleni

n <- 30
prum <- 45
smodch <- 6.7
alfa <- 0.01

kvantil <- qt(1-alfa/2, df = (n-1))

lower <- prum - kvantil * smodch/sqrt(n)
upper <- prum + kvantil * smodch/sqrt(n)

interval <- c(lower, upper)
round(interval, 3)

## Priklad 2: ZNAME SIGMA
# Urcete LEVOSTRANNY interval spolehlivosti pro stredni hodnotu normalniho rozdeleni.
# Pro vyber hodnot Xi o velikosti n = 12 byl spocten vyberovy prumer (105) a zname parametr sigma (15).
# Pozadovana spolehlivost: 0.99

# -> ZNAME sigma -> kvantily normovaneho normalniho rozdeleni

n <- 12
prum <- 105 
sigma <- 15
alfa <- 0.01

kvantil <- qnorm(1-alfa)

lower <- prum - kvantil * (sigma/sqrt(n))
upper <- Inf

interval <- c(lower, upper)
round(interval, 3)




## Priklad 3: ZNAME SIGMA
# Uvazujme, ze vysledky IQ testu 50 ruznych osob. Uvadi se, ze hodnota IQ v populaci se ridi normalnim rozdelenim 
# se stredni hodnotou 100 a se smerodatnou odchylkou 15.
# Urcete OBOUSTRANNY interval spolehlivosti pro stredni hodnotu se spolehlivosti 95%.

# -> ZNAME sigma -> kvantily normovaneho normalniho rozdeleni

IQ <- c(88,103, 111,  77, 104, 105 , 94 , 95 , 94 , 91 , 95 , 90 , 92 ,101 ,110 ,
        99 , 95 , 91 , 92, 124, 101 , 95 , 96, 105, 93 , 86, 106 , 90, 100 , 91 ,
        111 , 95 , 93 , 95 , 84 , 88 , 78 , 87 , 97 , 95, 114 , 89,91 , 97 , 90 , 90 ,
        89 , 87, 95, 99)

n <- length(IQ)
prum <- mean(IQ)
alfa <- 0.05
sigma <- 15

kvantil <- qnorm(1-alfa/2)

lower <- prum - kvantil * sigma/sqrt(n)
upper <- prum + kvantil * sigma/sqrt(n)

interval <- c(lower, upper)
round(interval, 3)



## Priklad 4:
# Vyrobce aut uvadi, ze prumerna spotreba daneho modelu na 100km je 7.3l.
# Spotreba benzinu byla testovana na celkem 150 autech. 
# Predpokladejme, ze spotreba benzinu ma normalni rozdeleni.
# Urcete OBOUSTRANNY interval spolehlivosti pro spotrebu benzinu, spolehlivost = 0.95

# NEZNAME sigma -> kvantily Studentova rozdeleni

# modelujeme 150 spotreb:
set.seed(1234)
auta <- round(rnorm(150, mean = 7.3, sd = 0.92),2)
auta 

n <- 150
alfa <- 0.05
prum <- mean(auta)
smodch <- sd(auta)

kvantil <- qt(1-alfa/2, df = n-1)
lower <- prum - kvantil * smodch/sqrt(n)
upper <- prum + kvantil * smodch/sqrt(n)

intervaly <- c(lower, upper)
round(intervaly, 3)




## Priklad 5:
# Vyzkumny tym analyzuje mnozstvi urciteho kovu v odebranych vzorcich z reky, kde dochazi k prumyslovemu znecisteni.
# Bylo odebrano 15 vzorku vody, ve kterych byla merena koncentrace kovu (v mg/l).
# Cilem je odhadnout maximalni moznou prumernou koncentraci kovu v rece pri zvolene spolehlivosti 95%.

n <- 15  
koncentrace <- c(56.85479, 47.17651, 51.81564, 53.16431, 52.02134, 49.46938, 57.55761, 49.52670, 60.09212,
                    49.68643, 56.52435, 61.43323, 43.05570, 48.60606, 49.33339)
hist(koncentrace)
alfa <- 0.05
prum <- mean(koncentrace)
smodch <- sd(koncentrace)

kvantil <- qt(1-alfa, df = n-1)
lower <- -Inf
upper <- prum + kvantil * smodch/sqrt(n)

intervaly <- c(lower, upper)
round(intervaly, 3)







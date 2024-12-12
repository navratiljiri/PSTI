################################################################################
## KIKM/PSTI: cviceni 11 - Testovani hypotez
################################################################################

library(BSDA) # z-test

rm(list=ls())
## -----------------------------------------------------------------------------
# Testy hypotez o parametru podilu: p
## -----------------------------------------------------------------------------

#### Priklad 1:
# Pruzkum mezi 200 lidmi ukazal, že 120 lidi preferuje produkt A. Testujte na hladine vyznamnosti 0.05, zda skutecny podil lidi, kteri preferuji produkt A
# je odlisny od predpokladaneho podilu 50%.

# H0: p = 0.5
# H1: p != 0.5

n <- 200
k <- 120
p <- k/n

p0 <- 0.5
alfa <- 0.05

# testove kriterium

tk <- (p-p0)/sqrt(p0*(1-p0)/n)

# kriticky obor

  #Nic moc řešení 
u_crit <- qnorm(1-alfa/2)
u_crit <- round(u_crit,3)

low <- c(-Inf, -u_crit)
up <- c(u_crit, Inf)

c(low, up)

  #Elegantnější řešení
paste("Kritický obor: W = (-inf, ", -u_crit,"> & <", u_crit,"inf)")

# p-hodnota

pval <- 2*(1-pnorm(abs(tk)))

# rozhodnuti o H0
pval <= alfa
#pval <= alfa -> zamítáme
#pval > alfa -> nezamítáme

# Dulezite: rozhodnuti dle p-hodnoty a dle kritickeho oboru si nesmi protirecit!

# funkce binom.test()
?binom.test
#1-alfa -> conf. level 
binom.test(x = k, n = n, p = p0)



#### Priklad 2:
# Ze 150 oslovenych klientu banky odpovedelo 85 z nich, ze jsou spokojeni se sluzbami banky. Na hladine vyznamnosti 0.01 testujte hypotezu,
# ze podil spokojenych klientu PRESAHUJE 50%.

# -> PRAVOSTRANNA alternativa

# H0: p = 0.5
# H1: p > 0.5

n <- 150
k <- 85
p <- k/n

p0 <- 0.5
alfa <- 0.01
# Data

# testove kriterium

tk <- (p-p0)/sqrt(p0*(1-p0)/n)


# kriticky obor
u_crit <- qnorm(1-alfa)
u_crit <- round(u_crit,3)

paste("Kritický obor: W = <",u_crit, "inf)")

# p-hodnota

pval <- 1-pnorm(tk)


# rozhodnuti:
pval <= alfa
#zde nezamítáme


binom.test(x = k, n = n, p = p0, alternative = "greater", conf.level = 0.99)


#### Priklad 3:
# Z pruzkumu mezi 120 oslovenymi lidmi vyplynulo, že 42 z nich souhlasi s tim, ze bude v jejich ctvrti postaveno obchodni centrum. 
# Odpurci stavby tvrdi, ze je to mene nez 40 %. Testujte jejich tvrzeni na hladine spolehlivost 0.05.

# -> LEVOSTRANNA alternativa
# H0: p = 0.5
# H1: p < 0.5


# Data


# testove kriterium

# kriticky obor

# p-hodnota

# rozhodnuti



#### Priklad 4:
# Z oslovene skupiny 500 lidi celkem 220 odpovedelo, ze jsou pravidelnymi kuraky. 
# Na hladine vyznamnosti 0.05 testujte hypotezu, ze je skutecny podil kuraku roven 0.5

# -> OBOUSTRANNA alternativa

# H0: p = 0.5
# H1: p != 0.5

# Data


# testove kriterium



# kriticky obor

# p-hodnota


# rozhodnuti



## -----------------------------------------------------------------------------
# Testy hypotez o stredni hodnote mu -> ZNAMY ROZPTYL
## -----------------------------------------------------------------------------


#### Priklad 1:
# Merili jsme vykon celkem 25 stroju. Smerodatna odchylka vykonu je stanovena jako 2 jednotky. Na hladine vyznamnosti 0.05 testujte hypotezu,
# ze je prumerny vykon stroje 50 oproti alternative, ze je nizsi.
# Namerene hodnoty: 45.38, 49.83, 52.25, 41.96, 50.29, 50.52, 47.28, 47.36, 47.31, 46.33, 47.57, 46.00, 46.67, 49.19, 51.88, 48.67, 47.47, 46.27,
#                   46.49, 56.25, 49.40, 47.53, 47.68, 50.38, 46.92


# -> LEVOSTRANNA alternativa

# H0: mu = 50
# H1: mu < 50

# Data
stroj <- c(45.38, 49.83, 52.25, 41.96, 50.29, 50.52, 47.28, 47.36, 47.31, 46.33, 47.57, 46.00, 46.67, 49.19, 51.88, 48.67, 47.47, 46.27,46.49, 56.25, 49.40, 47.53, 47.68, 50.38, 46.92)
n <- length(stroj)
prum <- mean(stroj)
sigma <- 2 

mu0 <- 50
alfa <- 0.05

# testove kriterium

tk <- (prum-mu0)/(sigma/sqrt(n))

# kriticky obor
u_crit <- qnorm(1-alfa)
paste("Kritický obor: W = (-inf, ", -u_crit,">")
  #Leží na oboru, takže zamítáme 

# p-hodnota

pval <- pnorm(tk)


# rozhodnuti
pval <= alfa
#zamítáme 

# funkce z.test()
?z.test()

z.test(x = stroj, mu = mu0, alternative = "less", sigma.x = sigma)


#### Priklad 2:
# Merili jsme vysku 30 osob. Vime, ze smerodatna odchylka vysky osob se udava jako 5 cm. 
# Na hladine vyznamnosti 0.05 testujte hypotezu, ze pruměrna vyska dospeleho cloveka je 175cm oproti alternative, ze tomu tak neni.
# Namerene vysky: 167.50, 171.80, 174.14, 164.20, 172.24, 172.47, 169.33, 169.41, 169.36, 168.42, 169.62, 168.10, 168.75, 171.19, 173.78, 
#                 170.68, 169.52, 168.36, 168.57, 178.01, 171.39, 169.58, 169.72, 172.33, 168.99, 166.80, 172.67, 168.03, 170.96, 168.29

# -> OBOUSTRANNA alternativa

# H0: mu = 175
# H1: mu != 175

# Data


# testove kriterium


# kriticky obor


# p-hodnota



# rozhodnuti




#### Priklad 3:
# U 40 kusu byla merena prumerna zivotnost a podle mereni je tento prumer 3.2h. Zname smerodatnou odchylku, ktera cini 0.5h.
# Vyrobce udava, ze jeho baterie vydrzi vice nez 3h. Na hladine vyznamnosti 0.05 testujte tvrzeni vyrobce.

# -> PRAVOSTRANNA alternativa

# H0: mu = 3
# H1: mu > 3

n <- 40
prum <- 3.2
sigma <- 0.5
alfa <- 0.05
mu0 <- 3

# Data



# testove kriterium

tk <- (prum-mu0)/(sigma/sqrt(n))


# kriticky obor

u_crit <- qnorm(1-alfa)
u_crit <- round(u_crit,3)

paste("Kritický obor: W = <",u_crit, "inf)")
#leží na intervalu -> zamítáme
# p-hodnota
pval <- 1-pnorm(tk)
pval <= alfa
#zamítáme ve prospěch alternativy 

# rozhodnuti




# v tomto prikladu nemuzeme pouzit z.test -> funkce je programovana tak, ze musime mit primo nahodny vyber -> ten nemame, proto pocitame rucne


## -----------------------------------------------------------------------------
# Testy hypotez o stredni hodnote mu -> NEZNAMY ROZPTYL
## -----------------------------------------------------------------------------


#### Priklad 1:
# Vyrobce udava, ze balicek chipsu ma 250g. Byl proveden nezavisly spotrebitelsky test,
# ktery toto tvrzeni overi. Vybrali jsme celkem 20 sacku chipsu a zvazili jejich obsah.
# Testujte na hladine vyznamnosti alfa = 0.05 hypotezu, ze balicek chipsu obsahuje 250g oproti 
# alternative, ze tomu tak neni.
# Namerene hmotnosti: 245.41, 251.05, 254.12, 241.09, 251.63, 251.92, 247.82, 247.92, 247.86, 246.62, 248.19, 246.21, 247.05, 250.24,
#                     253.65, 249.58, 248.06, 246.54, 246.82, 259.18

# -> OBOUSTRANNA alternativa

# H0: mu = 250
# H1: mu != 250

# data

chips <- c(245.41, 251.05, 254.12, 241.09, 251.63, 251.92, 247.82, 247.92, 247.86, 246.62, 248.19, 246.21, 247.05, 250.24, 253.65, 249.58, 248.06, 246.54, 246.82, 259.18)
n <- length(chips)
alfa <- 0.05
prum <- mean(chips)
mu0 <- 250

# testove kriterium:
tk <- (prum-mu0)/(sd(chips)/sqrt(n))

# kriticky obor
u_crit <- qt(1-alfa/2, df=n-1)
u_crit <- round(u_crit,3)
low <- c(-Inf, -u_crit)
up <- c(u_crit, Inf)

c(low, up)

#Elegantnější řešení
paste("Kritický obor: W = (-inf, ", -u_crit,"> & <", u_crit,"inf)")
# neleží -> nezamítáme 


# p-hodnota

pval <- 2*(1-pt(abs(tk), df = n-1))


# rozhodnuti





# funkce t.test()
?t.test()

t.test(x = chips, mu = mu0, )




#### Priklad 2:
# mame vyber 25 rostlin, u kterych jsme zmerili delku jejich korenu. 
# Na hladine vyznamnosti 0.05 testujte hypotezu, ze je delka korenu 10cm oproti alternative, ze je vetsi.
# Namerene hodnoty: 8.87, 10.51, 11.39,  7.62, 10.67, 10.76 , 9.57,  9.60,  9.58, 9.22,  9.68,  9.10 , 9.35, 10.27,
#                   11.26, 10.08, 9.64, 9.20,9.28, 12.86, 10.35,9.66,9.72, 10.71, 9.44

# -> PRAVOSTRANNA alternativa


# H0: mu = 10
# H1: mu > 10

# Data




# testove kriterium




# kriticky obor




# p-hodnota




# rozhodnuti




#### Priklad 3:
# U 15 pacientu byla merena hladina cukru v krvi.
# Na hladina 0.05 testujte hypotezu, ze je prumerna hladina cukru v krvi 6 mmol/l oproti alternative, ze tomu tak neni.
# Namerene hodnoty: 4.41, 5.87, 6.67, 3.28, 6.02, 6.10, 5.03, 5.06, 5.04, 4.72, 5.13, 4.61, 4.83, 5.66, 6.55

# -> LEVOSTRANNA alternative


# H0: mu = 6
# H1: mu < 6


# Data




# testove kriterium


# kriticky obor



# p-hodnota




# rozhodnuti




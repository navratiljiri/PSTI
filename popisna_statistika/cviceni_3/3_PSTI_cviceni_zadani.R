################################################################################
## KIKM/PSTI: cviceni 3 - Kombinatorika + opakovani "rozsahla data"
################################################################################


# 1) Samostatna prace ----------------------------------------------------------
# - Spocitejte zakladni ciselne charakteristiky (prumer, rozptyl, smerodatnou odchylku, sikmost, spicatost) pro data v souboru "Cv3".
# - Pomoci Sturgesova pravidla data rozdelte do intervalu. Pocty intervalu + jejich sirku vhode zaokrouhlete (sirku na cele desitky NAHORU)
# - Vytvorte tabulku cetnosti hodnot pro dane intervaly. Dale vytvorte data frame, ktery bude obsahovat: rozpeti intervalu, stred intervalu a absolutni cetnosti v danych intervalech.
# - Pro data v intervalech spocitejte vazene ciselne charakteristiky.

rm(list=ls())
library(readxl)
dx <- read_excel("Cv3.xlsx", col_names = T)

radky <- nrow(dx)
summary(dx)

#1.Stugersovo pravidlo 
K <- 1 + 3.3*log(radky, base = 10)

#2. šířka intervalů
vr <- max(dx$X) - min(dx$X)
sirka <- vr/K
sirka2 <- ceiling(sirka)
sirka2 <- 70

K2 <- round(K)
index <- 1:K2

#3. Vytvoření intervalů

A1 <- floor(min(dx$X))
A1 <- 0

intervaly <- cut(dx$X,
                breaks = seq(A1, K2*sirka2, by = sirka2),
                labels = paste0(seq(A1, (K2-1)*sirka2, by = sirka2),"-",seq(A1+sirka2, K2*sirka2, by = sirka2)))

rozptyl <- var(dx$X)

smerodatnaOdchylkaCislo <- sd(dx$X)

prumer <- mean(dx$X)
z <- (dx$X-prumer)/smerodatnaOdchylkaCislo

z3 <- z^3
z4 <- z^4

sikmost <- sum(z3)/N
spicatost <- sum(z4)/N


#variační rozpětí
K2 <- round(K)
sirka2 <- 360 


# 2) Kombinatorika -------------------------------------------------------------
# Je treba rozlisit mezi situacemi, kdy ZALEZI na poradi prvku a kdy na poradi prvku naopak NEZALEZI
# Ve vsech pripadech mame navic varianty "s opakovanim" a "bez opakovani"


## a) NEZALEZI na poradi:
## Kombinace
# funkce choose(n,k) = kombinacni cislo "n nad k"
# n = z kolika vybirame
# k = kolik cisel vybirame
?choose

# kombinace bez opakovani K(k,n) = n!/((n-k)!*k!)  --> muzeme pouzit prave funkci choose()
# kombinace s opakovanim K'(k,n) = (n+k-1)!/((n-1)!*k!)

# ukazka pouziti funkce choose()
n <- 20
k <- 5

choose(n,k)         # kombinace BEZ opakovani
choose((n+k-1),k)   # kombinace s opakovanim


#------------------------
# Priklad 1: bez opakovani
#------------------------
# Test se sklada z 2 dejepisnych, 2 zemepisnych a 1 literarni otazky.
# Pripraveno je: 30 dejepisnych, 25 zemepisnych a 20 literarnich. otazek.
# Kolik variant testu lze vytvorit?

# dejepis
dejepis <- choose(30,2)

# zemepis
zemepis <- choose(25,2)

# literatura
literatura <- choose(20,1)

celkem <- dejepis*zemepis*literatura
celkem

#------------------------
# Priklad 2: s opakovanim
#------------------------
# Klenotnik má k dispozici 3 druhy kamenu:
# rubiny: 3
# smaragdy: 2
# safiry: 5
# Kolik ruznych prstenu muze poskladat, kdyz ma prsten vzdy 3 kameny?

# ale pozor -> neslozime prsten se 3 smaragdy

n = 3
k = 3

prsten <- choose(n+k-1,k) - 1


#---------------------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------------------

## b) ZALEZI na poradi:
## Variace
# variace bez opakovani V(k,n) = n!/(n-k)!
# variace s opakovanim V'(k,n) = n^k

#------------------------
# Priklad 3: bez opakovani
#------------------------
# Ve vyboru je 6 muzu a 4 zeny. 
# - Kolik je zpusobu, jak zvolit predsedu, mistopredsenu, jednatele a hospodare?
# - Co kdyz predseda a mistopredseda musi byt opacneho pohlavi?

n <- 10
k <- 4
#
zpusoby <- factorial(n)/factorial(n-k)
#
muzi = 6
zeny = 4
celkem <- 10

muziP <- factorial(muzi)/factorial(muzi-2) * factorial(8)/factorial(8-2)

zenyP <- factorial(zeny)/factorial(zeny-2) * factorial(8)/factorial(8-2)

variace <- factorial(celkem)/factorial(celkem-4) - muziP - zenyP


#------------------------
# Priklad 4: s opakovanim
#------------------------
# Kolik statnich poznavacich znacek aut lze vytvorit, pokus obsahuji 3 posmena a 4 cislice?
# Pocet pouzitych pismen: 28.

# cisla:

# pismena:

spz <- 10^4 * 28^3

## Permutace
# permutace bez opakovani P(n) = V(n,n) = n!
# permutace s opakovanim P_n1,...,nk(n) = n!/(n1!*...*nk!)


#------------------------
# Priklad 5: bez opakovani
#------------------------
# Kolika zpusoby muze 13 chlapcu a 15 devcat nastoupit do zastupu tak, aby:
# - Nejdrive stala devcata a pak chlapci
# - Mezi zadnymi dvema chlapci nebylo devce a ani mezi dvema devcaty nebyl chlapec

devcata <- 15
chlapci <- 13

#
zpusoby <- factorial(devcata) * factorial(chlapci)

# -> kluci pohromade a holky pohromade
zpusoby2 <- factorial(devcata) * factorial(chlapci) * 2


#------------------------
# Priklad 6: s opakovanim
#------------------------
# Vlajka je slozena ze 3 pruhu. Cervena se opakuje 2x, bila pouze 1x.
# Kolik existuje moznosti, jak muzeme umistit tyto pruhy na vlajku?

pruhy <- 3

vlajka <- factorial(pruhy) / (factorial(2) * factorial(1))


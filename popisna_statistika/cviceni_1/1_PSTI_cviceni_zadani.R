################################################################################
## KIKM/PSTI: cviceni 1 - Uvod do prace s R
################################################################################

## Link pro stazeni R software:
## https://cran.r-project.org/

## Link pro stazeni R Studio:
## https://posit.co/download/rstudio-desktop/

## Dulezite: bez nainstalovaneho R software nebude R Studio fungovat! R Studio je uzivatelske prostredi pro R

#### 1) Prvni kroky ------------------------------------------------------------

## Otevreni noveho skriptu:
# File -> New File -> R Script

# DULEZITE: svou praci vzdy piste do skriptu! Cokoliv napisete do Console (okno vlevo dole) se neuklada a po ukonceni R zmizi.

## Nastaveni adresare:
getwd()  # "tady jsme"; do tohoto adresare bychom ted ukladali praci, pripadne z nej nahravali data

setwd("novyadresar")  # "kde chceme byt"; nastaveni noveho adresare; lomitko potreba zmenit na "/", cely adresar v ""

# alternativni moznost:
# Session -> Set Working Directory -> vybrat, ktery adresar chceme

## Doporuceni na zacatek:
# - Pred vytvorenim noveho skriptu je dobre smazat promenne, ktere nechceme pouzivat. Dale take nastavit adresar.
# - Komentare pomoci #
# - Je vhodne psat kazdy prikaz na novy radek -> prehlednost + eliminace moznych chyb
# - Lze spustit i nekolik prikazu najednou -> staci vybranou oblast oznacit a spustit
# - Spusteni kodu: Ctrl+Enter nebo pomoci tlacitka Run vpravo nahore


#### 2) Zakladni matematicke prikazy v R ---------------------------------------

185+10   # scitani
185-10   # odcitani
185*10   # nasobeni
185/10   # deleni
12^2        # mocniny; jakakoliv mocnina se zada symbolem "^"
sqrt(196)    # sqrt(x) je druha odmocnina
abs(-521)  # absolutni hodnota
round(46.64739189, 3) # zaokrouhlovani: parametry -> cislo, na kolik mist zaokrouhlit; pouziva se desetinna TECKA
exp(7)     # e^cislo
log(4)     # ln(4)
log(9,base = 3)   # log(9) o zakladu 3; parametry -> cislo, zaklad
pi         # cislo pi
factorial(6)   # faktorial daneho cisla
choose(10,5)  # kombinacni cislo "10 nad 5"

# gonimetricke funkce:
sin(pi*1/6)
cos(pi*1/3)
cos(0)
tan(pi*1/4)


# pozor:
log(-8)
0/0
8/0

# jak ziskat napovedu k funkcim:
?log
?round
# otevre napovedu primo v zalozce "Help" v pravem dolnim okne

# ne vsechny funkce jsou v zakladnich baliccich (packages/libraries)
# existuje spousta funkci v doplnkovych baliccich
library(pracma)
pracma::cot(pi*0.7)  # volame-li funkci z konkretniho balicku, je dobre ji volat i s odkazem na knihovnu 
# (vhodne hlavne v pripade, ze existuje vic funkci stejneho jmena v ruznych baliccich)

# matematicke zavorky: v R se pouzivaji pro matematicke vyrazy pouze zavorky (), zavorky [] se pouzivaji k indexovani (v pozdejcich lekcich)


#### 3) Promenne ---------------------------------------------------------------

# DULEZITE: R je case sensitive 

x <- 12  # ulozime promennou (zobrazi se ve workspace); nevypise se v console
x        # vypiseme hodnotu "x" v console
(y<-9)   # ulozime a zaroven vypiseme

# pozor:
y   # mame ulozene
Y   # nemame ulozene

# opet muzeme pouzivat ruzne matematicke operace:
x+y; x*y  # pomoci ; muzeme oddelovat vice prikazu na jednom radku (vhodne spis pro jednodussi prikazy)

# Typy promennych v R:
a <- 10       # numeric (ciselne)
b <- "text"   # character (textove, piseme do "" nebo '')
d <- TRUE     # logical (logicke; pouze hodnoty TRUE/FALSE)
e <- 4+5i     # complex (komplexni); vzdy potreba psat "i" s cislem (samotne "i" Rko defaultne nebere jako komplexni prvek)

# "c" schvalne vynechano -> c je totiz funkce pro tvorbu vektoru -> neni vhodne pouzivat k pojmenovani promennych symboly/nazvy existujicich funkci

# chybejici hodnota: NA
f <- NA      # muzeme sami zakodovat (pokud vime, ze nejaka hodnota chybi); v pripade nahravani dat si s tim R vetsinou poradi a NA dosadi    
# jakakoliv operace s NA opet vrati NA
5+NA

# funkce class() -> zjistime typ promenne
class(a)
class(d)

# dalsi uzitecne prikazy:
ls()   # vypise vsechny ulozene promenne ve workspace
rm(a,b,c,d,f,y,e)   # vymaze vsechny promenne, ktere napiseme do zavorky
rm(list=ls())  # vymaze UPLNE VSECHNY ulozene promenne

# prikaz ctrl+L vymaze vse v console


#######################################################################
# Samostatne cviceni: zkuste vypocitat zadane priklady (v zadani)
#######################################################################






#### 4) Vektory ----------------------------------------------------------------

### a) Uvod

# vektor -> nejjednodussi datova struktura v R
# R vektor povazuje za SLOUPCOVY (ale pozor, v console se vypise v radku)
# Muze obsahovat hodnoty ruzneho typu: numeric, character, logical aj.
# Pozor: typy prvku nelze kombinovat, vzdy musi obsahovat prvky jednoho typu!

# vytvoreni vektoru: funkce c(), prvky oddelujeme carkou
vec <- c(1,3,5,7,9,3,45,0,8)
vec    # zobrazen jako radkovy vektor, ale "povahou" je SLOUPCOVY

# co kdyz bude ve vektoru chybejici hodnota NA:
vec2 <- c(5,9,10,NA,40,3,9)

# jak najit hodnotu NA -> pomoci funkce is.na()
is.na(vec2)   # hodnota TRUE oznaci NA 

# v dlouhem vektoru je vysledek TRUE/FALSE neprehledny -> pomuze funkce which()
which(is.na(vec2))  # pomoci funkce which() navic zjistime presnou pozici NA ve vektoru

# co kdybychom chteli NA nahradit nejakou hodnotou (napr. 1000):
vec2[is.na(vec2)] <- 1000
vec2

# ukazky dalsich moznych hodnot ve vektoru -> character, logical:
vec3 <- c("A","B","C","D","E")
vec4 <- c(TRUE,TRUE,FALSE,TRUE,FALSE)

# funkce class() funguje i u vektoru:
class(vec)
class(vec2)
class(vec3)
class(vec4)

# co se stane, kdyz do vektoru vlozime hodnoty ruznych typu:
pokusny.vektor <- c(3,56,"slovo",10,TRUE)
pokusny.vektor  # "vyhral" typ character -> vsechny prvky (i cisla a hodnota TRUE) jsou typu character



### b) Prace s vektory - uzitecne funkce

# length() -> vypise delku vektoru (pocet prvku)
length(vec)  

# funkce c() slouzi i ke spojeni 2 a vice vektoru do jednoho
v1 <- c(vec,vec2)  
v1

# intersect() -> najde spolecne prvky zadanych vektoru
v2 <- intersect(vec,vec2)  
v2

# unique() -> funkce zobrazi kazdy prvek vstupniho vektoru prave jednou
vec2
unique(vec2)  

# sort() -> usporada prvky vektoru
sort(vec, decreasing = T)  # usporadani hodnot SESTUPNE
sort(vec, decreasing = F)  # usporadani hodnot VZESTUPNE

# sum() -> vrati soucet vsech prvku vektoru
sum(vec)   

# Tak jako s promennymi, i s vektory muzeme provadet aritmeticke operace
v1 <- c(4,6,21,5,9,34,53)
v2 <- c(10,4,9,25,41,36,17)

# vektory muzeme scitat:
v1 + v2

vec+vec2 # pozor -> scitane vektory musi byt stejne delky!

# vektory muzeme odcitat:
v1 - v2

# vektory muzeme delit:
v1/v2

# vektory muzeme nasobit:
v1*v2 # nasobeni "po prvcich" -> v1[1]*v2[1] atd.

# co kdybychom chteli skalarni soucin -> operace %*%
v1 %*% v2       # vysledkem je jedno cislo

vec %*%vec2     # error: pro skalarni soucin musime mit vektory stejne delky!

# mocniny a odmocniny:
v1^2
sqrt(v1)

## -> aritmeticke operace na vektorech funguji PO PRVCICH


#### 5) Zakladni statisticke funkce --------------------------------------------

# definujeme si vektor 20 hodnot 
hodnoty <- c(14.33,10.90,5.97,25.49,6.68,6.90,9.45,7.02,5.62,14.38,8.80,5.35,6.42,8.82,8.49,6.38,9.71,8.01,14.05,12.64)

# prumer -> mean()
mean(hodnoty)

# rozptyl (vyberovy) -> var()
var(hodnoty)

# smerodatna odchylka (vyberova) -> sd()
sd(hodnoty)
sqrt(var(hodnoty))

# median -> median()
median(hodnoty)

# zakladni ciselne charakteristiky -> summary()
summary(hodnoty)

# histogram -> hist()
hist(hodnoty)

# boxplot -> boxplot()
boxplot(hodnoty)



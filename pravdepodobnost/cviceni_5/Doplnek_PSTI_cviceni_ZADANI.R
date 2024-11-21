################################################################################
## KIKM/PSTI: cviceni 6 - doplneni prace v R
################################################################################

## 1) Funkce typu "apply"-------------------------------------------------------

# - vypocet pres vsechny radky/sloupce
# - umoznuje pouziti ruznych funkci (ne tedy jen jako colSums, colMeans a jejich varianty pro radky)
# - umozni vyhnout se for-cyklum (vypocet pomoci funkci typu "apply" je rychlejsi)

# vyuzijeme vzorovy datovy soubor "iris"
?iris
df <- iris
str(iris)
summary(iris)


#### Funkce apply()
# apply(X,MARGIN,FUN)
# - X: objekt, na kterem chceme provest vypocet; matice nebo array
# - MARGIN: urci, pres ktery "rozmer" funkce pojede (1 = radky, 2 = sloupce, c(1,2) = radky i sloupce)
# - FUN: funkce, kterou chceme pro vypocty pouzit

# vyuziti nekterych v R definovanych funkci
X <- as.matrix(iris[,-5]) # vybereme pouze ciselne promenne z dat

apply(X,2,min)    # min ze vsech sloupcu
apply(X,1,max)    # max ze vsech radku
apply(X,2,var)    # rozptyl ze vsech sloupcu
apply(X,2,sd)     # smerodatna odchylka ze vsech sloupcu

# Pouziti nami definovane funkce (ktera v R neni definovana); predpis se napise za obecny prikaz function(x)
apply(X, 2, function(x) (min(x)+max(x))/3)     # dostaneme soucet min a max hodnoty ve sloupci vydeleny 3 (overte)


# Nebo si muzeme napsat vetsi funkci a pak ji pouzit v apply:

sikmost <- function(x){   # funkci vzdy zaciname pomoci function(), v zavorce jsou vstupni argumenty (muze jich byt samozrejme nekolik)
  n <- length(x)
  s <- sd(x)
  prum <- mean(x)
  alfa <- ((sum((x-prum)^3))/n)/s^3
  return(alfa)            # pokud funkce obsahuje vice dilcich vypoctu, tak pomoci return() urcime, co bude finalni vystup
}

apply(X, 2, sikmost)


#### Dalsi uzitecne funkce typu "apply"
# - lapply(): vybrany vypocet (funkce) je proveden na jednotlivych PRVCICH vstupniho objektu
# - sapply(): vybrany vypocet (funkce) je proveden na jednotlivych PRVCICH vstupniho objektu
# - tapply(): vybrany vypocet (funkce) je proveden na datech v TABULCE

# funkce lapply() a sapply() maji stejny syntax:
# lapply(X, FUN); mapply(X,FUN)
# - X: vstupni objekt -> vektor, list, array, data.frame
# - FUN: funkce, ktera je pouzita na kazdy prvek z X	

# vytvorime si objekt typu "list"
# -> list/seznam umoznuje ulozit prvky ruznych typu (a take ruznych rozmeru!) do jednoho objektu

a <- seq(2,20,2)
b <- letters      # Pozn.: funkce "letters" vypise pismena abecedy; existuje k ni i varianta LETTERS pro kapitalky
d <- c(T,F,F,T,F,T,F)

L <- list(a,b,d)

# pojmenujeme jednotlive objekty v listu
names(L) <- c("cisla","pismena","logicke")

# indexovani v listech -> [[ ]] a [ ]
L[[1]]          # zavolame prvni slozku listu
L[[2]][1:7]     # z druhe slozky vybereme prvky 1:7
L[["logicke"]]  # funguje i pomoci nazvu slozek listu

unlist(L)       # unlist() -> z listu udela jeden velky vektor


# Zpet k funkcim lapply(), sapply
v1 <- seq(1,20,3)

L2 <- list(v1)

lapply(L2, function(x) x^3)  # vsechny hodnoty v listu L2 umocnime na treti
sapply(L2, function(x) x^3)  # stejny vypocet, rozdilna podoba vystupu


v2 <- rep(c(2,4,6,8), times = 3)
v3 <- 1:15
L3 <- list(v1,v2,v3)

lapply(L3, range)
sapply(L3, range)


# funkce tapply():
# -> funkce se pouziva na data roztridena v tabulce

# tapply(X, INDEX, FUN = NULL)
# argumenty:
# - X: dany objekt (vektor, sloupec tabulky) -> " na co funkci pouzijeme"
# - INDEX: faktor, podle ktereho tridime -> podle ktere promenne data tridime
# - FUN: funkce, ktera je pouzita na kazdou uroven faktoru def. v INDEX
set.seed(1234)
sl1 <- runif(10,0,1)
sl2 <- rnorm(10,0,1)
group <- rep(c("A","B"), each = 5)
tab <- data.frame(sl1, sl2,group)
tab
# Pozn.: funkce runif() a rnorm() slouzi ke generovani hodnot z danych rozdeleni -> v pozdejsich lekcich

tapply(tab$sl1, tab$group, mean)   # funkci pouzijeme na sloupec "sl1, tridime podle "group", chceme mean -> output je PRUMER kazde skupiny

# opet muzeme pouzit i vlastni funkci (bud napsanou za function(x), nebo predem definovanou)
tapply(tab$sl2, tab$group, function(x) (min(x)+max(x))/4) 

tapply(tab$sl1, tab$group, sikmost)



################################################################################
### Samostatna prace
################################################################################

# 1. Nainstalujte knihovnu "lgrdata" a z ni si nahrajte datovy soubor "howell". Podivejte se do
#    helpu, co znamenaji jednotlive promenne.

library(lgrdata)
dat <- howell

# 2. Pouzitim funkce "apply" spocitejte z-score kazdeho ciselneho sloupce.
# Z-score = (x_i - prumer)/(sm_odch)

zscore <- function (x) {
  smodch = sd(x)
  prumer = mean(x)
  
  return (x - prumer) / smodch
}
apply(dat[,-1], 2, zscore)

# 3. Pomoci funkce "tapply" ziskejte zakladni ciselne charakteristiky promennych age, weight, height
# rozdelenych podle pohlavi.

tapply(howell$age, howell$sex, summary)
tapply(howell$height, howell$sex, summary)


################################################################################



## 2) For cykly a podminky -----------------------------------------------------


#### IF STATEMENT
# zakladni syntaxe:

# if (podminka) 
#   {   
#     prikaz
#   }

# pokud podminka = TRUE, bude prikaz proveden; pokud podminka = FALSE, nestane se nic

# Priklad 1:
x <- 25
if(x > 0){
  print("x je KLADNE cislo")
}

# co kdyz podminku zmenime:
if(x < 0){
  print("x je ZAPORNE")
}
# -> nestalo se nic 
# abychom dostali "odpoved" i v tomto pripade, pridame do podminky prikaz "else"

#### IF-ELSE STATEMENT
# zakladni syntaxe:

# if (podminka) 
#   {       
#     prikaz1
#   } else 
#     {
#       prikaz2
#     }

# plati-li podminka, bude proveden prikaz1, jinak bude proveden prikaz2
# -> muzeme do syntaxe zahrnout i vicero podminek -> retezime prikazy if, else

# Uprava prikazu v prikladu 1:
x
if(x > 0){
  print("x je KLADNE cislo")
} else {
  print("x je ZAPORNE cislo")
}

x <- -10
if(x > 0){
  print("x je KLADNE cislo")
} else {
  print("x je ZAPORNE cislo")
}


# Priklad 2: retezeni vicero podminek do jednoho prikazu
trzba <-  10000   # "trzba" predstavuje denni trzbu nejakeho obchodu; vyzkousejte vsechny 3 moznosti
# trzba <- 40000
# trzba <- 75000

if (trzba < 10000) {
  print('Dnes jsme utrzili malo penez')
} else if (trzba > 10000  & trzba <= 40000) {
  print('Dnesni den byla prumerna trzba')
} else {
  print('Dnesni den byla skvela trzba!')
}

## DULEZITE: jak psat spravne kod podminek -> pozice {}

# Spatny kod 1:
if (x < 0)
  print("x je ZAPORNE cislo")
else
  print("x NENI zaporne")
# Prikaz je na jednom radku -> netreba psat zavorky (tohle nedela problem)
# Kde je CHYBA: "else" musi byt na stejnem radku, jako prikaz
# Vsimnete si cerveneho kolecka s krizkem -> R samo varuje dopredu, ze v kodu je neco spatne

# Oprava:

if (x < 0)
  print("x je ZAPORNE cislo") else
    print("x NENI zaporne")


# Spatny kod 2:
if (x < 0)
{
  print("x je ZAPORNE")
} 
else 
{
  print("x NENI zaporne")
}
# Kde je CHYBA: "else" musi nasledovat ihned po }

# Oprava:

if (x < 0){
  print("x je zaporne")
} else {
  print("x neni zaporne")
}

### Jak v if-else podmince resit NA:

# Nabizi se primocare reseni:
z <- NA

# tento kod nebude fungovat
if(z == NA){  # vystrazny zluty trojuhelnik u cisla radku (napoveda, jak kod opravit)
     print(1)
} else {
  print(0) 
}

# tento kod je spravne   
if(is.na(z)){   # do podminky musime napsat is.na()  
  print(1) 
} else {
  print(0)
}



#### CYKLY (FOR, WHILE, REPEAT)
# -> opakujeme prikaz po dany pocet opakovani
# -> muze obsahovat if-else podminky
# -> dale muzeme vlozit prikaz "break" (konec cyklu) nebo "next" (preskoci krok)

# zakladni syntaxe:
# for (i in vektor) 
#   {
#     prikaz	
#   }

# Priklad 1:
for(i in 1:15){   
  print(i+i^2)   # for-cyklus postupne vypise vysledky teto male matematicke operace
}

# Vysledky muzeme take ukladat -> vzdy si predtim vytvorime prazdny vektor/objekt, do ktereho vystup ulozime
vysledek <- c()
for(i in 1:20){
  vysledek[i] <- i + 10^2
}
vysledek

# For cyklus s podminkami if-else

# vypiseme cisla delitelna 3
for(i in 1:30){
  if((i %% 3) == 0){   # operator %% -> modulo -> zbytek po deleni dalsim cislem (tj. pokud chceme cisla delitelne 3, tak by zbytek po deleni mel byt roven 0)
    print(i)
  }
}

# uziti operatoru "break"
set.seed(1345)
vals <- round(runif(100,1,10),2) 
vals2 <- round(runif(100,0,10),2)
matice <- cbind(vals,vals2)

for (i in 1:nrow(matice)){
  if(matice[i,1] > matice[i,2]){
    print(paste0("prvni sloupec vyssi cislo: ", matice[i,1], ">" ,matice[i,2]))
  } else {
    print("Konec: prvni pripad, kdy je druhy sloupec vyssi cislo")
    break # cyklus se zastavi, jakmile bude poprve porusena podminka
  }
}

# uziti operatoru "next"
for (i in 1:nrow(matice)){
  if(matice[i,1] > matice[i,2]){
    print(paste0("prvni sloupec vyssi cislo: ", matice[i,1]," > ",matice[i,2]))
  } else {
     next   # cyklus se NEzastavi, jakmile bude poprve porusena podminka -> jen bude preskocen krok
  }
}
  

## WHILE cyklus -> dokud plati nejaka podminka (porusi se podminka = konec cyklu)

# zakladni syntaxe:

# while (podminka)  # podminka musi byt konecna -> v opacnem pripade se "zacyklime" a kod pobezi donekonecna (musime pak zastavit rucne)
#  {  
#    prikaz
#  }

k <- 1 
while(k <= 15){  # bude se opakovat, dokud plati, ze k<=15
  print(k)
  k = k+1 
}

# do while cyklu opet muzeme pridat operatory "break" a "next"


## REPEAT -> bezi dokud neni podminka SPLNENA (splni se podminka = konec cyklu)

# zakladni syntaxe:

# repeat 
# {
#    statement
# }

m = 1
repeat {
  cislo = (m+1)^2
  print(cislo)
  m = m+1
  if (cislo > 30) break    # kod bezi, DOKUD neni splnena dana podminky (tady dokud "cislo" neprekroci 30)
}



################################################################################
### Samostatna prace
################################################################################

# 1. Pomoci funkce "ifelse" vypiste z nahraneho datoveho souboru "howel" ty hodnoty promenne
# "weight", ktere jsou vyssi nez 35.



# 2. Pomoci for-cyklu spocitejte BMI a ulozte do souboru "dat".
# BMI = (vaha_kg) / ((vyska_m)^2)
dat$
BMI = c();
for(i in nrow(dat)) {
  weight = dat[i, "weight"];
  height = dat[i, "height"]/100
  BMI[i] <- weight/(height^2)
}
BMI

# 3. Pomoci for-cyklu a podminek vypisujte hodnoty BMI vyssi nez prumer (zaokrouhlene na 2 desetinna mista):










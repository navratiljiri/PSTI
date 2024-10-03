################################################################################
## KIKM/PSTI: cviceni 2 - Vektory, matice, data framy
################################################################################

#### 1) Vektory: pokracovani ---------------------------------------------------

## a) Indexovani -> pomoci [ ]

vec <- c(1,3,5,7,9,3,45,0,8)
vec2 <- c(5,9,10,1000,40,3,9)
v1 <- c(4,6,21,5,9,34,53)
v2 <- c(10,4,9,25,41,36,17)


vec[3]         # vybereme 3. prvek vektoru
vec[c(1,3,5)]  # vybereme 1., 3. a 5. prvek (nutno do [ ] zadat take pomoci vektoru)
vec[4:8]       # vybereme 4. az 8. prvek
vec[-4]        # vybereme vsechny prvky krome 4.

# prvky lze vybirat take pomoci logickych operatoru TRUE/FALSE a logickych podminek:
#  ==, !=, >, <, >=, <=, & (pravy alt+C), | (pravy alt + W)

vec[vec > 3 & vec < 20]  # vypise cisla >3 a zaroven <20
vec[vec != 3]            # vypise vsechna cisla krome 3

# pomoci logickych operatoru muzeme srovnavat rovnou cele vektory, napr.:
v1 == v2
v1 > v2

# u vektoru typu character lze take vybirat podle nazvu polozek
v <- c("pes","kocka","papousek","kocka","krecek","mys","tygr")
v
v[v == "kocka"]

# najdeme, kolikaty prvek ve vektoru je "papousek"
which(v=="papousek")

# prvky vektoru muzeme taky pojmenovat:
cena <- c(55, 170, 65, 250, 45)
nazev <- c("pivo", "menu1", "priloha","burger", "kofola")
names(cena) <- nazev    # pomoci funkce names() priradime vektoru nazvy prvku
cena

# pomoci nazvu opet muzeme z vektoru vybirat prvky
cena["pivo"]
cena[c("pivo","kofola")]

# Jak zjistime, zda dany vektor obsahuje konkretni prvek -> operator %in%
"slon" %in% v
"kocka" %in% v

120 %in% cena
55 %in% cena


# muzeme vytvaret i posloupnosti cisel:
p1 <- c(1:100)    # operator ":" -> vytvori posloupnost od:do s krokem 1
p1
p2 <- seq(from = 1, to = 200, by = 2)  # muzeme urcit i velikost kroku v posloupnosti -> parametr "by"
p2
p3 <- rep(2, times = 10)   # opakovani cisla x-krat pomoci funkce rep() a parametru "times"
p3
p4 <- rep(c(2,4), each = 6)  # kazde cislo ze zadaneho vektoru se zopakuje podle parametru "each"
p4

#######################################################################
# Samostatne cviceni: vektory
#######################################################################

# vytvorte vektor "cisla", ktery bude obsahovat nasledujici hodnoty:
# 1.79, 3.28, 4.08, 0.65, 3.43, 3.51, 2.43, 2.45, 2.44, 2.11, 2.52, 2.00, 2.22, 3.06, 3.96

# z vektoru vyberte prvky na pozici 2, 4, 7, 13

# prictete ke kazdemu prvku cislo 10 a ulozte tento vektor do "cisla2"
# mel by vam zustat puvodni vektor "cisla" a vektor "cisla2" s hodnotami "+10"


# pro vektor "cisla" spocitejte: prumer, rozptyl, smerodatnou odchylku, 1. a 3. kvantil


# vektor "cisla" vizualizujte pomoci histogramu a boxplotu. V helpu (obou funkci) vyctete, jak zmenit
# barvu a nadpis. Zakladni barvy lze zadavat v podobe “blue”, “red” aj. Nadpisy zvolte jako “Histogram:
# cisla” a “Boxplot: cisla”, barvu vyzkousejte libovolne. Vsechny dostupne barvy jsou k dispozici zde:
# http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf

#### 2) Matice -----------------------------------------------------------------

# Matice = dvojrozmerna struktura v R (rozlisujeme radky a sloupce)
# Vsechny prvky musi byt STEJNEHO TYPU (jako u vektoru)
# Take muzou obsahovat hodnoty NA, NaN, Inf, NULL

# a) Vytvoreni matice: funkce matrix(), array(), dim()
m1 <- matrix(1, nrow = 4, ncol = 5)  # matice jednicek; pomoci parametru nrow a ncol nastavime rozmery
m1
m2 <- matrix(1:25, nrow = 5, ncol = 5) # matice s posloupnosti cisel 1:25; cisla PO SLOUPCICH
m2
matrix(1:25, nrow = 5, ncol = 5, byrow = T)  # parametr byrow = TRUE -> cisla PO RADCICH
dim(m2)  # funkce dim() vypise rozmery matice
# defaultni nastaveni -> prvky PO SLOUPCICH

# vytvoreni matice pomoci funkce array() -> umi vytvorit vice nez dvourozmerne objekty

arr1 <- array(1:200, c(10,10,2))
# prvni parametr = hodnoty, ktere chceme mit obsazene v array
# druhy parametr = rozmery (radky, sloupce, "treti rozmer")
arr1


# b) Indexovani: [i,j] -> i = radky, j = sloupce
m2

m2[2,4]   # prvek na druhem radku a ve ctvrtem sloupci
m2[,4]    # cely ctvrty sloupec
m2[3,]    # cely treti radek
m2[-1,]   # cela matice m2 bez prvniho radku

# dulezite: pokud chceme pomoci "mezery" vybrat cely radek/sloupec, vzdycky musime napsat "," -> [i, ], [ ,j]

diag(m2)  # diagonalni prvky matice
diag(5)   # jednotkova (a ctvercova) matice; rozmer urci cislo v zavorce



# c) Pojmenovani radku a sloupcu matice
# vektory -> 1 rozmer -> funkce names()
# matice -  > 2 rozmery -> funkce rownames() a colnames()
colnames(m2) <- c("a","b","c","d","e")   # nazvy sloupcu
rownames(m2) <- c("r1","r2","r3","r4","r5")  # nazvy radku
m2

# d) Vicerozmerny objekt array(): priklad
# mame v podstate nekolik "vrstev" matic stejnych rozmeru
# preprava -> treti "vrstva" je zpusob prepravy z mista A do mista B
preprava <- array(sort(seq(from=10,to=150,by=2),decreasing=TRUE), c(3, 3, 4))
preprava
dimnames(preprava) <- list(c("Praha", "Hradec", "Ostrava"), 
                           c("Praha", "Hradec", "Ostrava"), 
                           c("Kolo", "Autem", "Vlakem", "Autobusem")) 
preprava

# O kolik rychlejsi je cesta z Hradce do Prahy vlakem oproti tomu, kdybychom tuto trasu jeli na kole
preprava["Hradec", "Praha", "Vlakem"] - preprava["Hradec", "Praha", "Kolo"] 

# e) Vypocty s maticemi
X <- matrix(1:20, nrow = 4, ncol = 5)
Y <- matrix(11:30, nrow = 4, ncol = 5)
X
Y

# Spojovani matic:
# matice muzeme spojit bud "po radcich", nebo "po sloupcich"
# funkce cbind() -> spojeni po sloupcich
cbind(X,Y)

# funkce rbind() -> spojeni po radcich
rbind(X,Y)


# maticove nasobeni -> %*%
X%*%Y         # error -> spatne rozmery matic   
X %*% t(Y)    # t() -> transpozice matice

X+Y  # soucet "prvek po prvku" 


# Uzitecne funkce pro scitani nebo prumerovani radku/sloupcu:
colSums(X)  # soucet v sloupcich
rowSums(X)  # soucet v radcich
colMeans(X)  # sloupcovy prumer
rowMeans(X)  # radkovy prumer


# inverzni matice: funkce solve()
solve(X)   # error -> vstupni matice musi byt CTVERCOVA

X1 <- diag(c(2,2,3,4))
X1
solve(X1)


# Reseni linearnich rovnic: inverzni operace k maticovemu nasobeni
# A = ctvercova matice koeficientu (pro promenne x_i)
# b = vektor/matice prave strany
# x = vektor/matice reseni systemu linearnich rovnic Ax=b
# reseni Ax = b:  solve(A,b)

# resme soustavu rovnic:
# 2x1 + 2x2 = 5
# 4x1 - 2x2 = 2
A <- matrix(c(2, 4, 2, -2), 2)
A
b <- matrix(c(5, 2), 2)
b
x <- solve(A, b)
x

# plati tedy, ze
A %*% x  # = b

# Determinant matice -> funkce det()
det(X1)

#### 3) Zmena typu promenne ----------------------------------------------------
# skupina funkci "as.neco()"
# ".neco" = numeric, logical, character, matrix, data.frame, factor

# a) as.character() -> zmeni hodnoty na textovy retezec
cisla <- seq(1:15)
cisla
as.character(cisla)


# b) as.numeric() -> zmeni hodnoty na cisla
cisla2 <- c("34","45","23","12","0")
cisla2
as.numeric(cisla2)

logicke <- c(T,T,F,T,F,T,F,F,T)
as.numeric(logicke) 
# 1 = TRUE, 0 = FALSE

# ne vsechno bude samozrejme fungovat :-)
as.numeric(c("neco_napiseme"))



# c) as.logical() -> prevede na logicke hodnoty TRUE/FALSE
cisla3 <- c(2,4,5,1,0,6,1,0)
as.logical(cisla3)
# pozor -> TRUE prirazeno kazde nenulove hodnote -> automaticka zmena typu promenne

# d) as.factor() -> z promenne vytvori faktor (pouzitelne pro numericke i textove promenne)
sk1 <- rep(c(1,2,3),times = 5)
sk1
as.factor(sk1)

sk2 <- c("audi","skoda","vw","skoda","vw","audi","audi","skoda","skoda","vw","skoda")
as.factor(sk2)



# e) Dalsi priklady automaticke zmeny typu promenne

# pouzijeme spatny operator -> "scitame" hodnoty T a F
logicke[4] + logicke[5]
logicke
# R zmenilo typ promenne

# opet pouzijeme spatny operator -> logicky pro ciselne hodnoty
cisla3[2] & cisla3[6]
cisla3
# R zmenilo typ promenne


#######################################################################
# Samostatne cviceni: matice
#######################################################################

#### Priklad 1: Matice M



#### Priklad 2: Vypocitejte nasledujici vyraz -> ((H^T)*H*X*Y)-1000





#### Priklad 3: reste soustavu rovnic

# x1 + 4x2 - 2x3 + x4 = 8
# 4x1 + x2 + 3x3 -2x4 = 6
# 2x1 - 3x2 - x3 -x4 = 4
# x1 - 4x2 + 5x3 + 2x4 = 15



#### 4) Data frames ------------------------------------------------------------

# Dulezite: pri praci s daty je potreba mit data a pracovni skript ve stejnem adresari!
# Nastaveni:
#   - pomoci setwd()
#   - druha varianta pres Session -> Set working directory

## a) Nahravani dat -> .xlsx, .csv

# Excelove soubory -> format .xlsx
# pro nahravani existuje vicero funkci
# budeme pouzivat funkce z balicku "readxl"

library(readxl)
obce <- read_excel("PSC.xlsx")


# Excelovy soubor s oddelovaci -> format .csv
# funkce read.csv() a read.csv2()

crime <- read.csv("USArrests.csv", header = TRUE, sep = ";") 
# Desetinna cisla v R -> oddelena teckou
# Promenne Murder a Rape -> defaultne desetinna carka -> R povazuje za text
# Parametr "dec" ve funkci slouzi k urceni desetinneho oddelovace

# Znovu a lepe:
crime <- read.csv("USArrests.csv", header = TRUE, sep = ";", dec = ",") 

## b) Prvotni nahled na nahrana data:

# funkce str() -> informace o strukture dat (typy promennych, pocet pozorovani a promennych)
str(crime)
str(obce)

# funkce summary() -> zakladni popisna statistika jednotlivych promennych
summary(crime)
summary(obce)

# Uzitecne funkce
head(crime)        # vypise prvnich 6 radku tabulky 
colnames(crime)    # nazvy sloupcu - promennych (pomoci teto funkce muzeme rovnez menit nazvy sloupcu)
rownames(crime)    # nazvy radku - pozorovani (pomoci teto funkce muzeme rovnez menit nazvy radku)
ncol(crime)        # pocet sloupcu - promennych
nrow(crime)        # pocet radku - pozorovani
dim(crime)         # obdobne jako u matic -> pocet radku i sloupcu




#######################################################################
# Priklad: dlouha data -> prevod do kategorii
#######################################################################

# nacteme datovy soubor "Data_long.xlsx"
df <- read_excel("Data_long.xlsx",col_names = F)   # col_names = F -> datovy soubor NEOBSAHUJE nazev promenne
head(df)

# sloupec si pojmenujeme, at se s nim lepe pracuje
colnames(df) <- "X"
head(df)

# zakladni info o datech:
nrow(df)
summary(df)
var(df$X)   # vyber sloupce z data framu -> operator $

# Rozdeleni dat do intervalu:

# 1. Kolik intervalu/kategorii potrebujeme -> K (Sturgesovo pravidlo)
N <- nrow(df)

K <- 1 + 3.3*log(N, base = 10) # parametr base -> zaklad logaritmu (log je v R defaultne prirozeny logaritmus "ln")

# 2. Sirka intervalu

vr <- max(df$X) - min(df$X)   # variacni rozpeti
sirka <- vr/K

# zaokrouhleme:
K2 <- round(K)
index <- 1:K2

sirka2 <- 360    # zaokrouhleno dle uvahy -> aby byly intervaly rozumne sirky -> na cele desitky zaokrouhleno nahoru

# 3. Vytvoreni intervalu -> funkce cut()
A1 <- floor(min(df$X)) # A1 musi byt mensi nez x_min -> pomoci funkce floor najdeme nejblizsi celou cast MENSI nez x_min (lze vyresit i uvahou)

intervaly <- cut(df$X,
                 breaks = seq(A1, K2*sirka2, by = sirka2),
                 labels = paste0(seq(A1, (K2-1)*sirka2, by = sirka2),"-",seq(A1+sirka2, K2*sirka2, by = sirka2))) # funkce paste0 -> vytvoreni textoveho retezce

# kontrola
seq(A1, K2*sirka2, by = sirka2)
# A1 = 0 < x_min
# Bk = 5040 > x_max


# 4. Stred intervalu -> x_k
A <- seq(A1, (K2-1)*sirka2, by = sirka2)
B <- seq(A1+sirka2, K2*sirka2, by = sirka2)

xk <- (B+A)/2
xk

# 5. Kolik hodnot lezi v danem intervalu -> absolutni cetnosti N_k -> funkce table()
Nk <- table(intervaly)
Nk

# 6. Spojime vsechny vypocitane vektory do jednoho data framu -> funkce data.frame() vytvori novy data frame
tabulka <- data.frame(index, xk, Nk)
tabulka

# 7. Zakladni popisna statistika: srovnani pro long_data a data v kategoriich

# -> data v dlouhem formatu (df)
prumer <- mean(df$X)
rozptyl <- var(df$X)
smodch <- sd(df$X)
z <- (df$X-prumer)/smodch

z3 <- z^3
z4 <- z^4

sikmost <- sum(z3)/N      # funkce sum() -> secte vsechny hodnoty vektoru
spicatost <- sum(z4)/N

popisna1 <- c(prumer,rozptyl,smodch,sikmost,spicatost)
names(popisna1) <- c("prumer","rozptyl","smodch","sikmost","spicatost")


# -> data v kategoriich (tabulka)
v_prumer <- sum(xk*Nk)/N

aux1 <- xk-v_prumer
v_rozptyl <- sum(Nk*(aux1)^2)/N
v_smodch <- sqrt(v_rozptyl)

zk <- (xk-v_prumer)/v_smodch
v_sikmost <- sum(Nk*(zk)^3)/N
v_spicatost <- sum(Nk*(zk)^4)/N

popisna2 <- c(v_prumer,v_rozptyl,v_smodch,v_sikmost,v_spicatost)
names(popisna2) <- c("v_prumer","v_rozptyl","v_smodch","v_sikmost","v_spicatost")

popisna1
popisna2
cbind(popisna1,popisna2)


# 8. Vizualizace -> funkce barplot()
# data zobrazime pomoci sloupcoveho grafu (barplot) -> zobrazi nami vytvorene intervaly
barplot(Nk)
barplot(table(intervaly))

# srovnejme s histogramem pro data z df
hist(df$X)



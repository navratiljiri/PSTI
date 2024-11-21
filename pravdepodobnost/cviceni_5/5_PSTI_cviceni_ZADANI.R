################################################################################
## KIKM/PSTI: cviceni 5 - Pravdepodobnost II.
################################################################################

## 1) Nahodne jevy -------------------------------------------------------------

#### Priklad 1: 
# Hazime klasickou hraci kostkou. Jaka je pravdepodobnost, ze:

# a) Pri jednom hodu padne 6.


# b) Pri jednom hodu padne sude cislo -> mame 3 ruzna suda cisla


# c) Pri 2 hodech padne 2x cislo 6.


# d) Pri 2 hodech nepadne ani jednou 6.


# e) Pri 2 hodech padne jedna 6.


# f) Pri 2 hodech padne alespon 1 sude cislo -> celkem 27 moznosti, jak tohle muze nastat




#### Priklad 2: 
# Mame dva jevy. A1 = na hraci kostce padne 6. A2 = na hraci kostce padne liche cislo.



# a) Jsou jevy A a B neslucitelne?

# b) Jsou jevy A a B nezavisle?

# c) Tvori jevy A a B uplny system? -> pro uplny system plati, ze suma(P(Ai)) = 1




## 2) Uplna pravdepodobnost ----------------------------------------------------

#### Priklad 1: 
# V zimnim semestru se na dany predmet zapsalo celkem 23 studentu. Pravdepodobnost uspesneho slozeni zkousky je nasledujici:
# - pro 8 z nich je to 0.9
# - pro 12 z nich je to 0.6
# - pro zbyvajici 3 studenty je to 0.4
# -> Urcete prevdepodobnost, ze nahodne zvoleny student zkousku slozi.

# Reseni:
# -> jevy B1, B2, B3 odpovidaji studentum ve "skupine uspesnosti":
# - B1: 8
# - B2: 12
# - B3: 3
# -> jev A = student slozi zkousku






## 3) Uplna pravdepodobnost a Bayesova veta ------------------------------------

#### Priklad 1: 
# V zasilce 150 pytlu orechu z Turecka je 5 pytlu se zkazenymi orechy, stejne jako v zasilce 250 pytlu z Afghanistanu.
# a) Jaka je pravdepodobnost, ze nahodne vybrany pytel ze vsech pytlu obsahuje zkazene orechy?
# b) Jaka je tato pravdepodobnost, jestlize nejdrive vybereme nahodne zasilku a pak z ni teprve nahodne vybereme pytel?
# c) Pytel mel zkazene orechy, jaka je pravdepodobnost, ze byl z Afghanistanu?

# a) Znaceni: B1 = Turecko, B2 = Afghanistan, A = zkazene orechy v pytli

K = 400
kT = 150
kAf = 250
zT = 5
zAf = 5

PB1 = kT/K
PB2 = kAf/K

PApodminkaB1 = zT/kT
PApodminkaB2 = zAf/kAf

p0 = PApodminkaB1*PB1
p1 = PApodminkaB2*PB2

vysledek = p0 + p1

# b) Znaceni: B1 = nahodne vybrany pytel je z Turecka, B2 = nahodne vybrany pytel je z Afg.

B1 = 0.5
B2 = 0.5




# c) P(B2|A) = ?

PB2podminkaA = (PApodminkaB1*PB1) / vysledek


#### Priklad 2: Tri strelci
# Tri strelci (A,B,C) strili na cil. Pravdepodobnosti ZASAHU jednotlivymi strelci jsou nasledujici:
# P(A) = 0.8, P(B) = 0.6, P(C) = 0.5.
# Cil je znicem, pokud jej zasahnou vsichni strelci. Z = zniceni cile.
# Dale vime: 
#     pokud zasahnou 2 strelzi, P(Z) = 0.8
#     pokud zasahne 1 strelec, P(Z) = 0.4

# Xi --> zásah i tým počtu ran 

# -> Jaka je pravdepodobnost zniceni cile?

pA <- 0.8
pB <- 0.6
pC <- 0.5

pAn <- 1 - pA
pBn <- 1 - pB
pCn <- 1 - pC

# Dalsi znaceni: Xi = zasah i-tym poctem strelcu (X0 = 0 strelcu, X1 = 1 zasahne, X2 = 2 zasahnou, X3 = 3 zasahnou)

pZpodmX0 <- 0 #netrefí se nikdo 
pZpodmX1 <- 0.4
pZpodmX2 <- 0.8
pZpodmX2 <- 1


# Dale potrebujeme spocitat pravdepodobnosti zasahu Xi:

pX0 <- 0.2*0.4*0.5 #Nikdo se netrefí 
pX1 <- pA * pBn * pCn + pAn * pB * pCn + pAn * pBn * pC
pX2 <- pA * pB * pCn + pAn * pB * pC + pA * pBn * pC
pX3 <- pA * pB * pC



# Pravdepodobnost zniceni cile -> veta o uplne pravdepodobnosti

pZ <- (pX2 * pZpodmX2)




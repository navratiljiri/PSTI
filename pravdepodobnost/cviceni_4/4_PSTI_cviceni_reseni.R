################################################################################
## KIKM/PSTI: cviceni 4 - Pravdepodobnost I.
################################################################################

## 1) Podminena pravdepodobnost ------------------------------------------------

# Priklad 1: oslovili jsme 1000 studentu. 300 z nich studuje kombinovanou formou (KF),
# 500 studentu je na oboru financni management (FM). Studentu v KF, kteri studuji FM, je 100.
# a) Jaka je pravdepodobnost, že kdyz je student na komb. forme, ze studuje FM?
# b) Jaka je pravdepodobnost, ze kdyz student studuje FM, ze je na komb. forme?
s <- 1000
KF <- 300
FM <- 500
KFFM <- 100

pKF <- KF/s
pFM <- FM/s
pKFFM <- KFFM/s # pst P(FM "prunik" KF)

# a) podminka -> KF
# P(FM | KF) = ?
p1 <- pKFFM/pKF

# b) podminka -> FM
# P(KF | FM) = ?
p2 <- pKFFM/pFM

## 2) Priklady s mnozinami -----------------------------------------------------

## -> Pr1:

n <- 16
A <- 6
B <- 9 
AB <- 12
prunik <- 3
  
pA <- A/n
pB <- B/n
pAandB <- prunik/n
pAorB <- AB/n
pApodminkaB <- pAandB/pB
pBpodminkaA <- pAandB/pA

# nezavislost:
pA*pB
pAandB 
# -> nejsou nezavisle



## -> Pr3:

pV <- 0.35
pH <- 0.55
pOboji <- 0.2

pV*pH # nerovna se pOboji (0.2) -> jevy NEJSOU NEZAVISLE
pVpodminkaH <-pOboji/pH
pHpodminkaV <- pOboji/pV


## -> Pr4:
pH <- 1/3
pV <- 7/12
pHandV <- 1/6

pHorV <-9/12
pVpodmH <- pHandV/pH
pHpodmV <- pHandV/pV

# nezavislost:
pH*pV
pHandV
# -> nejsou nezavisle


## 3) Podminena pravdepodobnost a ciselna promenna -----------------------------

# P(X > 160) -> opacny jev k P(X<160)
p1 <- 0.2  # P(X < 160) -> pravdepodobnost, ze je clovek mensi nez 160cm -> v obrazku zadani (20%)
res1 <- 1-p1
res1

# P(X < 190 prunik X > 160) -> pravdepodobnost, ze clovek meri mezi 160 a 190 cm
p2 <- 0.95  # P(X < 190)
res2 <- p2 - p1
res2

# P(X > 190 | X > 160)
p3 <- 0.05  # P(X > 190 prunik X > 160)
res3 <- p3/(1-p1) # 1-p1 -> jev opacny k X<160; P(X<160) = 0.2
res3

# P(X<160 | X < 190)
res4 <- p1/p2 # P(X < 160 prunik X < 190) -> osoba musi byt mensi nez 160 -> tuto pst zname, je to 0.2
res4

# P(X < 190 | X > 160)
res5 <- res2/res1 # P(X<190 prunik X >160) -> viz vyse -> pravdepodobnost, ze clovek meri mezi 160 a 190 cm -> res2 = 0.75
res5


################################################################################
## KIKM/PSTI: cviceni 4 - Pravdepodobnost I.
################################################################################

## 1) Podminena pravdepodobnost ------------------------------------------------

# Priklad 1: oslovili jsme 1000 studentu. 300 z nich studuje kombinovanou formou (KF),
# 500 studentu je na oboru financni management (FM). Studentu v KF, kteri studuji FM, je 100.
# a) Jaka je pravdepodobnost, že kdyz je student na komb. forme, ze studuje FM?
# b) Jaka je pravdepodobnost, ze kdyz student studuje FM, ze je na komb. forme?

k <- 1000
kf <- 300
fm <- 500

kfAfm <- 100

pKF <- kf/k
pFm <- fm/k

pKFFM <- kfdfm / k

# a) podminka -> KF
# P(FM | KF) = ?


p <- pKF/pKFFM


# b) podminka -> FM
# P(KF | FM) = ?

p <- pKF/fm


## 2) Priklady s mnozinami -----------------------------------------------------

## -> Pr1:

n <- 16
A <- 6
B <- 9

prunik <- 3

AB <- (A+B)-prunik

pA <- A/n
pB <- B/n

pAandB <- prunik/n #sjednocení

pAorB <- AB/n #průnik

pApodminkaB <- pAandB/pB
pbpodminkaA <- pAandB/pA

pAorB == pA * pB


## -> Pr3:

pV = 0.35
pH = 0.55

prunik = 0.2

VH <- (pV+pH) - prunik


pVandH = prunik/(pV+pH)
pAorB = VH/(pV+pH)

pAorB == pV * pH

p <- 0.35/055

pVpodminkaH <- prunik/pV
pHodminkaV <- prunik/pH

## -> Pr4:

pHypoteka = 1/3
pVysokyPrijem = 7/12

n = 1/3+7/12

prunik = 1/6
HV = n - prunik


pHandV = prunik/n

pHorB = HV/n

pVpodminkaH = prunik/pHypoteka
pHpodminkaV = prunik/pVysokyPrijem


pHorB == pHypoteka * pVysokyPrijem


## 3) Podminena pravdepodobnost a ciselna promenna -----------------------------

# P(X > 160) -> opacny jev k P(X<160)
p1 <- 0.2
res1 <- 1-p1
res1

# P(X < 190 prunik X > 160) -> pravdepodobnost, ze clovek meri mezi 160 a 190 cm
p2 <- 0.95
res2 <- p2 - p1
res2

# P(X > 190 | X > 160)

res3 <- 0.05/(1-p1)

# P(X<160 | X < 190)

res4 <- p1/p2

# P(X < 190 | X > 160)

res5 <- res2 / res1

##
rm(list=ls())
n = 32
f = 16
m = 17
s = 14


pf = f/n
pm = m/n
ps = s/n

pMpodminkaS = 4/n / ps
pfpodminkaM = 8/n / pm
pMpodminkaF = 8/n / pf


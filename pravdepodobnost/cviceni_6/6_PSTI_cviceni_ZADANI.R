################################################################################
## KIKM/PSTI: cviceni 6 - Diskretni nahodna velicina
################################################################################
rm(list=ls())
# Priklad 1 --------------------------------------------------------------------
# Nahodna velicina X: co padne pri hodu minci. Panna = 1, orel = 0. Spocitejte pro
# tuto nahodnou velicinu nasledujici vyrazy:

# a) E(2X+3)
# b) E(4X^2 + 5X + 2)
# c) var(6X - 7)
# d) var(X^2 + 3)

X <- c(0,1) #realizace
pst <- c(0.5,0.5) #pravděpodobnoti 

EX <- sum(X*pst)
EX

EX2 <- sum(X^2*pst)
EX2

EX4 <- sum(EX2^2*pst)

#var E(x2) - (Ex)2
rozptylx <- EX2 - (EX)^2

# a) E(2X+3) = 2*E(X) + 3
a <- 2 * EX + 3


# b) E(4X^2 + 5X + 2) = 4*E(X^2) + 5*E(X) + 2
b <- 4*EX2 + 5 * EX + 2

# c) var(6X - 7) = 36*var(X) - 0
c <- 36 * rozptylx - 0

# d) var(X^2 + 3) = var(X^2) + 0 = E(X^4) - (E(X^2))^2
d <- EX4 - (EX2)^2



# Priklad 2 --------------------------------------------------------------------
# Nahodna velicina Y: na hraci kostce padne cislo. 
# Spocitejte nasledujici vyrazy:

Y <- 1:6
pstY <- rep(1/6,6)
EY <- sum(Y*pstY)

# a) Z1 = 4*Y^2 - 5*Y + 2
Z1 <- 4*Y^2 - 5*Y + 2 
Ez1 <- sum(Z1*pstY)
# b) Z2 = 6*Y - 7
Z2 <- 6*Y-7
Ez2 <- sum(Z2*pstY)
# c) oznacme W = Z2; var(W) = E(W^2) - (EW)^2
W <- Z2
W2 <- W^2
EW<- Ez2
EW2 <- sum(W2 * pstY)

EW2 - (EW)^2


# a) Z1 = 4*Y^2 - 5*Y + 2


# b) Z2 = 6*Y - 7


# c) oznacme W = Z2; var(W) = E(W^2) - (EW)^2




# Priklad 3 --------------------------------------------------------------------
# Pravdepodobnost, ze klient banky ma uver, je 0.9.
# Popiste rozdeleni poctu klientu BEZ UVERU mezi tremi vybranymi klienty. 
# -> definicni obor, pravdepoodbnostni funkci, E(X), var(X)
# oznacme velicinu opet jako X
p <- 0.9  # pravdepodobnost, ze klient MA UVER

# a) definicni obor:
X <- 0:3

# b) pravdepodobnostni funkce: uvazujeme nezavislost (to, jestli klient ma nebo nema uver, nezavisi na ostatnich klientech)
Px0 <- 0.9^3
Px1 <- 3 * 0.1 * 0.9^2
Px2 <- 3 * 0.1^2 * 0.9
Px3 <- 0.1 ^3

pst <- c(Px0, Px1, Px2, Px3)
Px0+Px1+Px2+Px3

# c) stredni hodnota E(X)
# sum(Xi  * Pi)
Ex <- sum(X * pst)


# d) rozptyl var(X)
# vime: var(X) = E(X-E(X))^2
# oznacme: y = (X-E(X))^2
Y <- (X-Ex)^2
rozptylX <- sum(pst*Y)

# Priklad 4 --------------------------------------------------------------------
# Nahodna velicina ma nasledujici pravdepodobnostni funkci:
# P(x) = 3/7 * (0.7^x) pro x = 1, 2, 3...
# Jaka je pravdepodobnost, ze tato nahodna velicina nabude hodnoty:
# a) mensi nez 3
# b) vetsi nez 4
# c) vetsi nez 1 a zaroven ale mensi nez 4

# a) P(X<3) = P(X=1) + P(X=2)
x <- c(1,2)
vysl1 <- sum(3/7 * 0.7^x)


# b) P(X > 4) = 1 - P(X<=4)
x <- 1:4
vysl2 <- 1-sum(3/7*(0.7^x))

# c) P(1 < X < 4) = P(X=2) + P(X=3)
x <- c(2,3)
vysl3 <- sum(3/7*0.7^x)


# Priklad 5 --------------------------------------------------------------------
# Zkouska spolehlivosti 5 pristroju: dalsi se zkousi jen tehdy, je-li predchozi spolehlivy.
# Pristroj vydrzi zkousku s pravdepodobnosti 0.9
# Nahodna velicina X = pocet zkousenych pristroju.
# Urcete definicni obor a rozdeleni pravdepodobnosti

p <- 0.9

# Definicni obor:

x <- 1:5

# Rozdeleni pravdepodobnosti:

P0 <- 0.1
P1 <- 0.9 * 0.1
P2 <- 0.9^2 * 0.1
P3 <- 0.9^3 * 0.1
P4 <- 0.9^4

pst <- c(P0,P1,P2,P3,P4)
# kontrola: sum(pst) = 1


# znazorneme si rozdeleni pravdepodobnosti take graficky:
x <- (1:6) # pro vizualizaci pridame jednu hodnotu navic -> aby od 5 sel graf "do nekonecna"
pst

Fx <- cumsum(c(pst,0)) # nula opet jen pomocna pro vizualizaci (at ma graf kam pokracovat "do nekonecna")
n <- length(x)


plot(x = NA, y = NA, pch = NA,  yaxt="n",     # x = NA, y = NA -> prazdny graf, yaxt = "n" -> bez popisku osy "y"
     xlim = c(0, max(x)), 
     ylim = c(0, 1),
     xlab = "x",
     ylab = "F_X(x)",
     main = "Distribucni funkce diskretni nahodne veliciny X: pristroje",
     cex.lab = 1.4) # velikost popisku os

# seda prerusovana cara -> hranice os a 1
abline(h = c(0,1), v = 0, lty = 2, col = "grey45")

# pridame rucne cisla na osu "y"
axis(side=2, at=Fx, las = 2) # las -> otoci popisky osy

# doplnime hodnoty do grafu distribucni funkce
points(x = x, y = Fx, pch=19)
for(i in 1:n){
  points(x=x[i+0:1], y=Fx[c(i,i)], type="l")
  points(x = x[-1], y = Fx[-n], pch=19, col="white")
  points(x = x[-c(1,n)], y = Fx[-c(n-1,n)], pch=1)
} 


# Priklad 6 --------------------------------------------------------------------
# Ctyri krizovatky jsou rizene nezavislymi semafory. Uvazujeme jen cervenou a zelenou.
# Pravdepodobnost, ze sviti cervena, je 0.5 (stejne tak pro zelenou).
# X = pocet projetych krizovatek do prvni krizovatky, kdy MUSIME ZASTAVIT
# Urcete definicni obor, rozdeleni pravdepodobnosti a vizualizujte distribucni funkci.
p <- 0.5

# definicni obor

# rozdeleni pravdepodobnosti:


# vizualizace:




# Priklad 7 --------------------------------------------------------------------
# Nahodna velicina X: pocet obsazenych pokoju v hotelu. 
# Urcete PRAVDEPODOBNOST OBSAZENI POKOJU, je-li distribucni funkce zadana nasledovne:
# F(x) = 0..........x < 4
# F(x) = 0.03.......4 <= x < 5
# F(x) = 0.2........5 <= x < 6
# F(x) = 0.3........6 <= x < 7
# F(x) = 1..........x > 7

fx <- c(0,0.03,0.2,0.3,1)



# znazornime nejprve graficky:



# Pravdepodobnosti jsou velikosti skoku v grafu:

# P(X = 4)


# P(X = 5)


# P(X = 6)


# P(X = 7)



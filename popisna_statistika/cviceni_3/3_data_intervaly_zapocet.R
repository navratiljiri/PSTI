################################################################################
## VZOROVE RESENI: RUZNE SITUACE PRI VYTVARENI INTERVALU -> data "Cv3.xlsx"
################################################################################

library(readxl)
# - Spocitejte zakladni ciselne charakteristiky (prumer, rozptyl, smerodatnou odchylku, sikmost, spicatost) pro data v souboru "Cv3".
# - Pomoci Sturgesova pravidla data rozdelte do intervalu. Pocty intervalu + jejich sirku vhode zaokrouhlete (sirku na cele desitky NAHORU)
# - Vytvorte tabulku cetnosti hodnot pro dane intervaly. Dale vytvorte data frame, ktery bude obsahovat: rozpeti intervalu, stred intervalu a absolutni cetnosti v danych intervalech.
# - Pro data v intervalech spocitejte vazene ciselne charakteristiky.

# DULEZITE: pred nactenim datoveho souboru se na nej podivejte v Excelu:
# - je v datech v prvnim radku nazev sloupce?
# - jsou hodnoty oddelene desetinnou carkou nebo teckou?

# nacteme datovy soubor "Data_long.xlsx"
df <- read_excel("Cv3.xlsx",col_names = T) # tato funkce si poradi s desetinnymi carkami -> musime jen zadat, ze prvni radek je nazev sloupce (col_names)
head(df)

# zakladni info o datech:
nrow(df)
summary(df)

# Rozdeleni dat do intervalu:

# 1. Kolik intervalu/kategorii potrebujeme -> K (Sturgesovo pravidlo)
N <- nrow(df) # pocet hodnot v datech

K <- 1 + 3.3*log(N, base = 10) # parametr base -> zaklad logaritmu (log je v R defaultne prirozeny logaritmus "ln")

# 2. Sirka intervalu

vr <- max(df$X) - min(df$X)   # variacni rozpeti
sirka <- vr/K

################################################################################
## Situace 1: nevyjdou nam podminky pro A1, Bk

# zaokrouhleme:
K2 <- round(K) # vyslo 13 intervalu

sirka # 65.28746
sirka2 <- 66

# -> 13 intervalu, sirka2 = 66 (zaokrouhleno NAHORU na cele jednotky)

# 3. Vytvoreni intervalu -> funkce cut()
A1 <- floor(min(df$X)) # A1 musi byt mensi nez x_min -> pomoci funkce floor najdeme nejblizsi celou cast MENSI nez x_min (lze vyresit i uvahou)

# -> A1 = 2 pomoci funkce floor

intervaly <- cut(df$X,
                 breaks = seq(A1, K2*sirka2, by = sirka2),
                 labels = paste0(seq(A1, (K2-1)*sirka2, by = sirka2),"-",seq(A1+sirka2, K2*sirka2, by = sirka2))) # funkce paste0 -> vytvoreni textoveho retezce

# POZOR: funkce cut data rozdelila jen do 12 intervalu! Provedeme kontrolu:

seq(A1, K2*sirka2, by = sirka2) # posloupnost z parametru "breaks"
# A1 = 2 < x_min -> v poradku
# Bk = 782 < x_max -> POZOR: Bk je mensi nez x_max! -> zkusime zvolit o neco sirsi intervaly

sirka2 <- 70
intervaly <- cut(df$X,
                 breaks = seq(A1, K2*sirka2, by = sirka2),
                 labels = paste0(seq(A1, (K2-1)*sirka2, by = sirka2),"-",seq(A1+sirka2, K2*sirka2, by = sirka2))) # funkce paste0 -> vytvoreni textoveho retezce

# opet 12 intervalu. Provedeme kontrolu:
seq(A1, K2*sirka2, by = sirka2) # posloupnost z parametru "breaks"
# A1 = 2 < x_min -> v poradku
# Bk = 782 > x_max -> v poradku

# Zaver: i kdyz jsme puvodne zaokrouhlili intervaly na 13, se zvolenou sirkou intervalu funkce cut() data rozdelila do 12. To nevadi, i pocty intervalu
# muzeme zaokrouhlit o 1-2 nahoru/dolu. Dulezite je provest KONTROLU pro A1, Bk. Ta nam s puvodni sirkou intervalu nevysla, proto jsme zkusili sirku o neco vic 
# zaokrouhlit (na CELE DESITKY NAHORU). Zaokrouhleni z puvodnich 65.28746 na 70 je pripustne, nejedna se o vyrazne vyssi hodnotu.

################################################################################

################################################################################
## Situace 2: funkce cut() opet vytvori o interval mene

# zaokrouhleme:
K2 <- round(K) # vyslo 13 intervalu

sirka # 65.28746
sirka2 <- 70 # rovnou zaokrouhlime na 70

# -> 13 intervalu, sirka2 = 70 (zaokrouhleno NAHORU na cele desitky)

# 3. Vytvoreni intervalu -> funkce cut()
A1 <- floor(min(df$X)) # A1 musi byt mensi nez x_min -> pomoci funkce floor najdeme nejblizsi celou cast MENSI nez x_min (lze vyresit i uvahou)

# -> A1 = 2 pomoci funkce floor
# pripustna by byla i volba A1 = 0 (uvahou) -> neni to o moc mensi nez 2, intervaly potom budou 0-70, 70-140 atd.

intervaly <- cut(df$X,
                 breaks = seq(A1, K2*sirka2, by = sirka2),
                 labels = paste0(seq(A1, (K2-1)*sirka2, by = sirka2),"-",seq(A1+sirka2, K2*sirka2, by = sirka2))) # funkce paste0 -> vytvoreni textoveho retezce

# POZOR: funkce cut data rozdelila jen do 12 intervalu! Provedeme kontrolu:

seq(A1, K2*sirka2, by = sirka2) # posloupnost z parametru "breaks"
# A1 = 2 < x_min -> v poradku
# Bk = 842 > x_max -> v poradku

K2 <- 12 # upravime pocet intervalu, at muzeme pracovat dat

# Zaver: i kdyz jsme pocet intervalu zaokrouhlili na 13, funkce cut() jich vytvorila 12. To ale nevadi, podminky pro A1, Bk plati, tak si po vytvoreni
# intervalu jen upravime pocet intervalu na K2 = 12. Dale bychom pokracovali jako v predchozich prikladech:
# - spocitat stredy intervalu Xk
# - cetnosti hodnot v intervalech Nk
# - zakladni popisna statistika pro data v puvodnim data framu "df"
# - zakladni popisna statistika pro data v kategoriich/intervalech
# - srovname oba vypocty
# - vizualizace pomoci barplotu

# Pozn.: pokud by nam pri rozdelovani dat do intervalu vysel nejaky interval prazdny (typicky nektery z krajnich), tak jsme vytvorili nejaky navic:
# - mozna prilis nizka hodnota A1 (typicky kdyz A1 volime podle uvahy a zvolili bychom prilis nizke)
# - pocet intervalu zvolime vyssi
################################################################################




# Definindo altura e peso
altura <- 1.88
peso <- 80

# Calculando o IMC (Índice de Massa Corporal)
IMC <- peso / (altura^2)

# Exibindo o resultado do IMC
IMC

ls()

rm(list = ls())
ls()

# Criando vetores
x <- c(2,5,7,5,7,2)
x

y  <- c(1,5,2,1,7,2)
xy <- x+y
xy

z <- c(1,2,3,4)
xz <- x+z

cat("\n", z, "\n", x, "\n", xz)

xy * 2

z <- c("Squall","Strife","Artorias","Ed")
z

typeof(x)

typeof(z)

seq(10 , 100, by = 10)

rep(c(10,20,30) , 3)

set.seed(1354)
runif(min = 1, max = 100, n = 10)

set.seed(1354)
normal <- rnorm(10, mean = 0, sd = 1)
normal

round(normal,2)

# Listas
lista = list(y,x,z)
lista

lista[[3]]

# Converter tipos
set.seed(1354)
as.integer(runif(min = 1, max = 100, n = 10))

nums <- c("1.5","2","3","4","5")
typeof(nums)

nums0 <- as.numeric(nums)
typeof(nums0)

nums0

nums1 <- as.character(nums0)
typeof(nums1)

nums1


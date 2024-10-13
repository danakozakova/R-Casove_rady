# EXERCISE 3.1
## Generate a trajectory of length N = 50 of the moving average process (MA)
## X_t=ε_t+a*ε_t−1,{εt}∼WN(0,σ^2/(1+a^2))
## σ^2 = 1
## For each trajectory compute the means of the first n observations, n=1,…,N.
## Plot the series of means and observe its convergence. Compare the plots for different "a"
## in terms of the width and shape of the cloud of points.

## Solution:
### Setting data
set.seed(1)
N <- 50
a1 <- -0.8
a2 <- 0.8
a3 <- 0

### Generating random values
e <- rnorm(N+1)
#### MA process with negative a = -0.8
x1 <- (e[-1] + a1 * e[1:N])/sqrt(1+a1^2)
#### MA process with positive a = 0.8
x2 <- (e[-1] + a2 * e[1:N])/sqrt(1+a2^2)
#### MA process with a = 0
x3 <- (e[-1] + a3 * e[1:N])/sqrt(1+a3^2)

### Plot of trajectories
op <- par(mfrow=c(1,3))
plot(x1, xlab = '', ylab ='', main = paste('a =', a1), ylim = c(-3,3), type='o')
plot(x2, xlab = '', ylab ='', main = paste('a =', a2), ylim = c(-3,3), type='o')
plot(x3, xlab = '', ylab ='', main = paste('a =', a3), ylim = c(-3,3), type='o')
par(op) # restoring the original graphic parameters

### Means of the first n observations
m1 <- cumsum(x1)/(1:N)
m2 <- cumsum(x2)/(1:N)
m3 <- cumsum(x3)/(1:N)

### Plot of means
#### matplot - vykreslenie viacerych trajektorii do jedneho grafu
#### cbind() - spoji vektory do matice
#### type = "o" - body spojene ciarkami
#### pch = 1 - prazdny kruzok
#### lty = 1 - plna ciara

matplot(cbind(m1, m2, m3), type = 'o', pch = 1, lty = 1, ylab='')
legend("bottomright", legend = paste('a = ', c(a1, a2, a3)), lty = 1, col = 1:3, bty = 'n')

#### lty = 1 - plna ciara v legende
#### col = 1:3 - prve tri farby z palety pre polozky v legende
#### bty = 'n' - bez ramceka okolo legendy

### Generate 20 trajectories of length N = 50 for different values of a
M <- 20

### Generating random values in matrix 
e <- matrix(rnorm((N+1)*M), N+1, M)
#### matrix(data, nrow, ncol) - skonvertuje vektor dat do matice mrow x ncol

### MA processes - now through function
MA_creation <- function(e, a) (e[-1] + a*head(e, -1))/sqrt(1+a^2)
#### Note: head(e, -1) funguje rovnako ako e[1:N, ], lepsie je nedavat N do tela funkcie 
#### e[-1,] vrati vsetky riadky okrem prveho
#### head(e, -1) vrati vsetky riadky okrem posledneho
#### 50+1 nahodnych cisel, t.j. jedna simulacia je v stlpci
#### je M stlpcov, teda M = 20 simulacii

x1 <- apply(e, 2, MA_creation, a = a1)
#### parameter 2 znamena, ze funkcia bude aplikovana nad stlpcami matice 
x2 <- apply(e, 2, MA_creation, a = a2)
x3 <- apply(e, 2, MA_creation, a = a3)

### The means of the first n observations, n=1,...,N
m_sums <- function(x) cumsum(x)/(1:length(x))
m1 <- apply(x1,2,m_sums)
m2 <- apply(x2,2,m_sums)
m3 <- apply(x3,2,m_sums)

# plot
# the width decreases as 1/sqrt(n) but the scale depends on the autocorrelation
op <- par(mfrow=c(1,3))
ylim <- c(-2,2)
matplot(m1,col=1,type="l",lty=1,pch=1,main=paste("a =",a1),ylab="",xlab="n",ylim=ylim)
matplot(m2,col=2,type="l",lty=1,pch=1,main=paste("a =",a2),ylab="",xlab="n",ylim=ylim)
matplot(m3,col=3,type="l",lty=1,pch=1,main=paste("a =",a3),ylab="",xlab="n",ylim=ylim)
par(op)

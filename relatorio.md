# Relatório do EP2 de MAC0210 (Laboratório de Métodos Numéricos)
#### Prof. Ernesto G. Birgin - Junho de 2022

##### Alunas: Luísa Menezes da Costa - nºUSP 12676491 | Sabrina Araújo da Silva - nºUSP 12566182

## compress

~~~matlab
compress(originalImg, k)
~~~
A função *compress* recebe uma imagem em .png e uma constante $k$. A imagem é transformada em uma matriz *originalImg* de dimensões $linhas\times colunas\times 3$. Após a leitura da imagem, o número de linhas/colunas da matriz é armazenado em *p*. Utilizando a fórmula dada[^1], calculamos o novo lado $n$ da imagem a ser comprimida. Depois, criamos uma matriz nula *img* $n\times n\times 3$, em que serão adicionados elementos da matriz *originalImg* na nova matriz nula *img* conforme a seguinte fórmula:

$$
(x_i,y_j, :)=((x-1)(k+1)+1, (y-1)(k+1)+1, :)
$$

**Legenda:**

$(x_i,y_j, :)$: coordenadas do elemento de abscissa $x_i$ e ordenada $y_j$ da matriz *img* no RGB

$(x,y, :)$: coordenadas do elemento de abscissa $x$ e ordenada $y$ da matriz *originalImg* no RGB

$k$: número de linhas/colunas retiradas da matriz *originalImg* (taxa de compressão)

Após a atualização da matriz *img* com os valores adequados, o programa lê os valores de *img* com tamanho de 8 bits (o que garante a cor em imagens coloridas) e transforma a matriz em uma imagem comprimida.

## decompress

~~~matlab
 decompress(compressedImg, method, k, h)
~~~
### Descompressão da imagem

A função *decompress* recebe uma imagem em .png, uma constante *method*, $k$ e $h$. A imagem é transformada em uma matriz *compressedImg* de dimensões $linhas\times colunas\times 3$. Após a leitura da imagem, o número de linhas/colunas da matriz é armazenado em *p*. Utilizando a fórmula dada[^1], calculamos o novo lado $p$ da imagem a ser descomprimida. Depois, criamos uma matriz de valor $-1$[^2] *img* de dimensões $n\times n\times 3$, em que serão adicionados elementos da matriz *compressedImg* com elementos de *compressedImg* na nova matriz *img*, sendo que entre cada linha/coluna de *img* irá existir uma linha/coluna composta exclusivamente de valor $-1$ (exceto antes das linhas/colunas de índice $1$ e depois das linhas/colunas de índice $n$), conforme a seguinte fórmula:

$$
((x-1)(k+1)+1, (y-1)(k+1)+1, :)=(x_i,y_j, :)
$$

**Legenda:**

$(x_i,y_j, :)$: coordenadas do elemento de abscissa $x_i$ e ordenada $y_j$ da matriz *compressedImg* no RGB

$(x,y, :)$: coordenadas do elemento de abscissa $x$ e ordenada $y$ da matriz *img* no RGB

$k$: número de linhas/colunas de valor $-1$ adicionadas entre cada linha/coluna de *compressedImg* (taxa de descompressão)

Após a atualização da matriz *img* com os valores adequados, o programa lê os valores de *img* com tamanho de 8 bits (o que garante a cor em imagens coloridas) e transforma a matriz em uma imagem descomprimida.

###  Interpolação Bilinear Por Partes

Se $method==1$, o método selecionado para interpolação será o bilinear. Para cada ponto $(x,y)$ a ser interpolado na matriz *img*, devemos calcular o valor $f(x, y) \approx p_{ij}(x, y) = a_0 + a_1(x − x_i) + a_2(y − y_j) + a_3(x − x_i)(y − y_j)$, de acordo com o seguinte sistema linear:

$$
F = H \times A
$$

$$
\begin{bmatrix} 
   f(x_i,y_j) \\
   f(x_i,y_{j+1}) \\
   f(x_{i+1},y_j) \\
   f(x_{i+1},y_{j+1})
\end{bmatrix} =
\begin{bmatrix}
   1\ 0\ 0\ 0 \\
   1\ 0\ h\ 0 \\
   1\ h\ 0\ 0 \\
   1\ h\ h\ h^2
\end{bmatrix}
\begin{bmatrix}
   a_0 \\
   a_1 \\
   a_2 \\
   a_3
 \end{bmatrix}
$$

A matriz F representa os pontos nas diagonais do ponto $(x,y)$ que receberá o valor interpolado. A matriz H é definida pelo $h$ inserido pelo usuário. A matriz A representa os valores a serem encontrados e utilizados no polinômio interpolador. Esse processo será feito simultaneamente para cada ponto $(x,y)$ do RGB; portanto, as matrizes $F$ e $A$ terão dimensões $4\times 1\times 3$.

###  Interpolação Bicubica

coisa de nerd

## calculateError

~~~matlab
 calculateError(originalImg, decompressedImg)
~~~

A função *calculateError* lê as 6 matrizes correspondentes aos RGBs de *originalImg* e *decompressedImg* e calcula o erro, por meio da norma 2, entre a imagem original e a imagem que passou pelos processos de compressão, descompressão e interpolação. Para tanto, as matrizes originais, do tipo *uint8*, foram transformadas em tipo *double* (tipo suportado pela função embutida *norm* do Octave), sem alterações nos valores das matrizes.

## O Zoológico

Aqui usamos uma função $ f:\mathbb{R}^2 \to \mathbb{R}^3  $ de classe $ C^2 $ para gerar uma imagem grande em RGB. Segue alguns dos testes:

### Teste 1.

$$ f(x, y) = (sen(x),\frac{sen(y) + sen(x)}{2} , sen(x)) $$

* Funciona bem para imagens preto e branco?
* Funciona bem para imagens coloridas?
* Funciona bem para todas as funções de classe $C^2$?
* E para funções que não são de classe $C^2$?
* Como o valor de $h$ muda a interpolação?
* Como se comporta o erro?

Responda também a esta questão:
Considere uma imagem de tamanho $p^2$. Comprima-a com k = 7. Para obter a descompressão, podemos
rodar decompress com k = 7. Experimente alternativamente usar decompress três vezes com k = 1 nas
três. Compare os resultados. Escreva no relatório suas conclusões.

## A Selva

Aqui usamos uma imagem real (foto ou desenho) para testar o método de compressão (comprimir, descomprimir e calcular o erro).

* Funciona bem para imagens preto e branco?
* Funciona bem para imagens coloridas?
* **Como o valor de $h$ muda a interpolação?** Quanto maior o $h$, mais nítida ficam as imagens interpoladas.
* Como se comporta o erro?

## Teste para "sailor.png" (dimensões: 250x250)

### Original

![sailor](https://github.com/clair-de-lume/mac210-ep2/blob/main/imagens/sailor.png)

### *compress* com k = 1
![sailor1](https://github.com/clair-de-lume/mac210-ep2/blob/main/imagens/sailor1.png)

### *compress* com k = 5
![sailor5](https://github.com/clair-de-lume/mac210-ep2/blob/main/imagens/sailor5.png)

### *compress* com k = 10
![sailor10](https://github.com/clair-de-lume/mac210-ep2/blob/main/imagens/sailor10.png)

### *decompress* com k = 1, método bilinear e h = 1
![d_hanako1](https://github.com/clair-de-lume/mac210-ep2/blob/main/imagens/sailor/d_sailor1.png)

### *decompress* com k = 5, método bilinear e h = 1
![d_hanako5](https://github.com/clair-de-lume/mac210-ep2/blob/main/imagens/sailor/d_sailor5.png)

### *decompress* com k = 10, método bilinear e h = 1
![d_hanako15](https://github.com/clair-de-lume/mac210-ep2/blob/main/imagens/sailor/d_sailor15.png)

### *calculateError*

A imagem *"sailor.png"* tem dimensões $250\times 250$ e após comprimida e descomprimida com $k=1$, fica com dimensões $249\times 249$. Isso acontece pois, para $p=250$ e $k=1$, o $n$ calculado será $125.5$, ou seja, não inteiro. Logo, esse valor de $n$ faz com que a imagem descomprimida tenha dimensões diferentes da imagem original. 

A função *calculateError* só consegue calcular o erro entre matrizes de mesma dimensão. Assim, é impossível calcular o erro para *"sailor.png"* com $k=1$.

## Teste para "hanako.jpg" (dimensões: 433x433)

### Original

![hanako](https://github.com/clair-de-lume/mac210-ep2/blob/main/imagens/hanako/hanako.jpg)

### *compress* com k = 5
![hanako5](https://github.com/clair-de-lume/mac210-ep2/blob/main/imagens/hanako/c_hanako5.png)

### *compress* com k = 15
![hanako15](https://github.com/clair-de-lume/mac210-ep2/blob/main/imagens/hanako/c_hanako15.png)

### *compress* com k = 35
![hanako35](https://github.com/clair-de-lume/mac210-ep2/blob/main/imagens/hanako/c_hanako35.png)

### *decompress* com k = 5, método bilinear e h = 1
![hanako5](https://github.com/clair-de-lume/mac210-ep2/blob/main/imagens/hanako/d_hanako5.png)

### *decompress* com k = 15, método bilinear e h = 1
![hanako15](https://github.com/clair-de-lume/mac210-ep2/blob/main/imagens/hanako/d_hanako15.png)

### *decompress* com k = 35, método bilinear e h = 1
![hanako35](https://github.com/clair-de-lume/mac210-ep2/blob/main/imagens/hanako/d_hanako35.png)

### *calculateError*

(Todos os valores de $k$ foram escolhidos de forma que $n \in \mathbb{N}$.)

* Comprimida e descomprimida com k=5 &rarr; Erro = 0.2727
* Comprimida e descomprimida com k=15 &rarr; Erro = 0.6539
* Comprimida e descomprimida com k=35 &rarr; Erro = 0.9531

## Teste para "nezuko.jpg" (dimensões: 1200x1200)

### Original

![sailor](https://github.com/clair-de-lume/mac210-ep2/blob/main/imagens/nezuko.jpg)

### *compress* com k = 10
![nezuko10](https://github.com/clair-de-lume/mac210-ep2/blob/main/imagens/nezuko10.png)

### *compress* com k = 25
![nezuko25](https://github.com/clair-de-lume/mac210-ep2/blob/main/imagens/nezuko25.png)

### *compress* com k = 10
![nezuko100](https://github.com/clair-de-lume/mac210-ep2/blob/main/imagens/nezuko100.png)

### *calculateError*

(Todos os valores de $k$ foram escolhidos de forma que $n \in \mathbb{N}$.)

* Comprimida e descomprimida com k=10 &rarr; Erro = 0.5040
* Comprimida e descomprimida com k=108 &rarr; Erro = 1.9473
* Comprimida e descomprimida com k=1198 &rarr; Erro = 4.1383

## Teste para "bokunohero.jpg" (dimensões: 399x399)

### *calculateError* 

Valores de $k$ para os quais $n \in \mathbb{N}$: 1, 198, 397

* Comprimida e descomprimida com k=1 &rarr; Erro = 0.032252
* Comprimida e descomprimida com k=198 &rarr; Erro = 1.1329
* Comprimida e descomprimida com k=397 &rarr; Erro = 1.3415

[^1]: $p=n+(n-1)k$
[^2]: Os valores da matriz são todos iguais a $-1$ para facilitar o processo de interpolação: o sistema RGB é representado por números de 0 até 255; logo, os pontos a serem interpolados não podem estar nesse intervalo para evitar interpolações desnecessárias.

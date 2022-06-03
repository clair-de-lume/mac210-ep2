# Relatório do EP2 de MAC0210 (Laboratório de Métodos Numéricos)
# Prof. Ernesto G. Birgin
# Junho de 2022

### Alunas:
### Luísa Menezes da Costa - nºUSP 12676491
### Sabrina Araújo da Silva - nºUSP 12566182

(pode arrumar a vontade oq eu euscrecvi se ficar ruim, n sou de humanas)

teste

$$
   f(x,y) = \sin(x+y)
$$

fofinho da pra colocar coisa matematica q nem em latex

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

$k$: taxa de compressão

Após a atualização da matriz *img* com os valores adequados, o programa lê os valores de *img* com tamanho de 8 bits (o que garante a cor em imagens coloridas) e transforma a matriz em uma imagem comprimida.
## decompress

~~~matlab
 decompress(compressedImg, method, k, h)
~~~
A função *decompress* recebe uma imagem em .png, uma constante *method*, $k$ e $h$. A imagem é transformada em uma matriz *compressedImg* de dimensões $linhas\times colunas\times 3$. Após a leitura da imagem, o número de linhas/colunas da matriz é armazenado em *p*. Utilizando a fórmula dada[^1], calculamos o novo lado $p$ da imagem a ser descomprimida. Depois, criamos uma matriz de valor $-1$[^2] *img* de dimensões $n\times n\times 3$, em que serão adicionados elementos da matriz *compressedImg*, sendo que entre cada linha/coluna irá existir uma linha/coluna composta exclusivamente de valor $-1$ (exceto antes das linhas/colunas de índice $1$ e depois das linhas/colunas de índice $n$) com elementos de *compressedImg* na nova matriz nula *img* conforme a seguinte fórmula:

$$
((x-1)(k+1)+1, (y-1)(k+1)+1, :)=(x_i,y_j, :)
$$

**Legenda:**

$(x_i,y_j, :)$: coordenadas do elemento de abscissa $x_i$ e ordenada $y_j$ da matriz *compressedImg* no RGB

$(x,y, :)$: coordenadas do elemento de abscissa $x$ e ordenada $y$ da matriz *img* no RGB

$k$: taxa de compressão

Após a atualização da matriz *img* com os valores adequados, o programa lê os valores de *img* com tamanho de 8 bits (o que garante a cor em imagens coloridas) e transforma a matriz em uma imagem descomprimida.

###  Interpolação Bilinear Por Partes

é so ler aqui >> https://en.wikipedia.org/wiki/Bilinear_interpolation << e fazer n sei pq fica pedindo ep 
to brincando prof n me reprova

###  Interpolação Bicubica

coisa de nerd

## calculateError

~~~matlab
 calculateError(originalImg, decompressedImg)
~~~

a função que tamo achando que é facil mas *(NAO TO ZIKANDO)* quer ver q vai dar uns negocio loco

## O Zoológico

Aqui usamos uma função $ f:\mathbb{R}^2 \to \mathbb{R}^3  $ de classe $ C^2 $ para gerar uma imagem grande em RGB. Segue alguns dos testes:

### Teste 1.

$$ f(x, y) = (sen(x),\frac{sen(y) + sen(x)}{2} , sen(x)) $$

### Conclusões

<li>Funciona bem para imagens preto e branco?<li\>
<li>Funciona bem para imagens coloridas?<li\>
<li>Funciona bem para todas as funções de classe C2?<li\>
<li>E para funções que não são de classe C2?<li\>
<li>Como o valor de h muda a interpolação?<li\>
<li>Como se comporta o erro?<li\>
 
<li>Responder também:<li\>
  
*Considere uma imagem de tamanho p2. Comprima-a com k = 7. Para obter a descompressão, podemos
rodar decompress com k = 7. Experimente alternativamente usar decompress três vezes com k = 1 nas
três. Compare os resultados. Escreva no relatório suas conclusões.*

## A Selva

Aqui usamos uma imagem real (foto ou desenho) para testar o método de compressão (comprimir, descomprimir e calcular o erro).

### Conclusões
  
<li>Funciona bem para imagens preto e branco?<li\>
<li>Funciona bem para imagens coloridas?<li\>
<li>Funciona bem para todas as funções de classe C2?<li\>
<li>E para funções que não são de classe C2?<li\>
<li>Como o valor de h muda a interpolação?<li\>
<li>Como se comporta o erro?<li\>

[^1]: $p=n+(n-1)k$
[^2]: Os valores da matriz são todos iguais a $-1$ para facilitar o processo de interpolação: o sistema RGB é representado por números de 0 até 255; logo, os pontos a serem interpolados não podem estar nesse intervalo para evitar interpolações desnecessárias.

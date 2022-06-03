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

## decompress

~~~matlab
 decompress(compressedImg, method, k, h)
~~~

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


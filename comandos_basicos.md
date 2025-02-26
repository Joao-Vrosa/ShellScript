>> COMANDOS BASICOS DO LINUX/SHELL <<

cd > entrar e sair de diretórios
cd - > volta pro diretório anterior
ps axu > mostra os processos que estão executando
touch > cria arquivos e atualiza horário do arquivo se utilizado em arquivo existente
mkdir > cria diretório
rm > remove arquivos
rmdir > remove diretório vazio (se tiver conteúdo dentro do diretório, não funciona)
rm -r > remove arquivos e diretórios (tendo conteúdo ou não)
sleep > conta o tempo
comando --help > retorna o manual de utilização do comando

====================================================================================

>> COMANDOS BASICOS DO LINUX/SHELL - Manipulação de Arquivos Texto <<

cat > retorna o conteúdo de um arquivo
cat -b > retorna o conteúdo do arquivo, ignorando as linhas em branco (as linhas retornadas são numeradas)
cat -n > retorna o conteúdo do arquivo, mostrando todas as linhas (inclusive as em branco)
cat -A > retorna o conteúdo do arquivo, mostrando os caracteres especiais (incluindo espaços)
tac > retorna o conteúdo do arquivo do fim para o inicio
tail > retorna as ultimas 10 linhas do arquivo (por padrão)
tail -n5 > retorna as ultimas 5 linhas do arquivo ou conforme for inserido no parâmetro '-nX'
wc > retorna a quantidade de caracteres de um arquivo (retorna >> linha, palavras, quantidade de caracteres)
wc -m > retorna a quantidade de caracteres/bytes de um arquivo, somente
sort > ordena o arquivo (letras e números)
sort -r > ordena o arquivo ao contrario (letras e números)
sort ARQUIVO | uniq > retorna as linhas únicas do arquivo (linhas que não se repetem)
sort ARQUIVO | uniq -u > retorna as linhas que não se repetem
sort ARQUIVO | uniq -d > retorna as linhas que se repetem
tr > traduz ou apaga caracteres
cat ARQUIVO | tr A E > todas as letras "A" do arquivo serão traduzidas para a letra "E"
cat ARQUIVO | tr a-z A-Z > todas as letras de "a" a "z" serão traduzidas para "A" a "Z" em maiúsculo
cat ARQUIVO | tr [:lower:] [:upper:] > todas as letras do arquivo serão traduzidas para ficar em maiúsculo
cut > recortar partes de uma string
diff > compara arquivos
grep -i > busca no conteúdo do arquivo, usando o parâmetro "-i" que retira o case-sensitive
grep -c NOME > busca no conteúdo do arquivo, usando o parâmetro "-c" que conta quantas vezes a string se repetiu no conteúdo do arquivo
grep -r NOME > se o grep for utilizado em um diretório que possui mais diretórios, o "-r" ira fazer a consulta entrando dentro desses diretórios e buscando em arquivo por arquivo
grep -A3 JOAO arquivo.txt > neste caso vamos buscar a palavra "JOAO" dentro do "arquivo.txt" e depois que encontrar, ira mostrar 3 (ou conforme parâmetro junto ao "-A") linhas após
grep -B3 JOAO arquivo.txt > neste caso vamos buscar a palavra "JOAO" dentro do "arquivo.txt" e depois que encontrar, ira mostrar 3 (ou conforme parâmetro junto ao "-B") linhas anteriores
find ./ -name NOME_ARQUIVO_ou_DIRETORIO > busca pelo nome do arquivo ou diretório (por conta do parâmetro -name)
find ./ -user JOAO > busca pelo nome do usuário
date > mostra o dia e hora atual do sistema (date --help mostra as opções da função)
seq > gera uma sequencia de números
seq x x x > podemos usar ate 3 parâmetros no comando. seq INICIO PULA-DE FIM
expr > para fazer cálculos .Exemplo: expr 5 + 5
date ; echo LINUX ; ls -ltr > o separador ";", faz com que os comando executem independentemente, um de cada vez
ls alunos.txt && echo Linux > o "&&", faz com que o segundo comando execute, somente se o primeiro comando executar perfeitamente
ls alunos.txt || echo Linux > o "", faz com que o que o segundo comando seja executado, somente se o primeiro der erro
cd .. ; ls -l > volta um diretório e executa o comando "ls -l"
(cd .. ; ls -l)  > volta um diretório e executa o comando "ls -l" (mas não sai do diretório atual)

====================================================================================

>> REDIRECIONAMENTO DE SAIDA <<

cat alunos.txt > alunos-temp.txt > o sinal ">" joga a saída do comando para dentro do arquivo alunos-tem.txt
date >> alunos-temp.txt > o sinal ">>" ira concatenar a informação do comando "date" no final do arquivo
ls -l alunos.txt3 2> log.out > o sinal "2>" redireciona mensagens de erro somente

====================================================================================

>> VARIAVEIS NO SHELL <<

$VARIAVEL > referencia variáveis ($ - utilizar cifrão para referenciar)
env OU set > verificar variáveis de SISTEMA/AMBIENTE

====================================================================================

>> COMANDO VI <<

vi ARQUIVO.txt > Abre arquivo
vi NOVO_ARQUIVO.txt > Cria novos arquivos

>> COMANDO VI - Explorar arquivo <<

[I ou INSERT - habilita a edição/inserção do arquivo]
[ESC - sair do modo de edição/inserção]
[: - habilita a utilização de comandos]
[:1 - vai para a primeira linha do arquivo]
[:$ - vai para a ultima linha do arquivo]
[:20 - vai para a linha 20 do arquivo ou conforme número inserido]
[:! ls /tmp - utilizando o ":!" é possível aplicar um comando, saindo do arquivo e voltando em seguida, clicando ENTER]
[/Linux - vai procurar de cima para baixo a palavra desejada]
[clicando na letra "N" ele vai buscar a próxima palavra, neste caso "Linux"]
[clicando "SHIFT+N" ele vai buscar a palavra anterior, neste caso "Linux" (Funciona também, utilizando o "N" maiúsculo)]
[?Linux - vai procurar de baixo para cima a palavra desejada]
[dd - recorta/apaga a linha atual]
[d4d - recorta/apaga as 4 (ou conforme parâmetro (d20d - paga 20 linhas)) próximas linhas, a partir da atual]
[quando a linha é recortada com o "dd", podemos colar a linha cortada em outra linha utilizando a letra "p"]
[yy - copia a linha desejada]

====================================================================================

>> COMANDO VI - Outros <<

# Inserindo Texto
i: Inserir antes do cursor
I: Inserir no início da linha
a: Acrescentar após o cursor
A: Acrescentar ao final da linha
o: Adicionar nova linha após a linha atual
O: Adicionar nova linha antes da linha atual
R: Substituir (modo sobrescrita)
r: Sobrescrever um caractere

# Outros Comandos
u: Desfazer última alteração
J: Unir linhas
nJ: Unir próximas n linhas
.: Repetir último comando
U: Desfazer todas as alterações da linha
:N: Abrir tela dividida

# Modos Especiais
v: Modo visual
ctrl + c: Sair do modo de inserção

# Comandos para Arquivos
vi <!nome_arquivo>: Editar o arquivo
vi -r <!nome_arquivo>: Editar a última versão do arquivo após falha
vi +n <!nome_arquivo>: Editar o arquivo na linha n
vi + <!nome_arquivo>: Editar o arquivo no final
vi +/str <!nome_arquivo>: Editar o arquivo na primeira ocorrência de str

# Salvando & Saindo
:w: Salvar
:x: Salvar e sair
:q: Sair, caso não haja alterações
:q!: Sair e descartar alterações

# Navegação do Cursor
h ou ←: Esquerda
k ou ↑: Cima
j ou ↓: Baixo
l ou →: Direita
w: Próxima palavra
W: Próxima palavra delimitada por espaço
b: Início da palavra anterior
B: Início da palavra delimitada anterior
e: Final da palavra
E: Final da palavra delimitada

# Posições Relativas
(: Retroceder uma sentença
): Avançar uma sentença
{: Retroceder um parágrafo
}: Avançar um parágrafo

# Linhas e Colunas
0: Início da linha
$: Final da linha
1G: Início do arquivo
G: Final do arquivo
nG: Ir para a linha n

# Posicionamento de Tela
H: Topo da tela
M: Meio da tela
L: Fundo da tela
%: Ir para o parêntese correspondente
gg: Início do documento
f<char>: Avançar até o caractere char
F<char>: Retroceder até o caractere char

# Apagando Texto
x: Apagar caractere à direita do cursor
X: Apagar caractere à esquerda do cursor
D: Apagar o restante da linha
dd ou :d: Apagar a linha atual
ndw: Apagar as próximas n palavras
ndb: Apagar as n palavras anteriores
:x,yd: Apagar das linhas x até y
ndd: Apagar n linhas começando pela linha atual

# Procurar Texto
/string: Procurar string para frente
?string: Procurar string para trás
n: Próxima ocorrência
N: Ocorrência anterior
:set ic: Ignorar maiúsculas
:set noic: Sensível a maiúsculas
:set nu: Exibir números de linhas
:g/str/cmd: Rodar cmd nas linhas com str

# Substituir Texto
:s/pad/str/flag: Substituir padrão por string
&: Repetir última substituição
-> Flags:
c: Confirmar substituições
g: Substituir todas as ocorrências

====================================================================================

>> Expressões Regulares <<

egrep "[Ll]inux" ARQUIVO.txt -> Ira buscar no conteúdo do arquivo, palavras "Linux" ou "linux"
egrep "^Linux" texto.txt -> Ira buscar no conteúdo do arquivo, todas as linhas que a primeria palavra seja "Linux"
egrep "^[Ll]inux" texto.txt -> Ira buscar no conteúdo do arquivo, todas as linhas que a primeria palavra seja "Linux" ou "linux"

====================================================================================

>>> INSTRUÇÕES CONDICIONAIS <<<

INSTRUÇÃO - IF - SINTAXES >
---------------------------

if <COMANDO-CONDIÇÃO>
then
	comando1
	comando2
	comando3
fi

---------------------------

if <COMANDO-CONDIÇÃO>
then
	comando1
else
	comando2
fi

---------------------------

if <COMANDO-CONDIÇÃO>
then
	comando1
elif <COMANDO-CONDIÇÃO>
then
	comando2
else
	comando3
fi

---------------------------

COMANDO test > Utilizado para criar uma condição.

test <EXPRESSÃO>

Testando Valores Numéricos >

OPÇÃO | DESCRIÇÃO
-eq --> IGUAL
-ne --> DIFERENTE
-gt	--> MAIOR QUE
-ge	--> MAIOR OU IGUAL QUE
-lt	--> MENOR QUE
-le	--> MENOR OU IGUAL QUE


Testando Strings >

OPÇÃO | DESCRIÇÃO
= 	--> UMA STRING IGUAL A OUTRA
!= 	--> UMA STRING DIFERENTE DA OUTRA
-n	--> STRING NÃO NULA
-z	--> STRING NULA


Testando Arquivos >

OPÇÃO | DESCRIÇÃO
-f 	--> É UM ARQUIVO
-d 	--> É UM DIRETÓRIO
-r	--> TEM PREMISSÃO DE LEITURA
-w	--> TEM PREMISSÃO DE ESCRITA
-x	--> TEM PREMISSÃO DE EXECUÇÃO
-s	--> POSSUI TAMANHO MAIOR QUE ZERO


>>> Exemplos de Utilização >

test 50 -gt 100			> 50 é maior q 100?
test "$VAR1" -eq 12		> O valor de VAR1 é igual a 12? 
test -f /tmp/test		> O arquivo teste existe?
test "$VAR1" = "$VAR2"	> A string de VAR1 é igual a string da VAR2?

Podemos utilizar desta forma também, sem o comando {test} antes da condição >

[50 -gt 100]
["$VAR1" -eq 12]
[-f /tmp/test]
["$VAR1" = "$VAR2"]


Retorna 0 se for VERDADE
Retorna 1 se for FALSO

>>> Exemplo Prático:
------------------------------------------------------

VAR1=12
## O valor de VAR1 é maior que 10?
if test "$VAR1" -gt 10  # Podemos usar também > if ["$VAR1" -gt 10]
then
	echo SUCESSO
fi

------------------------------------------------------

VAR1=12
## O valor de VAR1 NÃO é maior que 10?
if [ ! "$VAR1" -gt 10 ]  # NEGAÇÃO (!)
then
	echo SUCESSO
fi

------------------------------------------------------

VAR1=12
## O valor de VAR1 é maior que 10 e (AND) menor que 20?
if [ "$VAR1" -gt 10 -a "$VAR1" -lt 20 ]  # AND (-a)
then
	echo SUCESSO
fi

------------------------------------------------------

VAR1=12
## O valor de VAR1 é maior que 10 ou (OR) menor que 20?
if [ "$VAR1" -gt 10 -o "$VAR1" -lt 20 ]  # OR (-o)
then
	echo SUCESSO
fi



====================================================================================

INSTRUÇÃO - CASE - SINTAXES >
---------------------------

case $VALOR in
	padrão1)
		comandos
		;;
	padrão2)
		comandos
		;;
	*)
		comandos
		;;
esac

------------------------------------------------------

case $OPCAO in
	1)
		echo "Opção Incluir"
		;;
	2)
		echo "Opção Remover"
		;;
	*)
		echo "Opção Inexistente"
		;;
esac

------------------------------------------------------

# Podemos utilizar expressões regulares
case $CARACTERER in
	[0-9])
		echo "O caractere informado é um número"
		;;
	[A-Z])
		echo "O caractere informado é uma letra maiúscula"
		;;
	[a-z])
		echo "O caractere informado é uma letra minúscula"
		;;
esac

------------------------------------------------------

INSTRUÇÕES DE LOOP - FOR - SINTAXES >
-----------------------------------

for variavel in valor1 valor2 ... valorN
do
	comando1
	comando2
	...
done

------------------------------------------------------

for numero in 1 2 3 4 5
do
	echo "o número atual é $numero"
done

------------------------------------------------------

for arquivo in alunos*
do
	echo "O arquivo atual é $arquivo"
done

------------------------------------------------------

for sequencia in $(seq 5 10)  # seq --> Gera uma sequencia de valores
do
	echo "O número é $sequencia"
done

------------------------------------------------------

for sequencia in {5..10}  # Gera uma sequencia de valores
do
	echo "O número é $sequencia"
done

------------------------------------------------------

# Gerando valores de 1 até 50, pulando de 5 em 5
# Com a utilização do comando (seq), os parametros ficam desta forma:
# {INICIO, INTERVALO/PULO, FIM}
for sequencia in $(seq 1 5 50)  # seq --> Gera uma sequencia de valores
do
	echo "O número é $sequencia"
done

------------------------------------------------------

# Gerando valores de 1 até 50, pulando de 5 em 5
# Com a utilização das chaves ({}), os parametros ficam desta forma:
# {INICIO, FIM, INTERVALO/PULO}
for sequencia in  {1..50..5}  # seq --> Gera uma sequencia de valores
do
	echo "O número é $sequencia"
done

------------------------------------------------------

for i in $(cat arquivo.txt)
do
	echo "O valor atual é $i"
done

------------------------------------------------------

# A variavel 'i' vai iniciar com o valor 5, enquanto a variavel 'i' for
# menor ou igual a 20, vamos acressentar a variavel 'i' o valor de +1
for (( i=5 ; <=20 ; i++ ))
do
	echo "O número é $i"
done

------------------------------------------------------

INSTRUÇÕES DE LOOP - WHILE - SINTAXES >
-------------------------------------

while <comando-conddição>
do
	comando1
	comando2
	...
done

------------------------------------------------------

x=1
while [ $x -le 20 ]  # -le --> Menor ou Igual
do
	echo "O valor atual é $x"
	x=$(expr $x + 1)
done

------------------------------------------------------

# Verifica quantos processos estão em execução
# Enquanto isso for menor que 300, entra no loop
while [ $(ps axu | wc -l) -lt 300 ]  # -lt --> Menor que
do
	echo "Tudo OK"
	sleep 30
done

------------------------------------------------------

# Enquanto o arquivo existir o loop continua
while ls /var/look/processo.lock > /dev/null
do
	echo "Processo em Execução"
	sleep 30
done

------------------------------------------------------

INSTRUÇÕES DE LOOP - UNTIL - SINTAXES >
-------------------------------------
UNTIL --> Até que algo seja verdadeiro
-------------------------------------

until <comando-condição>
do
	comando1
	comando2
	...
done

------------------------------------------------------

x=1
until [ $x -eq 20 ]  # Até que o valor de 'x' seja IGUAL a 20
do
	echo "O valor atual é $x"
	x=$(expr $x + 1)
done

------------------------------------------------------

BREAK & CONTINUE - INSTRUÇÕES DE LOOP >
-------------------------------------

> BREAK é utilizado para sair do loop.

BREAK - SINTAXES >
----------------

while ls /var/lock/processos.lock > /dev/null
do
	if [ $(date +%H) -gt 18 ]; then
		break  # Quebra o loop
	
	fi
	echo "Processo em Execução!"
	sleep 30
done

------------------------------------------------------

> CONTINUE é utilizado para voltar ao inicio do loop.

CONTINUE - SINTAXES >
-------------------

while ls /var/lock/processo.lock > /dev/null
do
	if [ $(date +%H) -eq 18 ]; then
		sleep 3600
		continue  # Volta para o inicio do loop
	
	fi
	echo "Processo em Exeução!"
	sleep 30
done

------------------------------------------------------

--> FUNÇÕES <--

-> Evita a repetição excessiva de código
-> Reduz o tamanho final do Script
-> Facilita a Manutenção

-> Podem utilizar parâmetros
-> Podem utilizar variáveis globais ou locais
-> Devem ser definidas antes de serem chamadas
-> Podem ser utilizados códigos de retorno
----------------------------------------------

--> Functions - SINTAXES & Definição >
------------------------------------

function nome-funcao () {
	comandos
}

nome-funcao () {
	comandos
}

-> Chamando Função >
----

nome-funcao
nome-funcao par1 par2
VAR1=$(nome-funcao)

-> Function - Variáveis >
----

> Global -- Visível por todo o código (padrão)
> Local -- Visível apenas na função

local VAR1="Shell Script"

-> Functions - Return Code >
----

> Mesmo princípio do Exit Code
> Definida pela instrução "return"
> Acessada por $?

------------------------------------------------------

> DEBUG <

# Vai debugar o código, sem realizar a execução do mesmo
bash -n SCRIPT.sh

# Mostra a execução de cada comando
bash -xv SCRIPT.sh


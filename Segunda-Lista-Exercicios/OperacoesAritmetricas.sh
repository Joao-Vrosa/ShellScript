#!/bin/bash
#
# Criador: João V. Rosa
#
# Crie um script que receba do usuário 2 valores e em seguida exiba um menu 
# para ele escolha uma das 4 principais operações aritmétricas (soma, 
# subtração, multiplicação e divisão). Após isso a operação e o resultado são 
# exibidos ao usuário.
# Considere que:
#  • O script deve validar e abortar a execução caso algum dos valores não seja informado
#  • No caso de multiplicação, o script deve exibir uma mensagem de erro 
# caso um dos valores seja 0, e então abortar
#  • No caso de divisão, o script deve exibir uma mensagem de erro caso um 
# dos valores seja 0, e então abortar
#  • Também no caso de divisão, o script deve exibir se é uma divisão exata ou com resto.
#


clear  # Limpando a tela
echo '--------------- OPERAÇÕES ARITMÉTRICAS ---------------'
echo ''

# Entrada dos Valores
read -p 'Primeiro Valor: ' VALOR1
read -p 'Segundo Valor: ' VALOR2
echo ''

# Validando entrada
if [ -z "$VALOR1" ] || [ -z "$VALOR2" ]; then
# -z --> Retorna verdadeiro se a string tem comprimento zero
    echo '[ERRO] Ambos os valores devem sem informados!'
    exit 1
fi

# MENU
echo 'Escolha uma Operação:'
echo '[ 1 ] SOMA'
echo '[ 2 ] SUBTRAÇÃO'
echo '[ 3 ] MULTIPLICAÇÃO'
echo '[ 4 ] DIVISÃO'
echo '[ Q ] SAIR'
echo ''

# Entrada do Valor da Opção
read -p 'Opção: ' OPCAO
echo ''

echo '------------------------------------------------------'

case $OPCAO in
    1)
        SOMA=$(($VALOR1 + $VALOR2))
        echo 'Resultado:' $VALOR1 + $VALOR2 = $SOMA
        ;;
    2)
        SUBTRACAO=$(($VALOR1 - $VALOR2))
        echo 'Resultado:' $VALOR1 - $VALOR2 = $SUBTRACAO
        ;;
    3)
        if [ "$VALOR1" -eq 0 ] || [ "$VALOR2" -eq 0 ]; then
            echo '[ERRO] Um dos valores é igual a ZERO!'
            exit 1
        fi

        MULTIPLICACAO=$(($VALOR1 * $VALOR2))
        echo 'Resultado:' $VALOR1 x $VALOR2 = $MULTIPLICACAO
        ;;
    4)
        if [ "$VALOR1" -eq 0 ] || [ "$VALOR2" -eq 0 ]; then
            echo '[ERRO] Um dos valores é igual a ZERO!'
            exit 1
        fi

        RESTO=$(($VALOR1 % $VALOR2))
        DIVISAO=$(($VALOR1 / $VALOR2))
        echo 'Resultado:' $VALOR1 / $VALOR2 = $DIVISAO

        if [ "$RESTO" -eq 0 ]; then
            echo ''
        else
            echo 'Divisão com Resto:' $RESTO
        fi
        ;;
    Q|q)
        echo 'Saindo...'
        sleep 2
        ;;
    *)
        echo 'OPÇÃO INVALIDA!'

esac

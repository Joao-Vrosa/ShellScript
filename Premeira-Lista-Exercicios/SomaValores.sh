#!/bin/bash
#
# Autor: João V.Rosa
# Criação: 27/12/2024
#
# Descrição: Crie um Script que após executado solicite dois valores como entrada. Esses
# valores devem ser somados e o resultado exibido para o usuário.
#

# Limpar a tela
clear

# Mensagem de entrada
echo "===== Somando Valores com Shell Script ====="

echo ""

# Pegando valores de entrada do usuário
read -p "Digite um valor: " VALOR1
read -p "Digite outro valor: " VALOR2

# Calculando valores
CALCULO=$(($VALOR1 + $VALOR2))

# Pulando uma linha
echo ""

# Saída dos dados com o valor da soma
echo "Resultado:" $CALCULO

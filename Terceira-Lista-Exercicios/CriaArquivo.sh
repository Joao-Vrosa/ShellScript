#!/bin/bash
#
# --------------------------------------- 
# Autor: João V. Rosa 
# Data: 03/02/2025
#
# Descrição: Fazer um script que crie um arquivo e o preencha com um conjunto de 
# caracteres até que um determinado tamanho em bytes seja atingido.
# O usuário deverá fornecer o nome do arquivo, o conjunto de caracteres que 
# será utilizado para preenchimento do arquivo, e o tamanho final do arquivo em 
# bytes.
# Crie também uma lógica que mostre o andamento da criação desse arquivo, de
# 10 em 10%, e o tamanho atual do arquivo.
# Se o arquivo já existir, toda a informação anterior será apagada.
# ---------------------------------------
#

read -p "Informe o nome deo arquivo a ser criado: " FILE
read -p "Informe um conjunto de caracteres: " WORD
read -p "Informe o tamanho final do arquivo (em bytes): " SIZE

# Deixar o arquivo em branco
cat /dev/null > $FILE

PORC_EXIBIDA=0

until [ $SIZE -le $(stat --printf=%s "$FILE") ]; do
	echo -n $WORD >> $FILE
	SIZEATUAL=$(stat --printf=%s "$FILE")

	POR_ATUAL=$(expr $SIZEATUAL \* 100 / $SIZE)

	if [ $(expr $PORC_ATUAL % 10) -eq 0 -a $PORC_EXIBIDA -ne $PORC_ATUAL ]; then
		echo "Concluído: $PORC_ATUAL% - Tamanho do Arquivo: $SIZEATUAL"
		PORC_EXIBIDA=$PORC_ATUAL
	fi
done


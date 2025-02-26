#!/bin/bash
#
# --------------------------------------- 
# Autor: João V. Rosa 
# Data: 03/02/2025
#
# Descrição: Crie um script que receba um nome de processo como argumento e que constantemente irá verificar se o processo está em execução. 
# Caso não esteja, deve ser exibida uma mensagem na sessão do usuário a cad x segundos.
# ---------------------------------------
#

TIME=5

# Se não for passado um argumento ele vai mostrar a mensagem de erro e encerrar
if [ $# -eq 0 ]; then
	echo "Favor, informar um processo como argumento."
	echo "./MonitoraProcesso.sh <processo>"
	exit 1
fi

while true; do
	if ps axu | grep $1 | grep -v grep | grep -v $0 > /dev/null; then
		sleep $TIME
	else
		echo "ATENÇÃO! O processo $1 NÃO está em execução!"
		sleep $TIME
	fi
done


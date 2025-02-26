#!/bin/bash
#
# --------------------------------------- 
# Autor:João V. Rosa 
# Data: 03/02/2025
#
# Descrição: Crie um script que mostre todos os usuários “humanos” da máquina seguidos de seu UID, Diretório Home e Nome/Descrição.
# ---------------------------------------
#

clear

# tr -s "\t" --> Transforma todos os tabs em um só, facilitando a utilização do comando "cut"
MIN_UID=$(grep "^UID_MIN" /etc/login.defs | tr -s "\t" | cut -f2)
MAX_UID=$(grep "^UID_MAX" /etc/login.defs | tr -s "\t" | cut -f2)

# IFS --> É o separador padão do Linux
# Neste caso, estamos fazendo um backup do arquivo orignal para não gerar problemas sistemicos
OLDIFS=$IFS
IFS=$'\n'

# Criando cabeçalho saída
# -e --> Para conseguir utilizar o "\t"
echo -e "USUARIO\t\tUID\t\tDIR HOME\t\tNOME OU DESCRIÇÃO"

for i in $(cat /etc/passwd); do
	USERID=$(echo $i | cut -d ":" -f3)

	if [ $USERID -ge $MIN_UID -a $USERID -le $MAX_UID ]; then
		USER=$(echo $i | cut -d ":" -f1)
		USERDESC=$(echo $i | cut -d ":" -f5 | tr -d ',')
		USERHOME=$(echo $i | cut -d ":" -f6)
		echo -e "$USER\t\t$USERID\t\t$USERHOME\t\t$USERDESC"
	fi
	
done

IFS=$OLDIFS


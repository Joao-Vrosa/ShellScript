#!/bin/bash
#
# Autor: João V. Rosa
# Criação: 02/01/2025
#
# Descrição: Crie um script que receba um nome de usuário como parâmetro e exiba as seguintes informações:
#  • UID do usuário
#  • Nome Completo / Descrição do Usuário
#  • Total em Uso no /home do usuário
#  • Informações do último login do usuário
#  • [Opcional] Validar se o usuário existe ou não sem o uso do if, que ainda não foi estudado. Se não existir retorne o exit code 1, se existir retorne exit 0 
#

#ls /home/$1 > /dev/null 2>&1 || echo "Usuário Inexistente!"
#ls /home/$1 > /dev/null 2>&1

ls /home/$1 > /dev/null 2>&1 || { echo "Usuario Inexistente!" ; exit 1; }

USERID=$(grep $1 /etc/passwd|cut -d":" -f3)
DESC=$(grep $1 /etc/passwd| cut -d":" -f5 | tr -d ,)
USOHOME=$(du -sh /home/$1| cut -f1)

clear

echo
echo "Relatório do Usuario: $1"
echo
echo "UID: $USERID"
echo "Nome ou Descriçao: $DESC"
echo
echo "Total Usado no /home/$1: $USOHOME"
echo
echo "Ultimo Login:"
lastlog -u $1
echo
exit 0

echo "Usuario Inexistente"
exit 1

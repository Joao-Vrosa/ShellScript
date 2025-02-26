#!/bin/bash
#
# Criador: João V. Rosa
#
# Descrição:
#
# Crie um script que baseado no horário atual escreva 
# “Bom Dia”, “Boa Tarde” ou “Boa Noite”.
# Considere que o começo do dia às 06:00.
# O mesmo script deve mostrar também
# a hora atual no formato de 0 a 12, indicando AM ou PM.
#

# Limpando a tela
clear

HORA_ATUAL=$(date +%H)
MINUTO_ATUAL=$(date +%M)

# Vericando o periodo
if [ "$HORA_ATUAL" -gt 5 -a "$HORA_ATUAL" -lt 13 ]; then
        PERIODO="Bom dia!"
	AMPM="AM"

elif [ "$HORA_ATUAL" -ge 13 -a "$HORA_ATUAL" -lt 19 ]; then
        PERIODO="Boa tarde!"
	AMPM="PM"

else
        PERIODO="Boa noite!"
	AMPM="PM"
fi


# Ajustando a hora
case $HORA_ATUAL in
	13)
		HORA_ATUAL=01
		;;
	14)
		HORA_ATUAL=02
		;;
	15)
		HORA_ATUAL=03
		;;
	16)
		HORA_ATUAL=04
		;;
	17)
		HORA_ATUAL=05
		;;
	18)
		HORA_ATUAL=06
		;;
	19)
		HORA_ATUAL=07
		;;
	20)
		HORA_ATUAL=08
		;;
	21)
		HORA_ATUAL=09
		;;
	22)
		HORA_ATUAL=10
		;;
	23)
		HORA_ATUAL=11
		;;
esac


echo "$PERIODO"
echo ""
echo "HORA ATUAL: $HORA_ATUAL:$MINUTO_ATUAL $AMPM"


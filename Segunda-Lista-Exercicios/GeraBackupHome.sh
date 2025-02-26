#!/bin/bash
#
# Criador: João V. Rosa
#
# Crie um script que gere um arquivo compactado de backup de todo o diretório 
# home do usuário atual (/home/<usuario>).
#  Considere que:
#  • O arquivo de backup será criado no diretório /home/<usuario>/Backup
#  • O nome do arquivo de backup deve seguir o padrão backup_home_AAAAMMDDHHMM.tgz, exemplo 
# backup_home_201708241533.tgz
#  • Caso o diretório /home/<usuario>/Backup não exista, o script deve criá-lo
#  • Antes de criar o backup, o script deve consultar se existe algum arquivo 
# de backup criado na última semana. Se exisitir, o usuário deve ser 
# consultado se deseja continuar. Se o usuário optar por não continuar, o 
# script deve abortar com código de saída 1.
#  • Após gerar o backup, o script deve informar o nome do arquivo gerado.
#

DIRDEST=$HOME/Backup

# Verificando se o diretório existe
# Se NÃO existir o DIRETÓRIO ele entra na condição
if [ ! -d $DIRDEST ]; then  # (!) -> NEGAÇÃO | (-d) -> VERIFICA SE É UM DIRETÓRIO
    echo "Criando Diretório $DIRDEST"
    mkdir -p $DIRDEST
fi

# Verificando se tem arquivos criados a menos de sete dias no diretório destino (DIRDEST)
# (-ctime) -> Arquivo criados dos ultimo 7 dias para frente
# (-name) -> Nome do arquivo (passar o nome do arquivo em seguida)
DAYS7=$(find $DIRDEST -ctime -7 -name beckuo_home\*ZIP)  # Repara que protegemos o * com a \


# Testando se a variável é nula
if [ "$DAYS7" ]; then
    echo "Já foi gerado um backup do diretório $HOME nos últimos 7 dias!"
    echo -n "Deseja continuar? (N/s): "
    read -n1 CONT  # (-n1) -> Vai capturar somente uma tecla que for digitada
    echo ''

    if [ "$CONT" = N -o "$CONT" = n -o "$CONT" = "" ]; then
        echo "Beckup Abortado!"
        exit 1
    elif [ $CONT = S -o $CONT = s ]; then
        echo "Será criado mais um backup para a mesma semana!"
    else
        echo "Opção Invalida!"
        exit 2
    fi
fi

echo "Criando backup..."
ARQ="backup_home_$(date +%Y%m%d%H%M).ZIP"  # Nome do arquivo que vai ser gerado

tar zcvpf $DIRDST/$ARQ --exclude=$DIRDEST" "$HOME"/* > /dev/null

echo
echo "O backup de nome \""$ARQ"\" foi criado em $DIRDEST"
echo
echo "Backup Concluído!"

#!/bin/bash
#
# --------------------------------------- 
# Autor: João V. Rosa
# Data: 03/02/2025
#
# Descrição:
# Fazer um script que inspecione os
# diretórios /home/ de todos os usuários em 
# busca de arquivos com as extensões .mp3, .mp4 e .jpg.
# O script deve gerar como saída final um
# relatório com a quantidade de cada tipo de arquivo para cada usuário
# ---------------------------------------
#

clear

echo "----- BUSCANDO ARQUIVOS -----"
sleep 3


for usuario in /home/*; do
    # basename --> Retorna o ultimo componente do caminho
    echo "Usuário: $(basename $usuario)"
    # Ira retornar a quantidade de arquivos com a extenção especificada
    echo "Arquivos JPG: $(find $usuario -name '*.jpg' | wc -l)"
    echo "Arquivos MP3: $(find $usuario -name '*.mp3' | wc -l)"
    echo "Arquivos MP4: $(find $usuario -name '*.mp4' | wc -l)"
    echo
done

#!/bin/bash
#
# Autor: João V. Rosa
# Criação: 27/12/2024
#
# Descrição: Crie um script que gere um relatório de algumas informações da máquina atual:
#
# • Nome da Máquina
# • Data e Hora Atual
# • Desde quando a máquina está ativa
# • Versão do Kernel
# • Quantidade de CPUs/Cores
# • Modelo da CPU
# • Total de Memória RAM Disponível
# • Partições 
#

clear # Limpando a tela

# Mensagem de entrada
echo "===== Relatório da Máquina - Shell Script ====="

echo ""

echo "Nome da Máquina: " $(uname)
echo "Data e Hora Atual: " $(date +%d/%m/%Y) - $(date +%H:%M)
echo "Desde quando a máquina está ativa: " # $(uptime -s) > Não funciona no Wind
echo "Versão do Kernel: " $(uname -r)
# -f (field) que informa a posição do campo e -d (delimite) que especifica o carácter delimitador.
echo "Quantidade de CPUs/Cores: " $(grep "cpu cores" /proc/cpuinfo | cut -d ":" -f 2 | uniq)
echo "Modelo da CPU:"$(grep "model name" /proc/cpuinfo | cut -d ":" -f 2 | uniq)
echo "Total de Memória RAM Disponível: " $(expr $(grep "MemTotal" /proc/meminfo | cut -d ":" -f 2 | tr -d ' ' | tr -d kB | uniq) / 1024) # Em MB
echo "Partições: "
echo $(df -h)

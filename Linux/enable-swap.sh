#!/bin/bash
# Desenvolvido por: Matheus Bastos
# 2025 - Licença MIT

# Script para habilitar swap em um arquivo no Linux.

swapsize="8GB"

if [ "$EUID" -ne 0 ]; then
    echo "Por favor, execute como root."
    exit
fi

if [ ! -d "/swap" ]; then
    echo "Criando diretório /swap..."
    mkdir /swap
fi

function createSwapfile() {
    # Cria um arquivo swap.
    fallocate -l $swapsize /swap/swapspace

    # Seta a permissão do arquivo.
    chmod 600 /swap/swapspace

    # Marca o arquivo como swap.
    sudo mkswap /swap/swapspace
}

function enableSwap() {

    # Cria swap se não existe
    if [ ! -f /swap/swapspace ]; then
        screateSwapfile
    fi

    swapon /swap/swapspace

}

echo "Este script irá habilitar o swap em um arquivo de ${swapsize}. (altere a variável swapsize para mudar o tamanho)"
echo "Deseja continuar? (y/n)"

choice="n"
read choice
if [ "$choice" == "y" ]; then
    enableSwap
fi
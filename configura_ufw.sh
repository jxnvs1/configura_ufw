#!/usr/bin/env bash

# Verifica se o UFW está instalado
if ! command -v ufw &> /dev/null
then
    echo "UFW não está instalado. Instalando..."
    sudo apt update
    sudo apt install ufw -y
fi

# Configura o UFW para bloquear todas as entradas e permitir todas as saídas
sudo ufw default deny incoming
sudo ufw default allow outgoing

# Permite as portas necessárias para o KDE Connect
sudo ufw allow 1714:1764/udp
sudo ufw allow 1714:1764/tcp

# Ativa o UFW
sudo ufw enable

# Recarrega as regras do UFW
sudo ufw reload

# Mostra o status do UFW
sudo ufw status verbose

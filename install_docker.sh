#!/bin/bash

# Atualizar e atualizar o Kali Linux
echo "Atualizando o sistema..."
sudo apt update && sudo apt upgrade -y

# Remover qualquer entrada anterior do reposit  rio do Docker
echo "Removendo reposit  rios antigos do Docker..."
sudo rm -f /etc/apt/sources.list.d/docker*.list

# Adicionar o reposit  rio do Docker
echo "Adicionando reposit  rio do Docker..."
echo "deb [arch=amd64] https://download.docker.com/linux/debian bullseye stable" | sudo tee /etc/apt/sources.list.d/docker.list

# Adicionar a chave GPG do Docker
echo "Adicionando chave GPG do Docker..."
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker.gpg

# Atualizar a lista de pacotes
echo "Atualizando a lista de pacotes novamente..."
sudo apt update

# Instalar Docker
echo "Instalando o Docker..."
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Verificar a instala    o do Docker
echo "Verificando a instala    o do Docker..."
sudo systemctl status docker

# Habilitar o Docker para iniciar automaticamente
echo "Habilitando o Docker..."
sudo systemctl enable docker --now

# Adicionar o usu  rio atual ao grupo Docker
echo "Adicionando o usu  rio ao grupo Docker..."
sudo usermod -aG docker $USER

echo "Instala    o do Docker conclu  da! Reinicie o terminal ou fa  a logout e login para aplicar as mudan  as do grupo."

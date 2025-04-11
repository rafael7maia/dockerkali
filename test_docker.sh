#!/bin/bash

# Fun    o para verificar se um comando existe
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Verificar se o Docker est   instalado
if command_exists docker; then
    echo "Docker est   instalado."
else
    echo "Docker n  o est   instalado. Por favor, instale o Docker primeiro."
    exit 1
fi

# Verificar se o servi  o Docker est   em execu    o
if systemctl is-active --quiet docker; then
    echo "O servi  o Docker est   em execu    o."
else
    echo "O servi  o Docker n  o est   em execu    o. Iniciando o servi  o..."
    sudo systemctl start docker
fi

# Executar um cont  iner de teste
echo "Executando um cont  iner de teste..."
if docker run --rm hello-world; then
    echo "O Docker est   funcionando corretamente!"
else
    echo "Houve um problema ao executar o cont  iner de teste."
fi

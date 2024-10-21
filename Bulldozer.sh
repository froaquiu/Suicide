#!/bin/bash

# Limpa o terminal
clear

# Verifica se o lolcat está instalado
if ! command -v lolcat &> /dev/null; then
    echo "Por favor, instale o lolcat para executar este script."
    exit 1
fi

# Título "BULLDOZER" com lolcat
echo "  
  ____  _          __          _               _           
 |  _ \| |        / _|        | |             | |          
 | |_) | |       | |   _ __   | |__     __ _  | |__        
 |  _ <| |       | |  | '_ \  | '_ \   / _` | | '_ \       
 | |_) | |____   | |__| | | | | | | | | (_| | | | | |      
 |____/|______|  \____|_| |_| |_| |_|  \__,_| |_| |_|      
" | lolcat

# Mensagem adicional
echo "Script executado com sucesso!" | lolcat

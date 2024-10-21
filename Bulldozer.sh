#!/bin/bash

# Limpa o terminal
clear

# Verifica se o lolcat está instalado
if ! command -v lolcat &> /dev/null; then
    echo "Por favor, instale o lolcat para executar este script."
    exit 1
fi

if ! command -v figlet &> /dev/null; then
    echo "Por favor, instale o figlet para executar este script."
    exit 1
fi

function second_page {
    clear
    echo "Made by Assing" | lolcat
    echo "O terror do 712" | lolcat
    echo "Pressione qualquer tecla para voltar..."
    read -n 1 -s
}

function check_vulnerabilities {
    clear
    read -p "Digite o URL do site (ex: example.com): " url
    echo "Buscando vulnerabilidades em $url..."
    
    # Exemplo de comando com nmap (verifique se o nmap está instalado)
    nmap -Pn --script=vuln "$url"

    echo "Busca concluída. Pressione qualquer tecla para voltar..."
    read -n 1 -s
}

function check_sql_vulnerabilities {
    clear
    read -p "Digite a URL do site (ex: http://example.com/page.php?id=1): " url
    echo "Buscando vulnerabilidades SQL em $url..."
    
    # Comando com sqlmap
    sqlmap -u "$url" --batch --level=5 --risk=3

    echo "Busca concluída. Pressione qualquer tecla para voltar..."
    read -n 1 -s
}

function display_art {

echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠠⠾⠿⠯⢭⡉⠉⠙⠲⢄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡿⠀⢣⠀⡌⢇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠔⠋⢉⣳⣦⣄⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠞⠁⣠⠊⢀⡇⡾⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⡏⠀⢰⠋⠀⠀⠉⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢀⡔⢡⠆⡴⠁⠀⢸⢠⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡿⠀⠀⡜⡄⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⡞⢠⠃⢰⡇⠀⠀⠀⢏⢷⣤⣀⣀⣠⣤⣄⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⢀⠀⢡⢹⡄⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⡇⠘⠀⣼⡇⠀⠀⠀⠈⢾⡇⠙⣄⠀⠀⠀⠀⠈⠉⠒⠦⣶⡒⠶⠶⠶⣄⣀⣼⠇⡌⠀⠘⡆⢿⡄⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢧⠀⡄⠸⣿⣆⠀⠀⠀⣼⠇⠀⣨⡃⠀⣀⣀⡀⠀⠀⠀⠀⠈⠓⠀⠀⠙⣿⠧⡾⠀⣴⢀⡇⢸⡇⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠘⣆⠘⣆⠈⠻⣷⣤⣠⠟⠀⢀⣿⣿⠟⠁⠀⠱⡄⠀⡀⠀⠈⢳⣦⠀⠀⠘⢦⡘⣾⣿⣿⠇⢫⠇⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣦⣼⣿⣶⠿⢟⣥⣤⣶⣾⡟⢁⣀⡀⠀⠀⢳⣄⣸⠳⡄⠀⠀⢣⠀⠀⢸⠏⠻⣿⡏⣠⠋⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⣶⣤⣤⡤⠖⠋⠉⢉⣉⡉⠉⠉⠙⡿⠚⠟⢸⣭⣿⣽⣦⡀⠈⠁⢳⠀⢸⢀⣦⣎⣴⡁⢀⣠⣶⣾⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠈⠹⣿⡛⠿⣍⣉⠉⠉⠙⢦⣀⡎⠀⠀⠀⠈⠟⢻⣿⣿⣹⣦⣀⣠⡤⠖⠛⠛⠳⠄⡙⠻⢗⣻⠍⢑⡆⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠈⠙⢶⣤⣈⠉⠉⠁⠋⣿⣇⠀⠀⠀⠀⠀⠀⠉⠸⠛⣉⠍⠉⢳⠀⢀⣀⡀⠀⠀⠀⠀⢌⠳⢾⣇⣀⡀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⣠⣿⣿⣿⣷⣶⠿⠋⢻⠷⣤⣀⠀⠀⠀⠀⠈⢉⡀⠀⠀⢸⣿⣵⠶⠾⣭⣙⠦⠀⠠⣧⠀⠉⠀⡽⠛⢳⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢀⣴⢋⣿⡟⣿⢹⣿⠀⠀⠈⢣⡀⠙⣿⢷⣄⠀⣠⠔⠛⠑⠢⣽⠋⢠⠀⠀⠀⠈⠓⠦⣀⣸⣷⠤⠊⠀⠀⣼⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢀⣾⠃⠀⠹⠁⣿⠸⣿⠄⠀⠀⠀⠁⠀⠈⡃⢻⡞⣡⣶⣟⢢⡀⠸⡎⢺⣷⣄⡀⠀⠀⠀⠀⠈⠁⠀⠀⣄⣴⡏⠀⠀⠀⠀
⠀⠀⠀⠀⢀⣿⠃⠀⠀⠀⠀⣿⡀⠘⡄⠀⠀⠀⠀⠀⠀⢱⡞⢀⣿⡏⠈⠋⢿⢦⡈⠂⠙⣻⡿⢷⣄⠀⠀⠀⠀⡎⢀⡟⣿⠀⠀⠀⠀⠀
⠀⠀⠀⠀⣾⡏⠀⠀⠀⠀⠀⠹⣷⣄⠀⠀⠀⢢⡀⠀⠀⠀⡇⢸⣿⢿⣴⠀⡀⠀⠿⠢⢤⡿⠃⣿⣍⣀⣀⣤⠾⠷⢻⣷⢸⡆⠀⠀⠀⠀
⠀⠀⠀⢸⡿⠀⠀⠀⠀⠀⠀⠀⠘⢿⣷⣶⣤⣤⣉⡓⠒⢴⣇⠸⣿⡀⠉⠙⠧⣴⣀⣀⠀⢿⠀⢿⣖⠛⠛⠋⢙⣾⠏⡼⢸⠃⠀⠀⠀⠀
⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿⠛⠋⠛⠿⣾⣿⡄⠛⠷⣾⡥⠄⠒⠚⡛⠓⠚⢦⡈⠛⠷⠲⠿⠛⠁⠚⡠⠋⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⢦⡀⠀⠀⠈⢻⣿⣴⣾⣟⡛⠒⣒⠉⣀⣤⡶⣶⣿⠿⠷⣶⣶⠦⠴⠊⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠢⡀⠀⠀⠙⣿⣿⣽⣷⡀⠅⠉⠉⠀⠀⠀⠹⡄⠀⠈⢳⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠤⠤⠶⣺⣿⣿⣿⣇⠀⠀⠀⠀⠀⢀⣠⠃⢀⡠⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣤⣐⣶⣾⣿⠿⠟⠛⠉⠈⠑⠒⠶⠶⠾⠛⠛⠊⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀" | lolcat

# Título "BULLDOZER" com lolcat
figlet "712 - BULLDOZER" | lolcat
}

display_art

echo "===============================================" | lolcat


# Mensagem adicional
echo -e "добро пожаловать в ад!" | lolcat

echo -e "Выберите роль:" | lolcat

    echo "1. перезагрузить" | lolcat
    echo "2. узнать больше"
    echo "3. искать уязвимости " | lolcat
    echo "4. уязвимости SQL" | lolcat
    echo "5. выйти" | lolcat

    read -p "введите свой вариант  (1/2/3/4): " option

     case $option in
        1)
            display_art  # Reinicia a exibição da arte
            ;;
        2)
            echo "abrindo" | lolcat
            second_page
            ;;
        3)
            check_vulnerabilities  # Busca vulnerabilidades
            display_art  # Volta à exibição da arte após a busca
            ;;
        4)
            echo "Fechando o script..."
            exit 0  # Fecha o script
            ;;
        5)
            echo "Fechando o script..."
            exit 0  # Fecha o script
            ;;
        *)
            echo "Opção inválida."
            ;;
    esac
done


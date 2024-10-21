#!/bin/bash

# Limpa o terminal
clear

# Verifica se o lolcat está instalado
if ! command -v lolcat &> /dev/null; then
    echo "Por favor, instale o lolcat para executar este script."
    exit 1
fi

# Título "BULLDOZER" com lolcat
echo ">=>>=>    >=>     >=> >=>       >=>       >====>         >===>      >=======>>=> >=======> >======>     
>>   >=>  >=>     >=> >=>       >=>       >=>   >=>    >=>    >=>          >=>   >=>       >=>    >=>   
>>    >=> >=>     >=> >=>       >=>       >=>    >=> >=>        >=>       >=>    >=>       >=>    >=>   
>==>>=>   >=>     >=> >=>       >=>       >=>    >=> >=>        >=>     >=>      >=====>   >> >==>      
>>    >=> >=>     >=> >=>       >=>       >=>    >=> >=>        >=>    >=>       >=>       >=>  >=>     
>>     >> >=>     >=> >=>       >=>       >=>   >=>    >=>     >=>   >=>         >=>       >=>    >=>   
>===>>=>    >====>    >=======> >=======> >====>         >===>      >==========> >=======> >=>      >=> 
                                                                                                        
" | lolcat

# Mensagem adicional
echo "Script executado com sucesso!" | lolcat

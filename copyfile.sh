#!/bin/bash
#
#
######################################################################
#    FUNÇÃO SCRIPT.: REPLICA ESTRURA DE DETERMINADO DIRETÓRIO        #
#                    ESPECIFICANDO EXTENSÃO                          #
#------------------------------------------------------------------- #
#       DEPENDÊNCIAS.:.. 			                     #
#       						             #
#       					                     #
#                                                                    #
#       DESENVOLVIMENTO.: DIEGO BARCELOS NICACIO                     #
#       EMAIL.: BARCELOS3@HOTMAIL.COM                                #
#       DATA CRIACAO.: 20/02/2015                                    #
#       VERSAO.: 2.0_200316					     #
#		                                                     #
#	EDITADO EM 27/08/2015 POR JEFFERSON PIRES (jeffersfp)	     #
######################################################################

####--> TELA PRINCIPAL RECEBE VALORES DE VARIAVEIS PELO USUARIO
principal(){

echo -e " \033[1;36m  #####   #######  ######   #     #  #######  ###  #        ####### \033[0m";
echo -e " \033[1;36m #     #  #     #  #     #   #   #   #         #   #        #       \033[0m ";
echo -e "\033[1;36m  #        #     #  #     #    # #    #         #   #        #        \033[0m";
echo -e "\033[1;36m  #        #     #  ######      #     #####     #   #        #####    \033[0m";
echo -e "\033[1;36m  #        #     #  #           #     #         #   #        #        \033[0m";
echo -e "\033[1;36m  #     #  #     #  #           #     #         #   #        #        \033[0m";
echo -e " \033[1;36m  #####   #######  #           #     #        ###  #######  ####### \033[0m";

echo -e " \033[1;33m Digite o caminho de origem.: \033[0m  "
read dir_origem

clear

echo -e " \033[1;34m Digite o caminho de destino.: \033[0m "
read dir_destino

clear

echo -e " \033[1;35m Digite o tipo de extensão (sem o pronto).:  \033[0m  "
read extensao

clear

####--> Exibi informações digitadas pelo usuário
echo -e " \033[1;33m Digite o caminho de origem.: $dir_origem \033[0m "
echo -e " \033[1;34m Digite o caminho de destino.: $dir_destino \033[0m "
echo -e " \033[1;35m Tipo de extensão.:$extensao  \033[0m "

}

execution(){

        clear
        echo -e " \033[41;1;37m AGUARDE... \033[0m" 
        sleep 2
	echo "FORAM COPIADOS $qtd ARQUIVOS $extensao"
       	rm /tmp/qtdCopy.txt
        find $dir_origem -name  "*.$extensao" | cpio -pdm $dir_destino > /dev/null 2>&1
}

############################################################################

####--> CONDICAO VERIFICA VALORES DAS VARIAVEIS
while [ "$resposta" != "y" ] ; do 
	clear
        principal
	if [ ! -d "$dir_origem" ] ;
	then
        	clear
        	echo -e " \033[41;1;37m Diretorio de origem não existe =(   \033[0m"
        sleep 2
	else	
		echo "As informações à cima estão corretas? y/n"
		read resposta 
	fi
done

####--> CONDICAO VERIFICA SE DIRETORIO DESTINO EXISTE E CRIAO SE NECESSARIO
if [ ! -d "$dir_destino" ] ;
        then
	mkdir -p $dir_destino
fi

####--> VERIFICA SE EXISTE ARQUIVO E EXECUTA A MÁGICA (Até que fim he he )
find $dir_origem -name "*.$extensao" > /tmp/qtdCopy.txt
qtd=`(cat /tmp/qtdCopy.txt | wc -l)`

if [ "$qtd" = 0  ] ;
       then
       clear
       echo -e " \033[41;1;37m Desculpe, não encontramos nenhum arquivo $extensao no $dir_origem \033[0m"
       rm -rf /tmp/qtdCopy.txt
       exit
fi

execution

echo -e " \033[41;1;37m PROCESSO REALIZADOO COM SUCESSO!    \033[0m"







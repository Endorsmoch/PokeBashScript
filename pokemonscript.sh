#!/usr/bn/bash
#Autor: Rodrigo Urtecho Quintal LIS 8 Semestre
# pokemonBashScript.sh

if [[ ! -n $1 ]]
then 
	echo "¡No se ha proporcionado el nombre de un Pokémon!"
else
	pokemonName=$1
	json=$(curl https://pokeapi.co/api/v2/pokemon/$pokemonName)

	if ["${jsont}"]
        then  	
		clear
	       	echo "¡Ingrese un nombre correcto!"	
	else
		clear
	 	id=$(jq -r '.id' <<< "${json}")
                name=$(jq -r '.name' <<< "${json}")
                weight=$(jq -r '.weight' <<< "${json}")
                height=$(jq -r '.height' <<< "${json}")                                                                                 order=$(jq -r '.order' <<< "${json}")   
	       	echo "Id: ${id}, Name: ${name}, Weight: ${weight}, Height: ${height}, Order: ${order}"
	fi
fi

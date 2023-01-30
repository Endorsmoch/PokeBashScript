#!/usr/bn/bash
#Autor: Rodrigo Urtecho Quintal LIS 8 Semestre
# pokemonBashScript.sh

if [[ ! -n $1 ]]
then 
	echo "¡No se ha proporcionado el nombre de un Pokémon!"
else
	pokemonName=$1
	json=$(curl https://pokeapi.co/api/v2/pokemon/$pokemonName)
	
	while [ -n "${json+unset}" ]; 
	do
		echo "Proporcione un nombre correcto de Pokémon:"
		read newName
		json=$(curl https://pokeapi.co/api/v2/pokemon/$newName)

	done

fi

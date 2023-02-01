#!/usr/bn/bash
#Autor: Rodrigo Urtecho Quintal LIS 8 Semestre

if [[ ! -n $1 ]]
then 
	echo "No se ha proporcionado el nombre de un Pokémon"
else
	pokemonName=$1
	response=$(curl --write-out '%{http_code}' --silent --output /dev/null https://pokeapi.co/api/v2/pokemon/$pokemonName)

	while [ "$response" -ne 200 ];
	do
		echo "Ese pokemon no existe. Ingrese un nuevo nombre:"
		read pokemonName
		response=$(curl --write-out '%{http_code}' --silent --output /dev/null https://pokeapi.co/api/v2/pokemon/$pokemonName)
	done
	json=$(curl https://pokeapi.co/api/v2/pokemon/$pokemonName)
	id=$(jq -r '.id' <<< "${json}")
	name=$(jq -r '.name' <<< "${json}")
	weight=$(jq -r '.weight' <<< "${json}")
	height=$(jq -r '.height' <<< "${json}")
	order=$(jq -r '.order' <<< "${json}")

	echo "Id: ${id}, Name: ${name}, Weight: ${weight}, Height: ${height}, Order: ${order}"
fi
# Química IA

## Versiones

| Versión | Nombre | Curso     |
| ------- | ------ | --------- |
| V1      | mk_1   | 2020-2021 |
| V2      | mk_2   | 2021-2022 |


## Ficheros adicionales

1. elementos.json
	- Fichero JSON con la información relevante de todos los elementos de la tabla periódica seleccionados.
	- Este fichero almacena para cada elemento:
		1. Nombre
		2. Abreviatura 
		3. Prefijo
		4. Tipo

2. generador_base.py
	- Programa en Python 3 el cual genera una base de datos Prolog a partir de los datos del fichero 'elementos.json'.
	- Esta base de datos incluye los hechos:
		1. **elemento**: almacena el símbolo del elemento
		2. **elemento_tipo**: almacena el símbolo y el tipo del elemento
		3. **elemento_prefijo**: almacena el símbolo y el prefijo del elemento
		4. **elemento_nombre**: almacena el símbolo y el nombre del elemento
	- El fichero resultante de la operación será 'elementos.pl'
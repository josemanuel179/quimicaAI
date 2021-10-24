# Química IA

## Versiones

| Versión | Directorio                                                                | Curso     |
| ------- | ------------------------------------------------------------------------- | --------- |
| V1      | [mk_1](https://github.com/josemanuel179/quimicaAI/tree/master/mk_1)       | 2020-2021 |
| V2      | [mk_2](https://github.com/josemanuel179/quimicaAI/tree/master/mk_2)       | 2021-2022 |


## Ficheros adicionales

1. elementos.json
	- Fichero JSON con la información relevante de los elementos seleccionados de la tabla periódica.
	- Este fichero almacena para cada elemento:
		1. Nombre del elemento.
		2. Abreviatura del elemento.
		3. Prefijo del elemento, si tiene.
		4. Tipo del elemento. Tres posibles tipos:
            - Metal.
            - No metal.
            - Gas noble.

2. generador_base.py
	- Programa en Python 3 que genera una base de datos Prolog a partir de los datos del fichero 'elementos.json'.
	- Esta base de datos incluye los hechos:
		1. **__elemento__**: almacena el símbolo del elemento.
		2. **__elemento_tipo__**: almacena el símbolo y el tipo del elemento.
		3. **__elemento_prefijo__**: almacena el símbolo y el prefijo del elemento.
		4. **__elemento_nombre__**: almacena el símbolo y el nombre del elemento.
	- El fichero resultante de la operación será 'elementos.pl'.

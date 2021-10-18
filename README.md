# Química IA

## PROBLEMA A SOLUCIONAR
El problema propuesto para su resolución es la **formulación de compuestos químicos** mediante el uso del lenguaje de programación **Prolog**.

## FUNCIONAMIENTO
Existen dos formas de ejecutar el programa:

1. Mediante una terminal, ejecutando Prolog con la base de conocimientos **formulacion.pl**.
    - Una vez iniciado, para realizar una consulta de un compuesto, se usará la regla **compuesto_quimico(Elemento, X).**.
    - Ejemplo: para consultar el nombre del compuesto **CO2**, la regla será:

```
compuesto_quimico(co2, X).
```

## REGLAS
La regla **string_elemento** es la encargada de convertir los caracteres numéricos en enteros.

La regla **invertir_elemento** es la encargada de invertir el orden de los elementos sin alterar el orden de los elementos, reordenandolos de forma ques sus caracteres no sean alterados.

La regla **tipo_correcto** se encarga de comprobar que el compuesto que hemos introducido es un compuesto binario. Para ello:
- Comprueba el último elemento del compuesto.
    - Si es elemento es **Oxígeno** o **Hidrógeno**, pasa la regla
    - Si es elemento es un **no metal**, pasa la regla si el otro elemento es un **metal**.

La regla **nombre_prefijo** es la encargada de asignar al segundo elemento del compuesto su corresponiente nombre de la tabla periodica y su valencia. Para ello se hace uso de una base de conocimiento adicional **elementos.pl** en la cual se reflejan los principales elementos químicos junto con su abreviación.

La regla **nombre_elmento** es la encargada de asignar al primer del compuesto elemento su correspondiente nombre de la tabla periódica y su valencia. Para ello se vuelve ha hacer uso de una base de conocimiento adicional **elementos.pl**.

La regla **formular** es la encargada de unir todos los elementos del compuesto en correcto orden dando como resultado un único string.

Por último, la regla **compuesto_quimico** hace uso de todas las reglas anteriores para dar salida a la formulación exacta del compuesto químico.

## FACTS
Aqui se añade las posibilidades de tipos de prefijos que existen, siendo estos: "di", "tri" y "tetra" siendo dos, tres y cuatro respectivamente.

## DIAGRAMA DE FLUJO
![](diagramaDeFlujo.png)

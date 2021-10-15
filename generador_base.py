import json

with open('elementos.json') as json_file:
    data= json.load(json_file)

f1 = open('elementos.pl', 'w+')

elementos = data["elementos"]

def generar_nomenclatura(elementos):
    nomenclatura = []
    
    for element in elementos:
        nomenclatura.append(element["elemento"])

    nomenclatura.sort()

    for element in nomenclatura:
        f1.write('elemento(')
        f1.write(element)
        f1.write(').\n')
    
    f1.write('\n\n')

def generar_tipos(elementos):
    tipos = []
    
    for element in elementos:
        tipos.append((element["elemento"], element["tipo"]))
    
    tipos.sort()
    
    for element in tipos:
        f1.write('elemento_tipo(')
        f1.write(element[0])
        f1.write(', ')
        f1.write(element[1])
        f1.write(').\n')

    f1.write('\n\n')

def generar_prefijos(elementos):
    prefijos = []
    
    for element in elementos:
        if element["prefijo"] == '':
            pass
        else:
            prefijos.append((element["elemento"], element["prefijo"]))
    
    prefijos.sort()
    
    for element in prefijos:
        f1.write('elemento_prefijo(')
        f1.write(element[0])
        f1.write(', ')
        f1.write(element[1])
        f1.write(').\n')

    f1.write('\n\n')

def generar_nombres(elementos):
    nombres  = []
    
    for element in elementos:
        nombres.append((element["elemento"], element["nombre"]))
    
    nombres.sort()
    
    for element in nombres:
        f1.write('elemento_nombre(')
        f1.write(element[0])
        f1.write(', ')
        f1.write(element[1])
        f1.write(').\n')

    f1.write('\n\n')

generar_nomenclatura(elementos)
generar_tipos(elementos)
generar_prefijos(elementos)
generar_nombres(elementos)

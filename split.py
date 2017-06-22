"""
Este programa convierte una cadena a array identificando el separador y sin usar split.
"""

cadena = "10,2,3"
cadena2 = "1;23;30"
cadena3 = "1 2 3"


def str_to_arr(st):
    sep = ""
    if ";" in st:
        sep = ";"
        clase = "clase a"
    if "," in st:
        sep = ","
        clase = "clase b"
    if " " in st:
        sep = " "
        clase = "clase c"

    array = []
    for i in st:
        if sep in st and len(st) > 0:
            fin = st.find(sep)
            array.append(st[:fin])
            st = st[fin + 1:]
        elif len(st) > 0:
            array.append(st)
            st = []
    return array, clase


def convertir(a, b, c):
    print(str_to_arr(a))
    print(str_to_arr(b))
    print(str_to_arr(c))

convertir(cadena, cadena2, cadena3)

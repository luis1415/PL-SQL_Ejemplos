"""
Este programa encuentra la mayor cantidad de unos en la suma de un numero.
"""
numero = 10


def dec_to_bina(n):
    binario = ""
    while n != 0:
        binario = str(n % 2) + binario
        n = n // 2
    return binario


def cuenta_unos(st):
    return st.count("1")


def maximo(num):
    maxcandy = 0
    maxcandy_n1 = 0
    maxcandy_n2 = 0
    for i in range(1, num+1):
        n1 = i
        n2 = num - i
        bn1 = dec_to_bina(n1)
        bn2 = dec_to_bina(n2)
        cu_bn1 = cuenta_unos(bn1)
        cu_bn2 = cuenta_unos(bn2)
        if cu_bn1 + cu_bn2 > maxcandy:
            maxcandy = cu_bn1 + cu_bn2
            maxcandy_n1 = n1
            maxcandy_n2 = n2
    return maxcandy_n1, maxcandy_n2

print(maximo(numero))

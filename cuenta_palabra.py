"""
Este programa encuentra cuantas veces se puede escribir la palabra net en una cadena
"""

cadena = 'programacion en .net'
cadena2 = 'netnetnet'


def cuenta_c(st):

    e = st.count("e")
    n = st.count("n")
    t = st.count("t")
    print(e, n, t)
    net = 0
    while e > 0 and n > 0 and t > 0:
        if e >= 1 and n >= 1 and t >= 0:
            net += 1
            e = e - 1
            n = n - 1
            t = t - 1
        elif e == 0 or n == 0 or t == 0:
            break
    return net

print(cuenta_c(cadena))

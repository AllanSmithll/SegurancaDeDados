def cifracesar(txt, s,modo:int):
    '''
    txt: texto para encriptar
    s: quantos salto para trás + 1
    modo:
    1 -> Encriptar
    0 -> Decriptar
    '''
    result = ""
    for i in range(len(txt)):
        char = txt[i]
        if modo == 1:
            fator = s
        else:
            fator = -(s+2)
        if (char.isupper()):
            fator1 = -64
            fator2 = 65
        else:
            fator1 = -96
            fator2 = 97
        result += chr((ord(char) + fator + fator1) % 26 + fator2)
    return result

result = cifracesar("DADICA LEM", 6, 1)
print(result)
import numpy as np
import pandas as pd
def generate_windows(data, x_len, y_len):
    """
    Construye una matriz de ventanas dados los siguientes argumentos:
    + data: list or array
    + x_len : longitud de la ventana que se usará para predecir
    + y_len: tamaño del horizonte
    """
    N = x_len + y_len
    return np.array([
        pd.Series(data).shift(i) for i in reversed(range(N))
    ]).transpose()[N-1:, :]

def mix_data(data):
    """Devuelve la matriz formateada"""
    complete = np.empty((list(data["radon"].shape) + [len(data.keys())]))
    keys = list(data.keys())
    for i in range(len(keys)):
        complete[:,:,i] = data[keys[i]]
    return complete
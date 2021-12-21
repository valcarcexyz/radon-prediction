import numpy as np
def generate_windows(data, x_len, y_len):
    """
    Construye una matriz de ventanas dados los siguientes argumentos:
    + data: list or array
    + x_len : longitud de la ventana que se usará para predecir
    + y_len: tamaño del horizonte
    """
    N = len(data) - (x_len + y_len) + 1
    _data = np.zeros((N, (x_len + y_len)))
    
    for i in range(N):
        _data[i,:] = data[i:(i+x_len+y_len)]
    return _data

def mix_data(data):
    """Devuelve la matriz formateada"""
    complete = np.empty((list(data["radon"].shape) + [len(data.keys())]))
    keys = list(data.keys())
    for i in range(len(keys)):
        complete[:,:,i] = data[keys[i]]
    return complete
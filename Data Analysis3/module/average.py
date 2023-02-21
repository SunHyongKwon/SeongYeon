import numpy as np

def g_mean(x):
    x_new = [i for i in x if i != 0]
    a = np.log(x_new)

    return np.exp(a.mean())



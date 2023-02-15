def remove(data,column):
    quant1 =data[column].quantile(0.25)
    quant2 =data[column].quantile(0.5)
    quant3 =data[column].quantile(0.75)

    iqr = quant3 - quant1

    min = quant1 - 1.5 * iqr
    max = quant3 + 1.5 * iqr

    data=data[(data[column] >= min) & (data[column] <= max)]

    return data
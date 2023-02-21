import pandas as pd 
import numpy as np

def remove(data,column):
    quant1 =data[column].quantile(0.25)
    quant2 =data[column].quantile(0.5)
    quant3 =data[column].quantile(0.75)

    iqr = quant3 - quant1

    min = quant1 - 1.5 * iqr
    max = quant3 + 1.5 * iqr

    data=data[(data[column] >= min) & (data[column] <= max)]

    return data


def removeTen(data,column,percent):
    data =data.sort_values(by = column)
    length = len(data)
    # 작은거 자르기
    cut = length // percent
    data = data.iloc[cut:,:]

    # 큰거 자르기
    data =data.sort_values(by =column , ascending=False)
    cut = length - 2 * cut
    data = data.iloc[:cut,:]

    return data

def thirtyTwo(food):
    food_count=food.pivot_table(index=['상권_코드', '상권_코드_명', '서비스_업종_코드', '서비스_업종_코드_명'],aggfunc='size')
    food_count=pd.DataFrame(food_count[food_count == 32]).reset_index()
    code=zip(food_count['상권_코드'],food_count['서비스_업종_코드'])
    food_temp = food[food[['상권_코드','서비스_업종_코드']].apply(tuple,1).isin(code)]
    
    return food_temp
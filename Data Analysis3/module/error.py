
from sklearn.metrics import mean_squared_error ,mean_absolute_error , r2_score
import numpy as np
import pandas as pd
from sklearn.linear_model import LinearRegression , Ridge , Lasso
from sklearn.model_selection import train_test_split

def model_err_measure(feature,target):
    lr = LinearRegression()
    rd = Ridge()
    ls = Lasso()
    
    train_input , test_input , train_target , test_target = \
        train_test_split(feature,target)
    lr.fit(train_input,train_target)
    rd.fit(train_input,train_target)
    ls.fit(train_input,train_target)
    predict_lr = lr.predict(test_input)
    predict_rd = rd.predict(test_input)
    predict_ls = ls.predict(test_input)
    err_lr = measure_error('lr',predict_lr,test_target)
    err_rd = measure_error('rd',predict_rd,test_target)
    err_ls = measure_error('ls',predict_ls,test_target)
    a=pd.DataFrame([err_lr])
    b=pd.DataFrame([err_rd])
    c=pd.DataFrame([err_ls])

    error = pd.concat([a,b,c],axis=0)
    return error


def measure_error(model_name,predict, test_target):    
    errorMap ={}
    errorMap['model_name']=model_name
    errorMap['MSE']=mean_squared_error(predict,test_target)
    errorMap['MAE']=mean_absolute_error(predict,test_target)
    errorMap['RMSE']=np.sqrt(errorMap['MSE'])
    errorMap['R2Score']=r2_score(predict,test_target)

    return errorMap
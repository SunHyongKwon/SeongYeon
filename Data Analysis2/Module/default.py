import numpy as np
import pandas as pd
from sklearn.model_selection import train_test_split , cross_validate
from sklearn.neighbors import KNeighborsRegressor
from sklearn.ensemble import RandomForestRegressor
from sklearn.tree import DecisionTreeRegressor
from sklearn.svm import SVR
from sklearn.linear_model import LinearRegression , Lasso , Ridge , ElasticNet , QuantileRegressor
from sklearn.inspection import permutation_importance

def basic(data,target):
    knr = KNeighborsRegressor()
    lr = LinearRegression()
    ridge =Ridge()
    lasso = Lasso()
    eln = ElasticNet()
    quantile = QuantileRegressor()
    dt = DecisionTreeRegressor()
    rf = RandomForestRegressor()
    svr = SVR()

    train_input , test_input , train_target , test_target = train_test_split(data,target,test_size=0.2)

    models = [knr, lr, ridge, lasso, eln, quantile, dt, rf , svr ]

    for model in models:
        scores = cross_validate(
            model,
            train_input,
            train_target,
            return_train_score=True
        )

        print(type(model))

        print('train : ',np.mean(scores['train_score']))
        print('test : ',np.mean(scores['test_score']))

        print('-'*50)

def importance(data,target,columns):
    train_input , test_input , train_target , test_target = train_test_split(data,target,test_size=0.2)

    dt = DecisionTreeRegressor()
    rf = RandomForestRegressor()

    dt.fit(train_input,train_target)
    rf.fit(train_input,train_target)

    result_dt = permutation_importance(
        dt,
        train_input,
        train_target,
        n_repeats=10
    )

    result_rf = permutation_importance(
        rf,
        train_input,
        train_target,
        n_repeats=10
    )

    dt_imp = dt.feature_importances_
    rf_imp = rf.feature_importances_
    dt_per = result_dt.importances_mean
    rf_per = result_rf.importances_mean

    cnt = 0

    for column in columns:
        print('column 이름 :' ,column)
        print(f'{column} feature\timportaces\t- dt : {dt_imp[cnt]},\trf : {rf_imp[cnt]}')
        print(f'{column} permutation\timportaces\t- dt : {dt_per[cnt]},\trf : {rf_per[cnt]}')
        print(f'{column} 별 차이\t\t\t- dt : {dt_imp[cnt] - dt_per[cnt]},\trf : {rf_imp[cnt] - rf_per[cnt]}')
        print('-'*100)

        cnt += 1
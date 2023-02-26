from sklearn.linear_model import Ridge , Lasso
from sklearn.model_selection import cross_validate
from sklearn.model_selection import train_test_split
import numpy as np

def ridge(feature,target,alphas=[0.0001 , 0.001 , 0.01 , 0.1, 1, 10, 100, 1000, 10000]):

    train_input , test_input , train_target , test_target = \
        train_test_split(feature,target,test_size=0.2)

    for i in alphas:
        ridge = Ridge(alpha=i)
        scores = cross_validate(
            ridge,
            train_input,
            train_target,
            return_train_score=True
        )
        print('-'*50,'alpha : ',i,'-'*50)
        print('train :',np.mean(scores['train_score']))
        print('val :',np.mean(scores['test_score']))

        ridge.fit(train_input,train_target)
        print('test :',ridge.score(test_input,test_target))
        print()

def lasso(feature,target,alphas=[0.0001 , 0.001 , 0.01 , 0.1, 1, 10, 100, 1000, 10000]):

    train_input , test_input , train_target , test_target = \
        train_test_split(feature,target,test_size=0.2)

    for i in alphas:
        ridge = Lasso(alpha=i)
        scores = cross_validate(
            ridge,
            train_input,
            train_target,
            return_train_score=True
        )
        print('-'*50,'alpha : ',i,'-'*50)
        print('train :',np.mean(scores['train_score']))
        print('val :',np.mean(scores['test_score']))

        ridge.fit(train_input,train_target)
        print('test :',ridge.score(test_input,test_target))
        print()
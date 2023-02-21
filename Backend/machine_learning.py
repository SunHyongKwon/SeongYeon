"""
Create on 2023-02-06
author : Kenny
Description : Flutter와 Python의 AI의 예측값 보내기
"""

from flask import Flask, jsonify, render_template, request
from sklearn.preprocessing import PolynomialFeatures
import numpy as np
import pandas as pd
import joblib


app = Flask(__name__)

@app.route("/predict")
def predict():
    shop = int(request.args.get('shop'))
    open = int(request.args.get('open'))
    franchise = int(request.args.get('franchise'))
    worker = int(request.args.get('worker'))
    teenWorker = int(request.args.get('teen'))
    dong = str(request.args.get('dong'))

    clf = joblib.load('gwanak_ridge_model.h5')

    poly = PolynomialFeatures(include_bias=False)
    train_input = [[shop,open,franchise,worker,teenWorker]]

    poly.fit(train_input)

    train_poly=poly.transform(train_input)


    columns=poly.get_feature_names_out() + '1'

    train_poly_log =np.log1p(train_poly)
    train_poly_log = pd.DataFrame(train_poly_log,columns=columns)

    columns=poly.get_feature_names_out() + '2'

    train_poly_sqrt =np.sqrt(train_poly)
    train_poly_sqrt = pd.DataFrame(train_poly_sqrt,columns=columns)
    
    dong_list = ['낙성대동',
       '난곡동', '난향동', '남현동', '대학동',
       '미성동', '보라매동', '삼성동', '서림동',
       '서원동', '성현동', '신림동', '신사동',
       '신원동', '은천동', '인헌동', '조원동',
       '중앙동', '청룡동', '청림동', '행운동']
    
    index = dong_list.index(dong)

    one_hot =[[ 0 if i != index else 1 for i in range(len(dong_list))]]

    one_hot =pd.DataFrame(one_hot)

    train_input = pd.DataFrame(train_input)

    feature = pd.concat([train_input,train_poly_log,train_poly_sqrt,one_hot],axis=1)

    pre = clf.predict(feature.to_numpy())

    return jsonify({'result' : pre[0]})


if __name__ == "__main__":
    app.run(host='127.0.0.1',port=5000,debug=True)
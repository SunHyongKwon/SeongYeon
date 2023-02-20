from flask import Flask, render_template # render_template는 템플릿 파일을 렌더링할 떄 사용 

app = Flask(__name__) #플라스크 객체 실행

@app.route("/")
def hello():
    return "Hello"

@app.route("/time") #라우팅 설정
def time():
    return render_template('time.html')

@app.route("/gender") #라우팅 설정
def gender():
    return render_template('gender.html')

@app.route("/age") #라우팅 설정
def age():
    return render_template('age.html')

# @app.route("/logging")
# def logging_test():
#     test = 1
#     app.logger.debug('디버깅 필요')
#     app.logger.warning(str(test) + " 라인")
#     app.logger.error('에러발생')
#     return "로깅 "

if __name__ == "__main__":
    app.run()


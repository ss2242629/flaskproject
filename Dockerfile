FROM  python:3.9
WORKDIR /flaskproject

#COPY ./requirements.txt /requirements.txt
COPY . . 

#RUN pip install --no-cache-dir --upgrade -r /requirements.txt

RUN pip insall Flask 

CMD ["Flask", "run", "hello.py" ]
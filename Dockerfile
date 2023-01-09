FROM python:3
USER root

RUN apt-get update
RUN apt-get -y install locales && \
    localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
ENV TZ JST-9
ENV TERM xterm

RUN apt-get install -y vim less
RUN pip install --upgrade pip
RUN pip install --upgrade setuptools

RUN python -m pip install numpy==1.24.1
RUN python -m pip install Matplotlib==3.6.2
RUN python -m pip install -U setuptools pip
RUN python -m pip install cupy-cuda111

RUN mkdir /workspace
WORKDIR /workspace
ADD src/ /workspace/

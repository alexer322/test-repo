FROM bluedata/centos7

RUN yum -y update
RUN yum -y install sudo yum install -y python3
RUN mkdir ~/pyapp
RUN pip3 install requests bs4 

ADD ./pyapp/ ~/pyapp
CMD [ "/usr/bin/python3","/~/pyapp/main.py" ]

EXPOSE 80

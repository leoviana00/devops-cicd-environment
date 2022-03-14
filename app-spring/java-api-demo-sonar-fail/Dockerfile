FROM maven:3-jdk-8-alpine
WORKDIR /usr/src/app
RUN apk update && apk upgrade && apk add netcat-openbsd
RUN apk add tzdata bash
RUN cp /usr/share/zoneinfo/Brazil/East /etc/localtime
RUN echo "Brazil/East" >  /etc/timezone
RUN unlink /etc/localtime && ln -s /usr/share/zoneinfo/Etc/GMT+3 /etc/localtime
COPY . /usr/src/app
ENV PORT 5000
CMD [ "sh", "-c", "spring-boot:run" ]

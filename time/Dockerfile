FROM nginx:alpine

RUN apk add bash
#RUN echo $(readlink /etc/localtime | sed 's#/var/db/timezone/zoneinfo/##') > /etc/timezone
ENV TZ="Asia/Kolkata"
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
WORKDIR /time
COPY template.html /time/template.html
COPY cron.sh /time/cron.sh
RUN chmod +x cron.sh
COPY startup.sh /docker-entrypoint.d/startup.sh
COPY nginx.conf /etc/nginx/nginx.conf

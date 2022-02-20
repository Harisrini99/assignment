FROM nginx:alpine

RUN apk add bash
ENV TZ="Asia/Kolkata"
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
WORKDIR /time
COPY template.html /time/template.html
COPY cron.sh /time/cron.sh
RUN chmod +x cron.sh
COPY start.sh /docker-entrypoint.d/start.sh
RUN chmod +x /docker-entrypoint.d/start.sh
COPY nginx.conf /etc/nginx/nginx.conf
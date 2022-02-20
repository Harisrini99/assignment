
## Docker Image to Show Hour for the Day

This repo contains files, scripts and dockerfile which will show the hour of the day according to the local timezone, without doing a call get time evenytime.

### Folder Contents

- Dockerfile - Package the contents for docker.
- start.sh - Startup script will be executing on the starting container.
- nginx.conf - Nginx Configuration file to serve static HTML file
- template.html - Template for creating index HTML file
- cron.sh - CronJob which will be running every hour to update the hour of the day.

### Working of Image
- This docker image will launch the Nginx http server and serve the static index.html file, which will be generated from template.html by startup script(during startup of container).
- Startup script will first schedule the cron job to run every hour and in the background it will run a cron script which will create index html with current Epoch Time in IST Format using template html file.
- Index html will have the Epoch time in IST format, and when the user tries to access the this page, it will fetch the local timezone and convert the epoch into local timezone time.
- Cron job will be running once in every hour, which will get the current epoch time in IST format and start the sleep timer to change the time after 15th,30th and 45th minute.Since the time will be changing for every 15 minutes in different timezone, we are running this sleep timer to update.

### How to run
```
docker run -p 8080:80  docker.io/harisrini99/multizone_parallel:stable
```

### How to test
- open a browser and type http://localhost:8080, you will see the current hour according to local timezone.

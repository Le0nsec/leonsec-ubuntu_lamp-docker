FROM leonsec/lamp:php5.5.9
LABEL maintainer="leon.clqorz@gmail.com"
RUN rm -rf /app/*
COPY src /app
COPY db.sql /db.sql
EXPOSE 80 3306
CMD ["/run.sh"]
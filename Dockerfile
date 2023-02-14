#base img
FROM rocker/shiny:4.2.2

#copy files + install req packages
COPY ./app/* /root/shiny_app
RUN Rscript /root/shiny_app/requirements.R
EXPOSE 3838

#run app
CMD ["R", "-e", "shiny::runApp('/root/shiny_app', host='0.0.0.0', port=3838)"]
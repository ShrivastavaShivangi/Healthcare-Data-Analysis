FROM mysql:latest

ENV DB_NAME=project_medical_data_history
ENV DB_HOST=18.136.157.135
ENV DB_USER=dm_team4
ENV DB_PASSWORD='DM!$!Team!47@4!23&'

CMD ["sh","-c","mysql -h$DB_HOST -u$DB_USER -p$DB_PASSWORD $DB_NAME"]
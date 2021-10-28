FROM ubuntu
 
RUN apt-get update && apt-get upgrade -y
 
RUN apt-get install nginx -y
 
EXPOSE 5000

CMD ["nginx", "-g", "daemon off;"]

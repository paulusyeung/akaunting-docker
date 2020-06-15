Steps to use this repo:

1. Create the image
  docker build -t tagName .

2. Modify akaunting.conf
  edit: ServerName www.example.com
  
3. Create and edit the .env
  cp sample.env .env
  vi .env

4. Modify docker-compse.yml
  edit the image tag: <your_image_tag_here>

5. Create the container
  docker-compose up -d

P.S.

1. enahance docker-compose.yml to include the mysql container
Steps to use this repo:

1. Modify akaunting.conf
  edit: ServerName www.example.com
  e.g.: ServerName 192.168.12.144:8081
  
2. Create the image
  docker build -t tagName .

3. Create and edit the .env
  cp sample.env .env
  vi .env

4. Modify docker-compse.yml
  edit the image tag: <your_image_tag_here>

5. Create the container
  docker-compose up -d

P.S.

1. enahance docker-compose.yml to include the mysql container

2. If you skip step 1 & 2 and use the pre-created image, you can fix the conf file after step 5 as follow:

2.1 Modify akaunting.conf as stated on Step 1
2.2 Locate your volume, CONF_VOL=armyofbear_conf, folder (referred as Mount point),
    e.g. /var/lib/docker/volumes/armyofbear_conf/_data
2.3 Copy your akaunting.conf to this folder:
    sudo cp akaunting.conf /var/lib/docker/volumes/armyofbear_conf/_data/.
2.4 Restart your akaunting container, named as AKAUNTING_CONTAINER=armyofbear_ak in sample.env
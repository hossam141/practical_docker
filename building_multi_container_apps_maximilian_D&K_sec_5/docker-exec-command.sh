#Create docker network
docker network create goals-net

#Build Backend node-app image
docker build -t goals-node

#Run Backend container
docker run --name goals-bacekend -v FULL_PATH_OF_WORKING_APP_DIR:/app -v logs:/app/logs -v /app/node_modules --rm -p 80:80 --network goals-net -it goals-node 

#Build Frontend node-app image
docker build -t goals-react

#Run Forntend container
docker run --name goals-frontend -v FULL_PATH_OF_WORKING_APP_DIR_OF_THE_React_SOURCE_CODE/app/src --rm -p 3000:3000 -it goals-react


#Run mongodb conatiner
docker run --name mongodb -v data:/data/db \
       -e MONGO_INITDB_ROOT_USERNAME=root \
       -e MONGO_INITDB_ROOT_PASSWORD=secret \
       --rm --network goals-net



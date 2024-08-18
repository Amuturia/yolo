#Now to modify with the research from reduction of images
#Step 1: the base image
FROM node:14-alpine AS build 
#My working directory
WORKDIR /app
#Now package.json and -lock.json for my dependancies
COPY package*.json ./
#Readme Says to run Npm Install
RUN npm install
 #The app will need the rest of the files being npm installed as well as the scr folder
COPY . .
#The Readme also specifies that the app is not optimized, how about..
RUN npm run build

#Step 2: reuse step 1 build
#Begin with the base image
FROM node:14-alpine
WORKDIR /app
#Copy the optimized version that was built
COPY --from=build ./app ./

# RUN npm install -g serve

EXPOSE 3000
CMD [ "npm", "start" ]
# CMD [ "serve", "-s", "build", "-l", "3000" ]
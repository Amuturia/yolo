FROM node:14-alpine
#Work directory to point to backend
WORKDIR /app

# Copy package.json and package-lock.json inside folder backend
COPY package*.json ./

RUN npm install --production
# Copy the rest of the application code
COPY . .
#Expose the port ahead of start application
EXPOSE 5000
#start the application with the given command
CMD [ "node", "server.js" ]
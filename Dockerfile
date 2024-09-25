#FROM node

#WORKDIR /app

##COPY package.json /app

#COPY . /app

#RUN npm install

#EXPOSE 3000

#CMD ["npm", "start"]

# fetch node.js image from docker hub
FROM node

WORKDIR /app

# COPY . .
# first dot represent - source - copy all files from current location
# second dot represent - destination - paste all files in app directory

# COPY package.json /app/
# COPY server.js /app/

COPY . /app/

ARG NODE_ENV
RUN if [ "$NODE_ENV" = "development" ]; \
    then npm install; \
    else npm install --only=production; \
    fi

ENV PORT 3000
EXPOSE ${PORT}

# CMD ["node", "server.js"]
# CMD ["npm", "start"]
CMD ["node", "server.js"]
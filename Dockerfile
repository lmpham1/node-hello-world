FROM node:18.13.0 AS base

WORKDIR /app

COPY package.json .

FROM base AS dependencies

RUN npm set progress=false && npm config set depth 0 &&\
    npm install --only=production &&\
    cp -R node_modules prod_node_modules &&\
    npm install

FROM base AS release

COPY --from=dependencies /app/prod_node_modules ./node_modules
# copy app sources
COPY ./src ./src
# expose port and define CMD
EXPOSE 8080
CMD ["npm", "run", "start"]
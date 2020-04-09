FROM node:13.12.0 as build-stage
WORKDIR /app
RUN git clone https://github.com/cytomine/Cytomine-Web-UI.git && cd Cytomine-Web-UI && git checkout v1.1.1
WORKDIR /app/Cytomine-Web-UI
RUN npm install
RUN npm run build

FROM nginx as production-stage
RUN mkdir /app
COPY --from=build-stage /app/Cytomine-Web-UI/dist /app
COPY nginx.conf /etc/nginx/nginx.conf

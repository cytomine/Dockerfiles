# Cytomine Dockerfiles
You will find here all the Dockerfiles used to compile Cytomine docker images.
These images are used in the Cytomine-bootstrap procedure or in the clients.

## How to compile it
You will find below a script to compile all the images.

    cd base && docker build -t cytomine/base:v1.3.0 .
    cd ../memcached && docker build -t cytomine/memcached:v1.2.0 .
    cd ../rabbitmq && docker build -t cytomine/rabbitmq:v1.2.0 .
    cd ../java8 && docker build -t cytomine/java8:v1.3.0 .
    cd ../software_router && docker build -t cytomine/software_router:v2.1.0 .
    cd ../tomcat && docker build -t cytomine/tomcat:v1.3.0 .
    cd ../core && docker build -t cytomine/core:v3.0.3 .
    cd ../web-ui && docker build -t cytomine/web_ui:v1.2.2 .
    cd ../postgres && docker build -t cytomine/postgres:v2.1.0 .
    cd ../postgis && docker build -t cytomine/postgis:v2.1.0 .
    cd ../iipbase && docker build -t cytomine/iipbase:v1.3.0 .
    cd ../iipCyto && docker build -t cytomine/iipcyto:v1.3.0 .
    cd ../iipOfficial && docker build -t cytomine/iipofficial:v1.3.0 .
    cd ../bioformat && docker build -t cytomine/bioformat:v1.2.0 .
    cd ../ims && docker build -t cytomine/ims:v1.2.6 .
    cd ../nginx && docker build -t cytomine/nginx:v1.4.0 .
    cd ../mongodb && docker build -t cytomine/mongodb:v1.2.0 .
    cd ../slurm && docker build -t cytomine/slurm:v1.0.0 .
    cd ../software-python3-base && docker build -t cytomine/software-python3-base:v2.2.1 .
    cd ..
    echo DONE

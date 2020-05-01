# Cytomine Dockerfiles
You will find here all the Dockerfiles used to compile Cytomine docker images.
These images are used in the Cytomine-bootstrap procedure.

## How to compile it
You will find below a script to compile all the images.

    cd base && docker build -t cytomine/base:v1.2.0 .
    cd ../memcached && docker build -t cytomine/memcached:v1.1.2 .
    cd ../rabbitmq && docker build -t cytomine/rabbitmq:v1.1.2 .
    cd ../java8 && docker build -t cytomine/java8:v1.2.0 .
    cd ../software_router && docker build -t cytomine/software_router:v2.0.0 .
    cd ../tomcat7 && docker build -t cytomine/tomcat7:v1.2.1 .
    cd ../core && docker build -t cytomine/core:v3.0.0 .
    cd ../web-ui && docker build -t cytomine/web_ui:v1.2.0 .
    cd ../iris && docker build -t cytomine/iris:v1.1.2 .
    cd ../tomcat7 && docker build -t cytomine/tomcat7:v1.2.0 .
    cd ../postgres && docker build -t cytomine/postgres:v2.0.0 .
    cd ../postgis && docker build -t cytomine/postgis:v2.0.0 .
    cd ../retrieval && docker build -t cytomine/retrieval:v1.1.2 .
    cd ../iipbase && docker build -t cytomine/iipbase:v1.2.0 .
    cd ../iipCyto && docker build -t cytomine/iipcyto:v1.2.1 .
    cd ../iipJpeg2000 && docker build -t cytomine/iipjpeg2000:v1.1.1 .
    cd ../iipOfficial && docker build -t cytomine/iipofficial:v1.2.0 .
    cd ../bioformat && docker build -t cytomine/bioformat:v1.1.2 .
    cd ../ims && docker build -t cytomine/ims:v1.2.3 .
    cd ../nginx && docker build -t cytomine/nginx:v1.3.0 .
    cd ../mongodb && docker build -t cytomine/mongodb:v1.1.2 .
    cd ../auto_backup && docker build -t cytomine/backup:v1.1.2 .
    cd ../slurm && docker build -t cytomine/slurm:v1.0.0 .
    cd ..
    echo DONE

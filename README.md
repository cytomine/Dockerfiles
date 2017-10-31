# Cytomine Dockerfiles
You will find here all the Dockerfiles used to compile Cytomine docker images.
These images are used in the Cytomine-bootstrap procedure.

## How to compile it
You will find below a script to compile all the images.

    cd base && docker build -t="cytomine/base" .
    cd ../memcached && docker build -t="cytomine/memcached" .
    cd ../rabbitmq && docker build -t="cytomine/rabbitmq" .
    cd ../java8 && docker build -t="cytomine/java8" .
    cd ../software_router && docker build -t="cytomine/software_router" .
    cd ../tomcat7 && docker build -t="cytomine/tomcat7" .
    cd ../core && docker build -t="cytomine/core" .
    cd ../iris && docker build -t="cytomine/iris" .
    cd ../postgres && docker build -t="cytomine/postgres" .
    cd ../postgis && docker build -t="cytomine/postgis" .
    cd ../retrieval && docker build -t="cytomine/retrieval" .
    cd ../iipbase && docker build -t="cytomine/iipbase" .
    cd ../iipCyto && docker build -t="cytomine/iipcyto" .
    cd ../iipJpeg2000 && docker build -t="cytomine/iipjpeg2000" .
    cd ../iipOfficial && docker build -t="cytomine/iipofficial" .
    cd ../bioformat && docker build -t="cytomine/bioformat" .
    cd ../ims && docker build -t="cytomine/ims" .
    cd ../data_for_test && docker build -t="cytomine/data_test" .
    cd ../nginx && docker build -t="cytomine/nginx" .
    cd ../mongodb && docker build -t="cytomine/mongodb" .
    cd ../auto_backup && docker build -t="cytomine/backup" .
    cd ..
    echo DONE

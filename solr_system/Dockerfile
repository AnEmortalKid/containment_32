FROM solr:8

# setup 
COPY *.json /galaxy/
COPY init_galaxy.sh /
# disable cors
COPY web.xml /opt/solr-8.6.2/server/solr-webapp/webapp/WEB-INF/
ENTRYPOINT [ "bash", "-c",  "/init_galaxy.sh"]
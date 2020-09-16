FROM wnameless/oracle-xe-11g-r2

ENV ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe \
    ORACLE_SID=XE 
ENV PATH=$PATH:$ORACLE_HOME/bin

ADD a.sql /docker-entrypoint-initdb.d/
ADD init.sql /docker-entrypoint-initdb.d/

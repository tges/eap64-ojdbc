FROM jboss-eap-6/eap64-openshift

MAINTAINER Yun In Su <ora01000@time-gate.com>

USER root


## copy ojdbc7.jar to image

COPY ojdbc7.jar /usr/share/java
RUN cd /usr/share/java && ln -s ojdbc7.jar ojdbc.jar

USER jboss

# RUN cp /opt/eap/standalone/configuration/standalone-openshift.xml /opt/eap/standalone/configuration/standalone-openshift-orgin.xml

RUN mkdir -p /opt/eap/modules/system/layers/openshift/com/oracle/main
COPY module.xml /opt/eap/modules/system/layers/openshift/com/oracle/main
RUN ln -s /usr/share/java/ojdbc7.jar /opt/eap/modules/system/layers/openshift/com/oracle/main/ojdbc.jar
COPY ./configuration/standalone-openshift.xml /opt/eap/standalone/configuration
COPY ./bin/launch/datasource.sh /opt/eap/bin/launch
COPY ./bin/launch/tx-datasource.sh /opt/eap/bin/launch

USER root

RUN chown jboss:jboss /opt/eap/modules/system/layers/openshift/com/oracle/main/module.xml
RUN chown jboss:jboss /opt/eap/standalone/configuration/standalone-openshift.xml
RUN chown jboss:jboss /opt/eap/bin/launch/datasource.sh
RUN chown jboss:jboss /opt/eap/bin/launch/tx-datasource.sh

# Switch to the user 185 for OpenShift usage
USER 185

# Start the main process
CMD ["/opt/eap/bin/openshift-launch.sh"]

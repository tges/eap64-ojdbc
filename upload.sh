docker save -o eap64.tar jboss-eap-6/eap64-openshift-oracle:latest
scp eap64.tar root@10.1.0.42:/root
ssh root@10.1.0.42 "docker load -i /root/eap64.tar"
ssh root@10.1.0.42 "docker push jboss-eap-6/eap64-openshift-oracle:latest"


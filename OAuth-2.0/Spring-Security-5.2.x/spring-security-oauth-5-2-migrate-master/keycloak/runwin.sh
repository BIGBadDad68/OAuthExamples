cd "\ProgramFileNS\keycloak-10.0.1\bin"
DIR="\Users\Alber\Documents\Examples\OAuth-2.0\Spring-Security-5.2.x\spring-security-oauth-5-2-migrate-master\keycloak"
JAVA_OPTS="%JAVA_OPTS% -Djboss.as.management.blocking.timeout=10000"
./add-user-keycloak.sh -r master -u admin -p password
./add-user-keycloak.sh -r oauth2-sample -u user1 -p password
./standalone.bat -Djboss.socket.binding.port-offset=10 -Dkeycloak.migration.action=import -Dkeycloak.migration.provider=singleFile -Dkeycloak.migration.file=$DIR/oauth2-sample-realm-config.json -Dkeycloak.migration.strategy=OVERWRITE_EXISTING

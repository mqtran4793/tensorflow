pipeline {
   environment {
      REGISTRY = "mqtran4793"
      REGISTRY_CREDS = credentials('b318c682-2a99-48d9-a497-71b540466c48')
      // DOCKER_CONFIG="$WORKSPACE/.docker"
   }

   agent any

   stages {
      stage('Build debian-base') {
         steps {
            sh './build.sh debian-base 0.1 ${REGISTRY} ${REGISTRY_CREDS_USR} ${REGISTRY_CREDS_PSW}'
         }
      }
   }
}

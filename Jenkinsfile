pipeline {
   agent any

   environment {
      REGISTRY = "mqtran4793"
      REGISTRY_CREDS = registryCredentials('dockerhub')
      // DOCKER_CONFIG="$WORKSPACE/.docker"
   }

   stages {
      stage('Build debian-base') {
         steps {
            sh './build.sh debian-base 0.1 ${REGISTRY} ${REGISTRY_CREDS_USR} ${REGISTRY_CREDS_PSW}'
         }
      }
   }
}

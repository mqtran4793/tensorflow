pipeline {
   environment {
      //registry = "mqtran4793/repository_name"
      //registryCredential = ‘dockerhub’
      REGISTRY = "docker.io/mqtran4793"
      REGISTRY_CREDS = "$HOME/.docker/config.json"
      DOCKER_CONFIG="$HOME/.docker"
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

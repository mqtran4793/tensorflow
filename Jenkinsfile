pipeline {
   environment {
      //registry = "mqtran4793/repository_name"
      //registryCredential = ‘dockerhub’
      REGISTRY = "mqtran4793"
      DOCKER_CONFIG="$HOME/.docker"
   }

   agent any

   stages {
      stage('Build debian-base') {
         steps {
            sh './build.sh debian-base 0.1 ${REGISTRY} '
         }
      }
   }
}

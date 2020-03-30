pipeline {
   environment {
      registry = "mqtran4793"
      registryCredential = ‘dockerhub’
      // REGISTRY = "mqtran4793"
      // REGISTRY_CREDS = "$HOME/.docker/config.json"
      // DOCKER_CONFIG="$HOME/.docker"
      dockerImage = ''
   }

   agent any

   stages {
      stage('Building image') {
         steps {
            cd debian-base/
            script {
               dockerImage = docker.build registry + "/debian-base:$BUILD_NUMBER"
            }
         }
      }
      stage('Deploy image') {
         steps {
            script {
               docker.withRegistry( '', registryCredential ) {
                  dockerImage.push()
               }
            }
         }
      }
   }
}

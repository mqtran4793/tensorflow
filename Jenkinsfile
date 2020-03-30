pipeline {
   agent any
   
   environment {
      REGISTRY="mqtran4793/test"
      REGISTRY_CREDS = credentials('bXF0cmFuNDc5MzpIaWV1MDgxNjk2Lg==')
      DOCKER_CONFIG="${HOME}/.docker"
   }   

   options {
      timeout (time: 3, unit: 'HOURS')
      buildDiscarder (logRotator (numToKeepStr: '1'))
   }

   stages {
      stage('Build debian-base') {
         steps {
            sh './build.sh debian-base/ ${REGISTRY} ${REGISTRY_CREDS_USR} ${REGISTRY_CREDS_PSW}'
         }
      }
   }
}

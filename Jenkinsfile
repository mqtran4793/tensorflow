pipeline {
   agent any

   environment {
      REGISTRY="chadwpalm"
      REGISTRY_CREDS = credentials('dockerhub')
   }

   stages {
      stage('Build debian-tensorflow') {
         steps {
            sh './build.sh debian-tensorflow 1.0 ${REGISTRY} ${REGISTRY_CREDS_USR} ${REGISTRY_CREDS_PSW}'
         }
      }
   }
}

pipeline {
   agent none

   environment {
      REGISTRY="mqtran4793"
      REGISTRY_CREDS = credentials('dockerhub')
   }

   stages {
      stage('Build debian-tensorflow') {
         agent { label 'docker' }
         steps {
            sh './build.sh debian-tensorflow 1.0 ${REGISTRY} ${REGISTRY_CREDS_USR} ${REGISTRY_CREDS_PSW}'
         }
      }
   }
}

pipeline {
   agent any

   environment {
      REGISTRY="mqtran4793"
      REGISTRY_CREDS = credentials('dockerhub')
   }

   stages {
      stage('Build debian-tensorflow') {
         steps {
            sh './build.sh debian-tensorflow TEST ${REGISTRY} ${REGISTRY_CREDS_USR} ${REGISTRY_CREDS_PSW}'
         }
      }
   }
}

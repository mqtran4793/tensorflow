pipeline {
   agent any

   environment {
      REGISTRY="mqtran4793"
      REGISTRY_CREDS = credentials('dockerhub')
   }

   stages {
      stage('Build debian-base') {
         steps {
            cd debian-base/
            sh './build.sh debian-base 0.1 ${REGISTRY} ${REGISTRY_CREDS_USR} ${REGISTRY_CREDS_PSW}'
         }
      }
   }
}

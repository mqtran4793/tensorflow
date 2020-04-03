pipeline {
   agent any

   environment {
      REGISTRY="mqtran4793"
      REGISTRY_CREDS = credentials('dockerhub')
   }

   stages {
      stage('Build debian-tf-base') {
         steps {
            sh './build.sh debian-tf-base 0.7 ${REGISTRY} ${REGISTRY_CREDS_USR} ${REGISTRY_CREDS_PSW}'
         }
      }
      // stage('Build debian-tf-build') {
      //    steps {
      //       sh './build.sh debian-tf-build 0.1 ${REGISTRY} ${REGISTRY_CREDS_USR} ${REGISTRY_CREDS_PSW}'
      //    }
      // }
   }
}

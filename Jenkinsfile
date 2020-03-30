pipeline {
   agent any
   
   environment {
      DOCKER="mqtran4793"
      DOCKER_CREDS = 'dockerhub'
   }   

   options {
      timeout (time: 3, unit: 'HOURS')
      buildDiscarder (logRotator (numToKeepStr: '1'))
   }

   stages {
      stage('Build debian-base') {
         steps {
            sh './build.sh debian-base ${REGISTRY}'
         }
      }
   }
}

pipeline {
   agent any
   
   environment {
      registry = "mqtran4793"
      registryCredential = 'dockerhub'
   }   

   options {
      timeout (time: 3, unit: 'HOURS')
      buildDiscarder (logRotator (numToKeepStr: '1'))
   }

   stages {
      stage('Build debian-base') {
         steps {
            sh './build.sh debian-base 0.1 ${registry}'
         }
      }
   }
}

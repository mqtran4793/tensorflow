pipeline {
   agent none

   options {
      timeout (time: 3, unit: 'HOURS')
      buildDiscarder (logRotator (numToKeepStr: '1'))
   }

   stages {
      stage('Build debian-base') {
         agent { label 'docker' }
         steps {
            sh './build.sh'
         }
      }
   }
}

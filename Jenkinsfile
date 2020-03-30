pipeline {
   agent any

   options {
      timeout (time: 3, unit: 'HOURS')
      buildDiscarder (logRotator (numToKeepStr: '1'))
   }

   stages {
      stage('Build debian-base') {
         steps {
            sh './build.sh'
         }
      }
   }
}

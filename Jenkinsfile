pipeline {
     agent any
 stages{
     stage('Build Docker Image'){
        steps{
           sh "docker build . -t skandude/webapp:${currentBuild.number}"

     }  }
     stage('Docker push'){
          steps{
            withCredentials([string(credentialsId: 'dpass', variable: 'dlogin')]) {
               sh "docker login -u  skandude -p ${dlogin}"
                sh "docker push  skandude/webapp:${currentBuild.number}"
}
          }
     }
}
 
}

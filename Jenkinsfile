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
     stage('Deploy in K8s'){
        steps{
         sh "chmod +x  change.sh"
         sh "./change.sh ${currentBuild.number}"
           sshagent(['ssh-key']) {
             sh "scp -o StrictHostKeyChecking=no newpod.yaml ec2-user@3.96.155.172:/home/ec2-user/"
             script {
                try{
                   sh "ssh ec2-user@3.96.155.172 kubectl create -f newpod.yaml"
                   }
                catch(error){
                    sh "ssh ec2-user@3.96.155.172 kubectl apply -f newpod.yaml"
                }

           } 
 
        }
     }
}
} 
}

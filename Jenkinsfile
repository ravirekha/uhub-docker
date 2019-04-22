pipeline {
  environment {
    registry = "uhub.service.ucloud.cn/ws_kubernets_mirror/ws-jenkins-slave"
    registryCredential = 'uhub'
    dockerImage = ''
  }
  agent {
  label 'docker_slave1'
  }
   stage('Building image') {
     steps{
       script {
        dockerImage = docker.build registry + ":latest"
        }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
         docker.withRegistry( 'https://uhub.service.ucloud.cn','uhub') {         
           sh '''
            docker push uhub.service.ucloud.cn/ws_kubernets_mirror/ws-jenkins-slave:latest
            '''
         }
        }
      }
    }
  }
} 

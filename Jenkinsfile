pipeline {
  environment {
    registry = "uhub.service.ucloud.cn/ws_kubernets_mirror/ws-jenkins-slave1"
    registryCredential = 'uhub'
    dockerImage = ''
  }
  agent {
  label 'ravi'
  }
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/ravirekha/pipeline-project.git'
      }
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
          
            sh 
            '''
                   sudo docker login -u ravikumar@oncam.com -p RAvi@398 uhub.service.ucloud.cn
                   sudo docker push uhub.service.ucloud.cn/ws_kubernets_mirror/ws-jenkins-slave1:latest
            '''
         
        }
      }
    }
  }
} 

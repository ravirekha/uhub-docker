pipeline {
  environment {
    registry = "uhub.service.ucloud.cn/ws_kubernetes_mirror/ws-jenkins-slave"
    registryCredential = 'uhub'
    dockerImage = ''
    }
  agent {
  label 'docker_slave1'
  }
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/ravirekha/'
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
         docker.withRegistry( 'https://uhub.service.ucloud.cn','uhub') {         
           sh '''
            docker push uhub.service.ucloud.cn/ws_kubernetes_mirror/ws-jenkins-slave:latest
            '''
         }
        }
      }
    }
  }
} 

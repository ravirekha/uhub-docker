pipeline {
  environment {
    registry = "ws_kubernetes_mirror/jenkins-ws-slave"
    registryCredential = 'uhub'
    dockerImage = ''
  }
  agent any
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
          docker.withRegistry( "uhub.service.ucloud.cn",'uhub') {
            dockerImage.push()
          }
        }
      }
    }
  }
} 

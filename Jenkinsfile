pipeline {
  environment {
    registry = "uhub.service.ucloud.cn/ws_kubernets_mirror"
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
          docker.withRegistry( '','uhub') {
            dockerImage.push()
          }
        }
      }
    }
  }
} 

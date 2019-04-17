pipeline {
  environment {
    registry = "uhub.service.ucloud.cn"
    registryCredential = 'uhub'
    dockerImage = 'uhub.service.ucloud.cn/ws_Slave_image/                               '
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
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
  }
} 

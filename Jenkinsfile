pipeline {
  environment {
    registry = "kaenriquez/docker-test"
    registryCredential = 'docker'
    dockerImage = ''
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/kaenriquez/test.git'
      }
    }
    
    stage('Building image') {
       steps {     
         dockerImage = docker.build registry + ":$BUILD_NUMBER"
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
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $registry:$BUILD_NUMBER"
      }
    }
  }
}

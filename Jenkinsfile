pipeline {
  environment {
    registry = "test"
    registryUrl = 'https://192.168.254.162:5000'
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
         script {
         dockerImage = docker.build registry + ":$BUILD_NUMBER"
       }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry(registryUrl) {
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

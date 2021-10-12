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
    
    stage('Deploy') {
                 parallel { 
                            stage('Deploy start ') {
                           steps {
                                echo "Start the deploy .."
                           } 
                           }
                            stage('Deploying now') {
                            agent {
                                    docker {
                                            reuseNode true
                                            image "nginx"
                                           }
                                    }
                            
                              steps {
                                echo "Docker Created"
                              }
                           }
                           }
                           }
   // stage('Building image') {
     //   steps {
       //   docker {
            
      //            reuseNode true
     //             image "apache"
        // dockerImage = docker.build registry + ":$BUILD_NUMBER"
      //  }
      //}
    //}
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

def DOCKER_IMAGE_NAME
def VERSION
pipeline {
  environment {
    registryUrl = '192.168.254.174:5000'
    
    PORT ='8050'
    EXPOSE_PORT ='8080'
    name ='nginx'
    dockerImage = ''
   // DEV_SSH_USER = credentials('sshuser')
   DOCKER_SERVER = 'ssh://kath@192.168.254.176'
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/kaenriquez/test.git'
      }
    }
    stage("Gathering Variables") {
            steps {
                script{
                    DOCKER_IMAGE_NAME = "${env.registryUrl}/${env.name}:latest"
                   
                }
            }
        }
    
    stage('Building Image') {
       steps {  
         script {
         sh "docker build -t ${DOCKER_IMAGE_NAME} ."
      //   dockerImage = docker.build name 
       }
      }
    }
    stage('Push Image') {
      steps{
        script {
          docker.withRegistry(registryUrl) {
          sh "docker push ${DOCKER_IMAGE_NAME}"
          //  dockerImage.push()
          }
        }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
        //  sh "docker -h ${env.DOCKER_SERVER} run -p 8000:80 nginx/test"
          sh "docker -H ${env.DOCKER_SERVER} run -d --name ${env.name} --restart unless-stopped -p ${env.PORT}:${env.EXPOSE_PORT} ${DOCKER_IMAGE_NAME}"
        }
      }
    }
    
  }
}

def DOCKER_IMAGE_NAME
def VERSION
pipeline {
  environment {
    registryUrl = '10.201.1.26:5000'
    
    PORT ='8081'
    EXPOSE_PORT ='8080'
    name ='apache2'
    dockerImage = ''
   // DEV_SSH_USER = credentials('sshuser')
   DOCKER_SERVER = 'ssh://kath@10.201.1.29'
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

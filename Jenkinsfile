pipeline {

    agent any 
    
    environment {
        DOCKERHUB_CREDENTIALS= credentials('manudocker')
    }

    stages {

        stage("check docker version") {

             steps {
                sh 'docker ps'
                
             }
        }
        stage ("build an image") {
            steps {
                sh 'docker build -t yannmanux/myimage .'
            }
        }
        stage (" login to dockerhub") {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW |  docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                    echo ' login completed'
            }
        }
        stage ("push image to dockerhub") {
            steps {
                sh 'docker push yannmanux/myimage'
            }
        }
    }
    post {
        always {
            sh ' docker logout'
        }
    }
}
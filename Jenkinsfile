pipeline {
    agent any
    stages {
        stage('Build Docker Image') {
            // when {
            //     branch 'master'
            // }
            steps {
                // Checkout your source code
                checkout scm
                
                // Build Docker image
                script {
                    docker.build("subedishiva61/flaskproject:${env.BUILD_NUMBER}")
                }
            }
            
        }
        stage('Push Docker Image') {
            // when {
            //     branch 'master'
            // }
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'docker_hub_login') {
                        // Push Docker image to Docker Hub
                        docker.image("subedishiva61/flaskproject:${env.BUILD_NUMBER}").push()
                    }
                }
            }
        }
    }
}
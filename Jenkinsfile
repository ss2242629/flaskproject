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
        
        stage('Deploy') {
            steps {
                script {
                    // def ip = 'ip'
                    // def username = 'ssh_username'

                    // Use SSH agent credentials configured in Jenkins
                    sshagent() {
                        // SSH into remote server and run Docker commands
                        sh """
                            ssh ${username}@${prod_ip} '
                                docker pull <>:subedishiva61/flaskproject${env.BUILD_NUMBER} &&
                                docker stop <>&&
                                docker rm <>&&
                                docker run --restart always --name <> -p 8080:8080 -d <>:${env.BUILD_NUMBER}
                            '
                        """
                    }
                }
            }
        }
    }
}


pipeline {
    agent any
    environment {
        REGISTRY = "docker.io"
        IMAGE_NAME = "server"
        IMAGE_TAG = "latest"
        SERVER_PORT = "8085"
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/Curiousgoal202/Project121.git'
            }
        }
        stage('Build') {
            steps {
                echo 'Building'
            }
        }
        stage('Test') {
            steps {
                echo 'Running test'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh "docker build -t $IMAGE_NAME:$IMAGE_TAG ."
            }
        }
        stage('Stop Old Container') {
            steps {
                sh """
                docker stop webserver || true
                docker rm webserver || true
                """
            }
        }
        stage('Run New Container') {
            steps {
                sh """
                docker run -d --name webserver -p $SERVER_PORT:80 $IMAGE_NAME:$IMAGE_TAG
                """
            }
        }
        stage('Health Check'){
                  steps{
                    script{
                          sh "sleep 5"
                          sh """
                          curl -s -o /dev/null -w "%{http_code}" http://localhost:$SERVER_PORT | grep 200
                            """
                         }
                   }
               }

    }
    post {
        success {
            echo "✅ Deployment successful!"
            mail(
                to: 'santosgoal2024@gmail.com',
                subject: "SUCCESS: Webserver Pipeline",
                body: "Your webserver is up on port ${SERVER_PORT}"
            )
        }
        failure {
            echo "❌ Deployment failed!"
            mail(
                to: 'santosgoal2024@gmail.com',
                subject: "FAILED: Webserver Pipeline",
                body: "Please check the Jenkins logs for details."
            )
        }
    }
}

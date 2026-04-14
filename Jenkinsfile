pipeline {
    agent { label 'worker' }

    environment {
        IMAGE_NAME = "test-pipeline"
        CONTAINER_NAME = "jenkins-pipeline"
        PORT = "5010"
    }

    stages {

        stage('Checkout Code') {
            steps {
                git url: 'https://github.com/Antony2026-ai/pipeline-test.git', branch: 'main'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${IMAGE_NAME} ."
            }
        }

        stage('Stop Old Container') {
            steps {
                sh "docker rm -f ${CONTAINER_NAME} || true"
            }
        }

        stage('Run Container') {
            steps {
                sh "docker run -d -p ${PORT}:5000 --name ${CONTAINER_NAME} ${IMAGE_NAME}"
            }
        }
    }

    post {
        success {
            echo "✅ Pipeline Success - App Deployed!"
        }

        failure {
            echo "❌ Pipeline Failed"
        }
    }
}

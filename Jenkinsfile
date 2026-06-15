pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                echo 'Cloning repository...'
                checkout scm
            }
        }
        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                bat 'docker build -t my-cicd-app .'
            }
        }
        stage('Run Container') {
            steps {
                echo 'Running container...'
                bat 'docker stop my-cicd-app-container || exit 0'
                bat 'docker rm my-cicd-app-container || exit 0'
                bat 'docker run -d -p 3000:3000 --name my-cicd-app-container my-cicd-app'
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed! App is running on port 3000.'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
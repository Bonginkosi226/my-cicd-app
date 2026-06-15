pipeline {
    agent any

    environment {
        DOCKER = '"C:\\Program Files\\Docker\\Docker\\resources\\bin\\docker.exe"'
    }

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
                bat "%DOCKER% build -t my-cicd-app ."
            }
        }
        stage('Run Container') {
            steps {
                echo 'Running container...'
                bat "%DOCKER% stop my-cicd-app-container || exit 0"
                bat "%DOCKER% rm my-cicd-app-container || exit 0"
                bat "%DOCKER% run -d -p 3000:3000 --name my-cicd-app-container my-cicd-app"
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
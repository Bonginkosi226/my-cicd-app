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
                bat '"C:\\Program Files\\Docker\\Docker\\resources\\bin\\docker.exe" build -t my-cicd-app .'
            }
        }
        stage('Run Container') {
            steps {
                echo 'Running container...'
                bat '"C:\\Program Files\\Docker\\Docker\\resources\\bin\\docker.exe" stop my-cicd-app-container || exit 0'
                bat '"C:\\Program Files\\Docker\\Docker\\resources\\bin\\docker.exe" rm my-cicd-app-container || exit 0'
                bat '"C:\\Program Files\\Docker\\Docker\\resources\\bin\\docker.exe" run -d -p 3000:3000 --name my-cicd-app-container my-cicd-app'
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
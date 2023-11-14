pipeline {
    agent any
    environment {
        // Assuming Flutter is installed via Homebrew and is available in the PATH
        PATH = "/opt/homebrew/bin:${env.PATH}"
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Install Dependencies') {
            steps {
                sh 'flutter pub get'
            }
        }
        stage('Run Tests') {
            when {
                changeRequest() // This stage will only run for PRs
            }
            steps {
                sh 'flutter test'
            }
        }
        stage('Build Android') {
            steps {
                sh 'flutter build apk --release'
            }
        }
        stage('Build iOS') {
            steps {
                sh 'flutter build ios --release --no-codesign'
            }
        }
    }
    post {
        success {
            echo 'Build was successful!'
            // Add steps for distribution if needed, e.g., uploading to a beta testing service
        }
        failure {
            echo 'Build failed!'
            // Add steps for notification or error handling
        }
    }
}

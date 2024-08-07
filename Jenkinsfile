pipeline {
    agent any
    stages {
        stage('Self Check') {
            steps {
                sh './gradlew --version'
            }
        }
        stage('Code Style') {
            steps {
                sh './gradlew spotlessJavaCheck'
            }
        }
        stage('Static Analysis') {
            steps {
                sh './gradlew pmdMain'
            }
        }
        stage('Tests') {
            steps {
                sh './gradlew test'
            }
        }
        stage('Build Jar') {
            steps {
                sh './gradlew bootJar'
            }
        }
    }
    post {
        always {
            sh 'rm -rf ./build/*'
        }
    }
}

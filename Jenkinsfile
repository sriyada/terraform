pipeline {
    agent any
    stages {
        stage('Example Build') {
            steps {
                checkout scm
                echo 'Hello, Maven'
                sh 'terraform init'
                sh 'terrafrom plan'
                sh 'pwd'
                sh 'ls -al'
            }
        }
        stage('Example Test') {
            steps {
                echo 'Hello'
            }
        }
    }
}

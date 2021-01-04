pipeline {
    agent any
    stages {
        stage('Example Build') {
            steps {
                checkout scm
                echo 'Hello, Maven'
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

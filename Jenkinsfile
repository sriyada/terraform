pipeline {
    agent any
    stages {
        stage('Example Build') {
            steps {
                checkout scm
                echo 'Hello, Maven'
                sh 'pwd'
            }
        }
        stage('Example Test') {
            steps {
                echo 'Hello'
            }
        }
    }
}

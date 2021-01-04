pipeline {
    agent any
    stages {
        stage('Example Build') {
            steps {
                echo 'Hello, Maven'
                sh 'terraform plan'
            }
        }
        stage('Example Test') {
            steps {
                echo 'Hello'
            }
        }
    }
}

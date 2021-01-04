pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWSforTerraform')
        AWS_SECRET_ACCESS_KEY = credentials('AWSforTerraform')
    }
    tools {
        terraform 'Terraform'
    }
    stages {
        stage('Example Build') {
            steps {
                checkout scm
                echo 'Hello, Maven'
                sh 'which terraform'
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

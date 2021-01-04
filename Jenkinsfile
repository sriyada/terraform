pipeline {
    agent any
    tools {
        terraform 'Terraform'
    }
    stages {
        stage('Example Build') {
            steps {
                checkout scm
                echo 'Hello, Maven'
            }
        }
        stage('Terraform') {
            steps {
                script {
                    withAWS(credentials: 'AWSforTerraform') {
                 sh 'which terraform'
                 sh 'terraform init'
                 sh 'terrafrom plan'
                 sh 'pwd'
                 sh 'ls -al'
                    }
                }
            }
        }
    }
}

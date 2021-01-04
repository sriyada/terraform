pipeline {
    agent any
    environment {
        withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'AWSforTerraform',
                        ACCESS_KEY: 'ACCESS_KEY', SECRET_KEY: 'SECRET_KEY']]) { }
    }
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

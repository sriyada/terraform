pipeline {
    agent any
    options {
     buildDiscarder(logRotator(numToKeepStr: '2'))
     ansiColor('xterm')
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
                    withCredentials([[
        $class: 'AmazonWebServicesCredentialsBinding', 
        accessKeyVariable: 'AWS_ACCESS_KEY_ID', 
        secretKeyVariable: 'AWS_SECRET_ACCESS_KEY',
        credentialsId: "AWSforTerraform"
    ]]) {
                 sh 'which terraform'
                 sh 'terraform init'
                 sh 'terraform plan'
                 sh 'terraform apply --auto-approve'
                 sh 'terraform destroy --auto-approve'
                 sh 'pwd'
                 sh 'ls -al'
    }
                }
            }
        }
    }

post { 
        always { 
            cleanWs()
        }
    }
}

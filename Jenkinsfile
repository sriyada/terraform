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
                    withCredentials([[
        $class: 'AmazonWebServicesCredentialsBinding', 
        accessKeyVariable: 'AWS_ACCESS_KEY_ID', 
        secretKeyVariable: 'AWS_SECRET_ACCESS_KEY',
        credentialsId: "AWSforTerraform"
    ]]) {
                 sh 'which terraform'
                 sh 'terraform init'
                 sh 'terraform plan'
                 //sh 'terraform apply --auto-approve'
                 sh 'git add terraform.tfstate'
                 sh 'git add commit -m"${env.BUILD_NUMBER}"'
                 sh 'git push'
                 sh 'pwd'
                 sh 'ls -al'
    }
                }
            }
        }
    }
}

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
                 //sh 'terraform init'
                 sh 'terraform plan'
                 sh 'terraform apply --auto-approve'
                 sh 'git config --global user.email "sri.yada9@gmail.com"'
                 sh 'git config --global user.name "harsha"'
                 //sh 'git init'
                 sh 'git status'
                 sh 'git add terraform.tfstate'
                 sh 'git commit -m "git push"'
                 sh 'git push origin HEAD:master'
                 sh 'pwd'
                 sh 'ls -al'
    }
                }
            }
        }
    }
}

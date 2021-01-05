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
                 sh 'terraform apply --auto-approve'
                 //sh 'git init'
                 //sh 'git status'
                 //sh 'git add terraform.tfstate'
                 //sh 'git commit -m "git push"'
                 //sh 'git push origin master'
                 sh 'pwd'
                 sh 'ls -al'
    }
                }
            }
        }
        stage ('gitpush'){
            steps {
                script {
                  sh 'git status'
                  sh 'git add terraform.tfstate'
                  sh 'git commit -m "git push"'
                  withCredentials([usernamePassword(credentialsId: 'gitpush',
                  usernameVariable: 'Username',
                  passwordVariable: 'Password')]){
                      sh 'git push origin master'
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
pipeline {
    agent any
    environment {
        // Inject GitHub token from Jenkins credentials
        TF_VAR_github_token = credentials('GITHUBTOKEN')
    }
    stages {
        stage('Clean and Prepare Work Directory') {
            steps {
                echo "Cleaning and preparing the work directory..."
                sh 'rm -rvf /tmp/terraform1920'
                sh 'mkdir -p /tmp/terraform1920'
            }
        }
        
        stage('Clone Repository') {
            steps {
                echo "Cloning the Terraform repository..."
                sh 'git clone https://github.com/HarshalST/terraform1 /tmp/terraform1920'
            }
        }
        
        stage('Terraform Infrastructure Setup') {
            steps {
                dir('/tmp/terraform1920') {
                    echo "Initializing Terraform..."
                    sh 'terraform init'
                    
                    echo "Applying Terraform changes..."
                    sh 'terraform apply --auto-approve'
                }
            }
        }
    }
}

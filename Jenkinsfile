pipeline {
    agent any

    parameters {
        choice(
            name: 'ENVIRONMENT',
            choices: ['dev', 'stag', 'prod'],
            description: 'Choose Terraform Environment'
        )
    }

    environment {
        AWS_DEFAULT_REGION = 'us-east-2'
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Format') {
            steps {
                sh 'terraform fmt -check'
            }
        }

        stage('Terraform Validate') {
            steps {
                sh 'terraform validate'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh """
                terraform plan \
                -var-file=${params.ENVIRONMENT}.tfvars \
                -out=tfplan
                """
            }
        }

        stage('Approval') {
            steps {
                input(
                    message: "Deploy to ${params.ENVIRONMENT} ?",
                    ok: "Deploy"
                )
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve tfplan'
            }
        }

        stage('Terraform Output') {
            steps {
                sh 'terraform output'
            }
        }
    }

    post {
        success {
            echo "Deployment to ${params.ENVIRONMENT} completed successfully."
        }

        failure {
            echo "Pipeline failed."
        }
    }
}

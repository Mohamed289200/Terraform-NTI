pipeline {
    agent any

    parameters {
        choice(
            name: 'ENVIRONMENT',
            choices: ['dev', 'stag', 'prod'],
            description: 'Select Terraform Environment'
        )

        choice(
            name: 'ACTION',
            choices: ['plan', 'apply', 'destroy'],
            description: 'Terraform Action'
        )
    }

    environment {
        AWS_DEFAULT_REGION = 'us-east-2'
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/Mohamed289200/Terraform-NTI.git'
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

            when {
                anyOf {
                    expression { params.ACTION == 'plan' }
                    expression { params.ACTION == 'apply' }
                }
            }

            steps {

                sh """
                terraform plan \
                -var-file=env/${params.ENVIRONMENT}.tfvars \
                -out=tfplan
                """
            }
        }

        stage('Approval Before Apply') {

            when {
                expression { params.ACTION == 'apply' }
            }

            steps {

                input(
                    message: "Deploy to ${params.ENVIRONMENT} ?",
                    ok: "Deploy"
                )
            }
        }

        stage('Terraform Apply') {

            when {
                expression { params.ACTION == 'apply' }
            }

            steps {

                sh 'terraform apply -auto-approve tfplan'
            }
        }

        stage('Approval Before Destroy') {

            when {
                expression { params.ACTION == 'destroy' }
            }

            steps {

                input(
                    message: "Destroy ${params.ENVIRONMENT} Infrastructure ?",
                    ok: "Destroy"
                )
            }
        }

        stage('Terraform Destroy') {

            when {
                expression { params.ACTION == 'destroy' }
            }

            steps {

                sh """
                terraform destroy \
                -auto-approve \
                -var-file=env/${params.ENVIRONMENT}.tfvars
                """
            }
        }

        stage('Terraform Output') {

            when {
                expression { params.ACTION == 'apply' }
            }

            steps {

                sh 'terraform output'
            }
        }
    }

    post {

        success {
            echo 'Pipeline Finished Successfully.'
        }

        failure {
            echo 'Pipeline Failed.'
        }
    }
}

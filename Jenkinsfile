pipeline {
    environment {
        NAME = "simple-python-api"      
        KUBECONFIG = '$KUBECONFIG'
    }    
    agent {
        node { label 'all-in-one' }
    }
    stages {
        stage('Docker Build') {
            steps {
                sh 'echo Building...'
            }
        }
        stage('Docker Publish') {
             steps {
                sh 'echo Publishing...'
            }
        }
        stage('Kubernetes Deploy') {
             steps {
                withCredentials([file(credentialsId: "kubeconfig", variable:"kubeconfig")])
                {
                    sh "helm repo update"
                    sh "helm install ${NAME} -f values.yaml janpreet/bare-bones"
                }
            }
        }                
    }
}
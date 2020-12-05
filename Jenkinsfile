pipeline {
    environment {
        KUBECONFIG = '$KUBECONFIG'        
    }    
    agent any
    stages {
        stage('Kubectl Test') {
            steps {
                withCredentials([file(credentialsId: "kubeconfig", variable:"kubeconfig")])
                {
                    sh "kubectl get nodes"
                }
            }
        }
        stage('Docker Publish') {
             steps {
                sh 'echo Publishing...'
            }
        }            
    }
}
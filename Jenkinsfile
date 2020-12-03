pipeline {
    environment {
        KUBECONFIG = '$KUBECONFIG'        
    }    
    agent any
    stages {
        stage('Kubectl Test') {
            agent {
                docker { image 'bitnami/kubectl:1.19' }
            }            
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
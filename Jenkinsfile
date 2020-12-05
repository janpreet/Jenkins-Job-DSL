pipeline {
    environment {
        KUBECONFIG = '$KUBECONFIG'        
    }    
    agent none
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
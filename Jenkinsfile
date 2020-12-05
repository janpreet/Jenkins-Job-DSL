pipeline {
    environment {
        KUBECONFIG = '$KUBECONFIG'        
    }    
    agent {
        node { label 'all-in-one' }
    }
    stages {
        stage('Deploy Kubernetes Dashboard') {
            steps {
                withCredentials([file(credentialsId: "kubeconfig", variable:"kubeconfig")])
                {
                    sh "helm repo add kubernetes-dashboard https://kubernetes.github.io/dashboard/"
                    sh "helm install kubernetes-dashboard kubernetes-dashboard/kubernetes-dashboard"
                }
            }
        }
        stage('Add sample admin') {
             steps {
                sh "kubectl apply -f service-account.yml"
                sh "kubectl apply -f role-binding.yml"
                sh "kubectl -n kubernetes-dashboard describe secret \$(kubectl -n kubernetes-dashboard get secret | grep admin-user | awk '{print \$1}')"
            }
        }            
    }
}
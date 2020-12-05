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
                    sh "kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0/aio/deploy/recommended.yaml"
                    //sh "helm repo add kubernetes-dashboard https://kubernetes.github.io/dashboard/"
                    //sh "helm install kubernetes-dashboard kubernetes-dashboard/kubernetes-dashboard --namespace kubernetes-dashboard --create-namespace"
                }
            }
        }
        stage('Add sample admin') {
             steps {
                withCredentials([file(credentialsId: "kubeconfig", variable:"kubeconfig")])
                {                 
                    sh "kubectl apply -f service-account.yml"
                    sh "kubectl apply -f role-binding.yml"
                    sh "kubectl -n default describe secret \$(kubectl -n default get secret | grep admin-user | awk '{print \$1}')"
                }
            }
        }            
    }
}
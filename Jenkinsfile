pipeline {
    environment {
        NAME = "maven-hello-world"      
        VERSION = readMavenPom().getVersion()
        REGISTRY = 'janpreet/maven-hello-world'
        REGISTRY_CREDENTIAL = 'dockerHub-user'
        KUBECONFIG = '/path/to/.kube/config'
    }    
    agent {
        node { label 'all-in-one' }
    }
    stages {
        stage('Build') {
            steps {
                sh 'mvn --version'
            }
        }
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
                    sh 'helm version'
                }
            }
        }                
    }
}
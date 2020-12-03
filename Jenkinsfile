pipeline {
    environment {
        NAME = "maven-hello-world"      
        VERSION = readMavenPom().getVersion()
        REGISTRY = 'janpreet/maven-hello-world'
        REGISTRY_CREDENTIAL = 'dockerHub-user'
        KUBECONFIG = '/var/jenkins_home/kubeconfig'
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
                    sh "helm install ${NAME} ./helm"
                }
            }
        }                
    }
}
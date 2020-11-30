pipeline {
    environment {
        NAME = "maven-hello-world"      
        VERSION = readMavenPom().getVersion()
        REGISTRY = 'janpreet/maven-hello-world'
        REGISTRY_CREDENTIAL = 'dockerHub-user'
        KUBECONFIG = '/path/to/.kube/config'
    }    
    agent{
        label "deploy"
    }
    stages {
        stage('Build') {
            agent {
                docker { image 'maven:3-alpine' }
            }
            steps {
                sh 'mvn --version'
            }
        }
        stage('Docker Build') {
            agent {
                docker { 
                    image 'docker:stable-dind-rootless' 
                }
            }
            steps {
                sh 'echo Building...'
            }
        }
        stage('Docker Publish') {
            agent {
                docker { 
                    image 'docker:stable-dind-rootless' 
                }
            }
            steps {
                sh 'echo Publishing...'
            }
        }
        stage('Kubernetes Deploy') {
            agent {
                docker { image 'alpine/helm' }
            }
            steps {
                sh 'helm --version'
            }
        }                
    }
}
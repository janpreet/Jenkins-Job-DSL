pipeline {
    environment {
        NAME = "maven-hello-world"      
        VERSION = readMavenPom().getVersion()
        REGISTRY = 'janpreet/maven-hello-world'
        REGISTRY_CREDENTIAL = 'dockerHub-user'
        KUBECONFIG = '/path/to/.kube/config'
    }    
    agent any
    stages {
        stage('Build') {
            agent { label 'maven' }
            steps {
                sh 'mvn --version'
            }
        }
        stage('Docker Build') {
            agent { label 'maven' }
            steps {
                sh 'echo Building...'
            }
        }
        stage('Docker Publish') {
            agent { label 'maven' }
            steps {
                sh 'echo Publishing...'
            }
        }
        stage('Kubernetes Deploy') {
            agent { label 'maven' }
            steps {
                sh 'helm version'
            }
        }                
    }
}
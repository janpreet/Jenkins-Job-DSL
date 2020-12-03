pipeline {
    environment {
        NAME = "maven-hello-world"      
        REGISTRY = 'janpreet/maven-hello-world'
        REGISTRY_CREDENTIAL = 'dockerHub-user'
    }    
    agent any
    stages {
        stage('Build') {
            agent {
                docker {
                    image 'alpine/helm'
                    args '-it --entrypoint=/bin/bash'                       
                }
            }            
            steps {
                sh 'helm version'
            }
        }
        stage('Docker Build') {
            agent {
                docker { image 'node:14-alpine' }
            }            
            steps {
                sh 'echo Building...'
            }
        }
        stage('Docker Publish') {
             steps {
                sh 'echo Publishing...'
            }
        }            
    }
}
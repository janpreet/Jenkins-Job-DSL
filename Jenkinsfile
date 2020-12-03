pipeline {
    environment {
        NAME = "maven-hello-world"      
        REGISTRY = 'janpreet/maven-hello-world'
        REGISTRY_CREDENTIAL = 'dockerHub-user'
    }    
    agent any
    stages {
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
pipeline {
    environment {
        NAME = "maven-hello-world"      
        VERSION = readMavenPom().getVersion()
        REGISTRY = 'janpreet/maven-hello-world'
        REGISTRY_CREDENTIAL = 'dockerHub-user'
        KUBECONFIG = '/path/to/.kube/config'
    }    
    agent {
        kubernetes {
            defaultContainer 'jnlp'
            yamlFile 'build.yml'
        }
    }
    stages {
        stage('Build') {
            steps {
                container('maven') {
                    sh 'mvn package'
                }
            }
        }
        stage('Docker Build') {
            steps {
                container('docker') {
                    sh "docker build -t ${REGISTRY}:${VERSION} ."
                }
            }
        }
        stage('Docker Publish') {
             steps {
                container('docker') {
                    withDockerRegistry([credentialsId: "${REGISTRY_CREDENTIAL}", url: ""]) {
                        sh "docker push ${REGISTRY}:${VERSION}"
                    }
                }
            }
        }
        stage('Kubernetes Deploy') {
            steps {
                container('helm') {
                  withCredentials([file(credentialsId: 'secret-config', variable: 'KUBECONFIG')]) {
                    sh 'use $KUBECONFIG'
                    sh "helm upgrade --install --force --set name=${NAME} ${NAME} ./helm"
                  }
                }
            }
        }
    }
}
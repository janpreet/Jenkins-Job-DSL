node {
  try {
    stage('checkout') {
      checkout scm
    }
    stage('prepare') {
      echo "Preparing..."
    }
    stage('compile') {
      echo "Compiling..."
    }
    stage('test') {
      echo "Testing..."
    }
    stage('package') {
      echo "Archiving..."
    }
    stage('publish') {
      echo "Publishing..."
    }
  } finally {
    stage('cleanup') {
      echo "Cleaning Up..."
    }
  }
}
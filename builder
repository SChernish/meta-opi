#!/usr/bin/env groovy
  stages {
    stage('Build') {
      steps {
        echo 'Building...'
        sh 'npm install'
      }
    }
  }

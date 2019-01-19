#!/bin/sh
  stages {
    stage('Build') {
      steps {
        echo 'Building...'
        echo '------------------------------'
 	echo '-----Cloning source files-----'
	echo '------------------------------'
	sh "git clone git://github.com/SChernish/meta-opi.git"
      }
    }
  }

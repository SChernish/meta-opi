#!/bin/sh
  stages {
    stage('Build') {
      steps {
        echo 'Building...'
        echo '------------------------------'
 	echo '-----Cloning source files-----'
	echo '------------------------------'
	git clone git://github.com/SChernish/meta-opi.git
	git clone git://github.com/devel-opi/meta-opi.git
	git clone git://git.openembedded.org/openembedded-core oe-core
	git clone git://git.openembedded.org/bitbake oe-core/bitbake
	git clone git://git.openembedded.org/meta-openembedded
      }
    }
  }

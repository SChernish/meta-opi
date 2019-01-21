pipeline {
    agent { label 'master' }
    environment{
        DELIVERY_DIR = '/var/www/artifacts'
        ARTIFACT_NAME = 'META-OPI-build-' + env.WORKSPACE + 'tar.gz'
    }
    stages {
        stage('Create Environment'){
            steps{
                script{
                    sh '''
                        printenv
                        cp -r WORKSPACE DELIVERY_DIR
                        ls DELIVERY_DIR
                    sh '''
                }
            }
        }
    }
}


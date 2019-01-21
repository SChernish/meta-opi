pipeline {
    agent { label 'master' }
    environment {
        source ./.env
        SOURCEDIR = $WORKSPACE
        TARGETDIR = '/var/www/artifacts'
    }
    stages {
        stage('Create Environment'){
            steps{
                script{
                    source ./.env
                    sh 'cp -r ' + ${SOURCEDIR} + ' ' + ${TARGETDIR}
                    sh 'ls ' + ${TARGETDIR}
                }
            }
        }
    }
}

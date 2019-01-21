pipeline {
    agent { label 'master' }
    stages {
        stage('Create Environment'){
        sh 'ls $WORKSPACE'
        SOURCEDIR=$WORKSPACE
        TARGETDIR=/var/www/artifacts
            steps{
                script{
                    sh 'echo ' + ${SOURCEDIR}
                    sh 'cp -r ' + ${SOURCEDIR} + ' ' + ${TARGETDIR}
                    sh 'ls ' + ${TARGETDIR}
                }
            }
        }
    }
}

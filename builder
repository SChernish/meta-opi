pipeline {
    agent { label 'master' }
    stages {
        stage('Create Environment'){
            steps{
                sh 'ls $WORKSPACE'
                SOURCEDIR=$WORKSPACE
                TARGETDIR=/var/www/artifacts
                script{
                    sh 'echo ' + ${SOURCEDIR}
                    sh 'cp -r ' + ${SOURCEDIR} + ' ' + ${TARGETDIR}
                    sh 'ls ' + ${TARGETDIR}
                }
            }
        }
    }
}

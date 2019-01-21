pipeline {
    agent { label 'master' }
    environment{
        SOURCEDIR=WORKSPACE
        TARGETDIR='/var/www/artifacts'
    }
    stages {
        stage('Create Environment'){
            steps{
                script{
                    sh 'printenv'
                    sh 'echo ' + ${SOURCEDIR}
                    sh 'cp -r ' + ${SOURCEDIR} + ' ' + ${TARGETDIR}
                    sh 'ls ' + ${TARGETDIR}
                }
            }
        }
    }
}

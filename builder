pipeline {
    agent { label 'master' }
    stages {
        stage('Create Environment'){
            steps{
                script{
                    SOURCEDIR=${env.$WORKSPACE}
                    TARGETDIR=/var/www/artifacts
                    sh 'echo ' + ${SOURCEDIR}
                    sh 'cp -r ' + ${SOURCEDIR} + ' ' + ${TARGETDIR}
                    sh 'ls ' + ${TARGETDIR}
                }
            }
        }
    }
}

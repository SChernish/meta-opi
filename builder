pipeline {
    agent { label 'master' }
    stages {
        stage('Create Environment'){
            steps{
                script{
                    def SOURCEDIR=${env.$WORKSPACE}
                    def TARGETDIR=/var/www/artifacts
                    sh 'echo ' + ${SOURCEDIR}
                    sh 'cp -r ' + ${SOURCEDIR} + ' ' + ${TARGETDIR}
                    sh 'ls ' + ${TARGETDIR}
                }
            }
        }
    }
}

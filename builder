pipeline {
    agent { label 'master' }
    environment{
        TARGETDIR = '/var/www/artifacts'
    }
    stages {
        stage('Create Environment'){
            steps{
                script{
                    sh 'printenv'
                    sh 'echo ' + ${env.WORKSPACE}
                    sh 'cp -r ' + ${env.WORKSPACE} + ' ' + ${env.TARGETDIR}
                    sh 'ls ' + ${env.TARGETDIR}
                }
            }
        }
    }
}

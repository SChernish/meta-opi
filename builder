pipeline {
    agent { label 'master' }
    stages {
        stage('Create Environment') {
        def ws = pwd()
        def context  = ws + "/testArtifact"
        def file = ws + '/file'
        sh 'touch ' + file
        sh 'ls ' + ws

        echo 'File on node : ' + new File(file).exists()
        echo 'Users : ' + new File('/Users').exists()

        sh 'mv ' + file + ' ' + context
        sh 'ls ' + ws
       }
}

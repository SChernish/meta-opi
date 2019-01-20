pipeline {
    agent { label 'master' }
    stages {
        stage('Create Environment') {
            steps {
                echo "Hello World!"
                sh "echo Hello from the shell"
                sh "hostname"
                sh "uptime"
            }
        }
        stage('Getting sources') {
            steps {
                copyArtifacts('META-OPI') {
                    includePatterns()
                    targetDirectory('/vat/www/artifacts')
                    flatten()
                    optional()
                    buildSelector {
                        latestSuccessful(true)
                    }
                }
            }
        }
   }
}

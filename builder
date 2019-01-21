pipeline {
    agent { label 'master' }
    environment{
        DELIVERY_DIR = '/var/www/artifacts'        
    }
    stages {

        stage('Cloning source files'){
            steps{
                deleteDir()
                script{
                    sh '''
                    #!/bin/bash
                        cd ${WORKSPACE}

                        echo  "+++++++ Clone devel-opi +++++++"
                        git clone git://github.com/devel-opi/meta-opi.git

                        echo  "+++++++ Clone oe-core +++++++"
                        git clone git://git.openembedded.org/openembedded-core oe-core

                        echo  "++ Clone oe-core/bitbake ++"
                        git clone git://git.openembedded.org/bitbake oe-core/bitbake

                        echo  "++ Clone meta-openembedded ++"               
                        git clone git://git.openembedded.org/meta-openembedded
                    '''
                }
            }
        }

        stage('Configure environment'){
            steps{
                script{
                    sh '''
                    #!/bin/bash
                        source oe-core/oe-init-build-env
                        cat ../meta-opi/bblayers.frag >> ./conf/bblayers.conf
                        cat ../meta-opi/conf.frag >> ./conf/local.conf
                    '''
                }
            }
        }

        stage('Delivery build'){
            steps{
                script{
                    sh '''
                    #!/bin/bash
                        cd ${WORKSPACE}
                        tar -czvf ${DELIVERY_DIR}/${JOB_BASE_NAME}-build-${BUILD_NUMBER}.tar.gz \n
                        -C ${WORKSPACE} ${WORKSPACE} --exclude '${WORKSPACE}/*.git'
                    '''
                }
                deleteDir()
            }
        }

    }
}


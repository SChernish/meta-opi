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
                        echo "\n"
                        echo  "+++++++ Clone oe-core +++++++"
                        git clone git://git.openembedded.org/openembedded-core oe-core
                        echo "\n"
                        echo  "++ Clone oe-core/bitbake ++"
                        git clone git://git.openembedded.org/bitbake oe-core/bitbake
                        echo "\n"
                        echo  "++ Clone meta-openembedded ++"               
                        git clone git://git.openembedded.org/meta-openembedded
                        echo "\n"
                    '''
                }
            }
        }

        stage('Building'){
            steps{
                script{
                    sh '''
                    #!/bin/bash
                        cd ${WORKSPACE}
                        source oe-core/oe-init-build-env
                        cat ../meta-opi/bblayers.frag >> ./conf/bblayers.conf
                        cat ../meta-opi/conf.frag >> ./conf/local.conf
                        git config --global user.email "gituser@builder.mdcexpert.com"
                        git config --global user.name "GitUser"
                        bitbake core-image-minimal
                    '''
                }
            }
        }

        stage('Delivery build'){
            steps{
                script{
                    sh '''
                    #!/bin/bash
                        cd ${WORKSPACE}/build/tmp-glibc/deploy/images/orange-pi-one
                        ls -laF
                        cd ${WORKSPACE}
                        tar -czvf ${DELIVERY_DIR}/${JOB_BASE_NAME}-build-${BUILD_NUMBER}.tar.gz \
                        -C ${WORKSPACE} ${WORKSPACE} \
                        --exclude '${WORKSPACE}/.git' \
                        --exclude '${WORKSPACE}/oe-core/bitbake/.git' \
                        --exclude '${WORKSPACE}/oe-core/.git' \
                        --exclude '${WORKSPACE}/meta-openembedded/.git' \
                        --exclude '${WORKSPACE}/meta-opi/.git' \
                        --exclude '${WORKSPACE}/.travis.yml' \
                        --exclude '${WORKSPACE}/builder'
                    '''
                }
                deleteDir()
            }
        }

    }
}


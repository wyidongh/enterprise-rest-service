pipeline {

    agent any


    environment {

        PROJECT_NAME = "enterprise-rest-service"

        VERSION = sh(
            script: "cat version.txt",
            returnStdout: true
        ).trim()

    }


    stages {


        stage('Checkout') {

            steps {

                echo "Checkout source code"

            }
        }



        stage('Build') {

            steps {

                echo "Compile C++ project"

                sh """
                    ./scripts/build.sh
                """

            }
        }



        stage('Package') {

            steps {

                echo "Create artifact"

                sh """
                    ./scripts/package.sh
                """

            }
        }



        stage('Archive Artifact') {

            steps {

                archiveArtifacts(
                    artifacts: 'artifacts/*.tar.gz',
                    fingerprint: true
                )

            }
        }


    }


    post {

        success {

            echo "Pipeline A SUCCESS"

        }


        failure {

            echo "Pipeline A FAILED"

        }

    }

}

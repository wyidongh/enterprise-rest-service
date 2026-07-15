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

	stage('Clean Workspace') {

	steps {

	deleteDir()

	}

	}


        stage('Checkout') {

            steps {

		checkout scm
            }
        }


	stage('Build') {

	    steps {

		echo "Compile inside cpp-ci container"


		sh """

		docker run --rm \
		    --user $(id -u):$(id -g) \
		    -v /home/dong/devops/jenkins_home/workspace/${JOB_NAME}:/workspace \
		    -w /workspace \
		    cpp-ci:build-2.0 \
		    bash -c './scripts/build.sh'

		"""

	    }
	}


	stage('Package') {

	    steps {

		echo "Package artifact"


		sh """

		docker run --rm \
		    --user $(id -u):$(id -g) \
		    -v /home/dong/devops/jenkins_home/workspace/${JOB_NAME}:/workspace \
		    -w /workspace \
		    cpp-ci:build-2.0 \
		    bash -c './scripts/package.sh'

		"""

	    }
	}


	stage('Verify Artifact') {

	    steps {

		sh '''
		echo "Verify artifact content"

		tar tzf artifacts/*.tar.gz

		echo "Check stop.sh"

		tar tzf artifacts/*.tar.gz | grep scripts/stop.sh

		'''

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

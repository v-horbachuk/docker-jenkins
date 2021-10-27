pipeline {
    agent any

    stages {
        stage ('Clone') {
            steps {
                checkout scm
            }
        }

        stage ('Build docker image') {
            steps {
                script {
                    docker.build('vhorbach.jfrog.io/default-docker-local/alpine-curl:latest')
                }
            }
        }

        stage ('Push image to Artifactory') {
            steps {
                rtDockerPush(
                    serverId: "Arti",
                    image: 'vhorbach.jfrog.io/default-docker-local/alpine-curl:latest',
                    targetRepo: 'default-docker-local',
                    // Attach custom properties to the published artifacts:
                    properties: 'project-name=docker-image_pl;status=testing'
                )
            }
        }

        stage ('Publish build info') {
            steps {
                rtPublishBuildInfo (
                    serverId: "Arti"
                )
            }
        }
    }
}

pipeline {
    agent {
    dockerfile {
        filename 'Dockerfile'
        label 'jenkins-agent'
        args '-u 1001:994 -v /var/run/docker.sock:/var/run/docker.sock'
        }
}

    stages {
        stage('Hello') {
            steps {
                echo 'Hello World'
            }
        }
    }
}

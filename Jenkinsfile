pipeline {
    agent {
    dockerfile {
        filename 'Dockerfile'
        label 'jenkins-agent'
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

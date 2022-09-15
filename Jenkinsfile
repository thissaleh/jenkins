pipeline {
    agent {
            kubernetes {
            // Rather than inline YAML, in a multibranch Pipeline you could use: yamlFile 'jenkins-pod.yaml'
            // Or, to avoid YAML:
            // containerTemplate {
            //     name 'shell'
            //     image 'ubuntu'
            //     command 'sleep'
            //     args 'infinity'
            // }
            yaml '''
apiVersion: v1
kind: Pod
spec:
  containers:
  - name: shell
    image: ubuntu
    command:
    - sleep
    args:
    - infinity
}

    stages {
        stage('Hello') {
            steps {
            
            container('shell') {
              sh 'hostname'
              sh 'echo Hello World'
             }
                
            }
        }
    }
}

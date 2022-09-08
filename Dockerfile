FROM jenkins/inbound-agent:jdk11

USER root

RUN apt-get update && apt-get install -y curl 
RUN mkdir -p /var/build_tools/pact_cli
RUN curl -LJO https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.88.81/pact-1.88.81-linux-x86_64.tar.gz
RUN tar -xzf pact-1.88.81-linux-x86_64.tar.gz -C /var/build_tools/pact_cli
RUN chown jenkins:jenkins /var/build_tools/pact_cli
ARG pact_cli_bins=$(find /var/build_tools/pact_cli/pact/bin/ | sed 's|.*/||')
RUN for file in $pact_cli_bins; do ln -s $file /usr/bin/$file ; done
RUN curl -LJO https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
RUN mkdir /usr/local/bin/argocd && mv argocd-linux-amd64 /usr/local/bin/argocd && chmod 777 /usr/local/bin/argocd/argocd-linux-amd64 
 
USER jenkins
ENTRYPOINT ["/usr/local/bin/jenkins-agent"]

# Introduction
This is a very simple docker image used for JenkinsPipelineUnit demonstration purposes.
It can be used offline.

It contains:
- one ready to use Jenkins installation
- its up-to-date plugins
- one single job: Integration

# Requirements
- docker machine
- a local checkout of this project in `$HOME/dev/jenkins-demo`

# The Integration multibranch pipeline job
This Jenkins job aims at building this project with gradle.

As it is a multibranch pipeline job, its code is located in the `Jenkinsfile` in the project root. 

Its declaration is located in `docker/jobs/integration/config.xml`.

# Build and publish the docker image
In `docker` directory run:
`docker build -t repository.admin.courtanet.net:10443/jenkins-demo -f Dockerfile .`
Then publish your image:
`docker push repository.admin.courtanet.net:10443/jenkins-demo`

# Starting docker image
- Be sure you have a local checkout of this git project in `$HOME/dev/jenkins-demo`
- Create the jenkins working directory:
`mkdir -p "$HOME/dev/jenkins-home"`
- Copy the configuration and the job declarations:
`cp -r docker/* "$HOME/dev/jenkins-home"`
- Start your docker
`docker run -p 8080:8080 \
    -v $HOME/dev/jenkins-home/:/var/jenkins_home \
    -v $HOME/dev/jenkins-demo/:/var/git-repo \
    repository.admin.courtanet.net:10443/jenkins-demo`

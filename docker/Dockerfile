FROM jenkins/jenkins:2.126-alpine

# https://hub.docker.com/_/jenkins/
# Même doc plus à jour : https://github.com/jenkinsci/docker/blob/master/README.md

# nécessaire pour lancer gradle
USER root
RUN apk add --no-cache "libstdc++"
RUN mkdir -p /var/git-repo
USER jenkins

# Installation des plugins
# plugins suggérés par défaut
COPY plugins.txt /usr/share/jenkins/ref/
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/ref/plugins.txt

# Pour ne pas avoir le wizard au démarrage
# https://groups.google.com/forum/#!topic/jenkinsci-users/Pb4QZVc2-f0
RUN echo 2.0 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state
RUN echo 2.0 > /usr/share/jenkins/ref/jenkins.install.InstallUtil.lastExecVersion

# Copie des fichiers comme valeur par défaut pour l'initialisation du workspace:
#   scriptApproval.xml                  Autorisation des commandes de base
#   hudson.plugins.gradle.Gradle.xml    Config du plugin Gradle
COPY *.xml /usr/share/jenkins/ref/

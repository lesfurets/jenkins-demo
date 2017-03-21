node() {
    stage('Checkout') {
        checkout(scm)
        sh 'git clean -xdf'
    }
    stage('Build and test') {
        sh './gradlew build'
        junit 'build/test-results/test/*.xml'
    }
}
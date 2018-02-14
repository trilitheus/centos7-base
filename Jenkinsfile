pipeline {
  agent any
  stages {
    stage('pull') {
      steps {
        git(url: 'https://github.com/trilitheus/centos7-base', branch: 'master', poll: true)
      }
    }
  }
}
pipeline {
  agent {
    docker {
      image 'our python image'
    }
  }

  stages {
    stage ('Checkout Code'){
      deleteDir()
      checkout scm
      stash 'sources'
    }

    stage ('Lint'){
      unstash 'sources'
      sh'''
      for file in lambda/*; do
        if [ -d $file ]; then
          for subfile in $file/*; do
            if [[ $subfile == *.py ]]; then
              pylint $subfile
            fi
          done
        fi
        if [[ $file == *.py ]]; then
          pylint $file
        fi
      done
      '''
    }
  }
}

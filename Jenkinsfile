node ('qa_windows_auto_csa' ){
  echo "Getting node info ..."
  bat "ipconfig"
  deleteDir()
  Map<String, String> checkoutInfo = checkout(scm)

  properties([
        parameters([
          choice(choices: ['QA'], description: 'Select environment', name: 'ENV_NAME'),
          choice(choices: ['CHROME', 'FIREFOX', 'INTERNET_EXPLORER'], description: 'Select type of browser', name: 'TYPE_OF_BROWSER'),
          string(defaultValue: '', description: "Test tag/tags, example for one tag: \'@QEAUTO-2046\', or for some tags: \'@QEAUTO-2046,@ADMCSA-1930\'", name: 'TAGS')
        ])
  ])


  def RESULT = 1

  stage("Checkout") {
      echo 'Checkout'
  }
  stage('Run tests'){
    helper = fileLoader.load('Helper')
    helper.runTests(params.ENV_NAME, params.TYPE_OF_BROWSER,params.TAGS, true)
  }
}
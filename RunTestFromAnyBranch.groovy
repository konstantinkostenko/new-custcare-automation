pathToJob = "${env.BUILD_NUMBER}"
nodeName = 'qa_windows_auto_csa'
branchName = BRANCH
repoUrl = 'https://github.com/coretech/new-custcare-automation'

node(nodeName) {
    echo "Getting node info ..."
    bat "ipconfig"
    dir("${pathToJob}") {
        stage('Clone git project') {
            git(
                url: repoUrl,
                credentialsId: env.IDT_JENKINS_GITHUB_CREDENTIALS,
                branch: branchName
            )
        }

        stage('Run tests') {
            helper = fileLoader.load('Helper')
            helper.runTests(ENV_NAME, TYPE_OF_BROWSER,TAGS, true)
        }
    }
}
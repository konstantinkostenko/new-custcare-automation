def runTests(envName, typeOfBrowser, tags, rerunTests) {
    try {
        echo 'echo testing'
        timestamps {
                withEnv(["PATH+GRADLE=${tool 'gradle44'}/bin", "PATH+JAVA_HOME=${tool 'jdk8'}/bin"]) {
                    jdk = tool name: 'jdk1.8'
                    env.JAVA_HOME = "${jdk}"
                    aliasName = UUID.randomUUID().toString()
                    bat "${jdk}/bin/keytool -importcert -keypass changeit -trustcacerts -keystore \"${jdk}/jre/lib/security/cacerts\" -file C:/BuildTools/certs/idt.net.crt -noprompt -storepass changeit -alias ${aliasName} -trustcacerts"
                    
                    withCredentials([string(credentialsId: 'API_REPORT_PORTAL', variable: 'API_REPORT_PORTAL')]) {
                    cucumberOptions = !params.TAGS.isEmpty() ? " -PcucumberOptions=\"--tags ${tags}\"" : ''
                    bat 'gradle.bat clean setRPProperties executeUIFeaturesv2 -PenvironmentName=' + "${envName}" + ' -Pbrowser=' + "${typeOfBrowser}" + ' -Prp_uuid=' + "${API_REPORT_PORTAL}" + cucumberOptions
                }
            }
        }
    }
    catch (Exception ex) {
        echo:
        String.format("Exception%s", ex.getMessage());

        if (rerunTests) {
            timestamps {
                try {
                        withEnv(["PATH+GRADLE=${tool 'gradle44'}/bin", "PATH+JAVA_HOME=${tool 'jdk8'}/bin"]) {
                            jdk = tool name: 'jdk1.8'
                            env.JAVA_HOME = "${jdk}"
                            aliasName = UUID.randomUUID().toString()
                            bat "${jdk}/bin/keytool -importcert -keypass changeit -trustcacerts -keystore \"${jdk}/jre/lib/security/cacerts\" -file C:/BuildTools/certs/idt.net.crt -noprompt -storepass changeit -alias ${aliasName} -trustcacerts"


                            withCredentials([string(credentialsId: 'API_REPORT_PORTAL', variable: 'API_REPORT_PORTAL')]) {
                            bat 'gradle.bat setRPProperties reExecuteUIFeaturesv2 -PenvironmentName=' + "${envName}" + ' -Pbrowser=' + "${typeOfBrowser}" + ' -Prp_uuid=' + "${API_REPORT_PORTAL}" + ' -Prerun=true'
                        }
                    }
                    currentBuild.result = "SUCCESS"
                    echo "****** Finished RE-RUN********"
                } catch (exception) {
                    echo "Re-run is failed because of: \n" + exception
                    currentBuild.result = "FAILURE"
                }
            }
        }
    }
    finally {
        stage('Reports') {
            try {
                echo "****** Copy categories.json file into allure results folder ******"
                bat "copy categories.json .\\allure-results"
                allure([
                        includeProperties: false,
                        jdk              : '',
                        properties       : [],
                        reportBuildPolicy: 'ALWAYS',
                        results          : [[path: 'custcare-ui/build/allure-results']]
                ])
            } catch (Exception ex) {
                echo:
                String.format("Exception%s", ex.getMessage());
            }
        }
    }
}

return this;

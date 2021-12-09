# IDT Custcare Automation Framework

IDT Custcare Automation Framework uses Java as main programming language, in combination with Cucumber and Gradle build tool, to create and maintain the Automated Test Scenarios created for Custcare services.

## Getting Started

In order to run and add Test Scenarios it is necessary install Oracle JDK 8.

### For Microsoft Windows operating systems:
##### Install Oracle JDK 8 in Microsoft Windows
1. Download the installer file according to your architecture from:
[Download Oracle JDK 8](http://www.oracle.com/technetwork/java/javase/downloads/index.html)
(Go to the JDK 8 section).
2. Run the downloaded file to start the installation and follow the onscreen instructions.

##### Configure the JAVA_HOME environment variable in Microsoft Windows
1. Locate your **Java installation directory**. E.g:

> C:\Program Files\Java\jdk1.8.0_151

2. Do the following to open **System Properties** options:

> Right click **My Computer** > select **Properties** > **Advanced System Settings**

3. Click the **Environment Variables** button.
4. Under System Variables, click **New**.
5. In the **Variable Name** field, enter:

> JAVA_HOME

6. In the **Variable Value** field, enter your Oracle JDK 8 installation path.
7. Click **OK** and **Apply** changes.

### For GNU/Linux Debian based operating systems:

##### Install Oracle JDK 8 in GNU/Linux Debian
Run the following commands in a GNU/Linux terminal:
1. Add **Oracle's PPA** repository.

> sudo add-apt-repository ppa:webupd8team/java

2. Update the package repository. 

> sudo apt-get update

3. Execute the Oracle Java 8 install command and follow the onscreen instructions.

> sudo apt-get install oracle-java8-installer

### Configuring Git
The version control system used is Git, in order to download the repository it is necessary config the following git global parameters in the git bash console.

> git config --global <span>user.name</span> **"YOUR USERNAME"**

> git config --global user.email **"YOUR@EMAIL<span>.com</span>"**

> ssh-keygen -t rsa -b 4096 -C **"YOUR@EMAIL<span>.com</span>"**

You need to copy and paste the output of the following command to take the newly generated SSH key and add it to your GitHub account.

> cat ~/.ssh/id_rsa.pub

### Cloning Repository
Once configured GitHub with our SSH key what we have to do is **Clone** the repository and start to work with **IDT Custcare** automation framework.

The link for the IDT Custcare Automation Framework repository is:

* [Custare](https://github.com/coretech/custcare-automation.git): It contains the Gradle Multi-project solution with different modules: UI and Core.

## How Run the IDT Custcare Feature Files
There are Gradle tasks that allow run the feature files from the console, it is not necessary have installed Gradle because the project has a Gradle Wrapper. See [Gradle Wrapper](https://docs.gradle.org/current/userguide/gradle_wrapper.html) for more information.

In order to Run the Feature Files, you need to enter to the root project folder and run the following commands in **Windows Command Prompt** or **GNU/Linux terminal**.
   
1. To execute the test scenarios there are possible three options:

	1.1 Execute all test scenarios running the task **executeUIFeatures ** according to a environment parameter:
    
    **For Microsoft Windows:**
    
        gradle.bat clean executeUIFeatures -PenvironmentName="QA" -Pbrowser="CHROME"

    **For GNU/Linux:**

       ./gradlew clean executeUIFeatures -PenvironmentName="QA" -Pbrowser="CHROME"
   
2. The HTML reports generated are located in:
    > custcare-ui/build/allure-report/index.html

## Reference Links
[Cucumber Official Documentation](https://cucumber.io/docs/reference)

[Cucumber JVM](https://cucumber.io/docs/reference/jvm)

[Gradle Official Documentation](https://gradle.org/docs)

[Gradle Cucumber Reporting Plugin](https://github.com/damianszczepanik/cucumber-reporting)

[Gradle Download Plugin](https://github.com/michel-kraemer/gradle-download-task)

[Gradle WSDL Plugin](https://github.com/IntershopCommunicationsAG/wsdl-gradle-plugin)
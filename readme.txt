The DOT503 Project
------------------

This project's aim it to show the supremacy of modern approaches in software development, namely Continuous Integration
along with tools that ensure software quality. Among the tools, that included in this project:

* Gradle -- a swiss-knife for Java developers. It tracks project's dependencies and their versions and comes with a
  bunch of commands that test, build, and run Java applications.
  See more at https://docs.gradle.org/8.8/userguide/userguide.html
* PMD -- a static code analysis tool that parses source code, builds Abstract Syntax Tree (AST), and runs multiple
  checks against the AST to detect violations that may result in decreased performance, security issues, and bugs.
  See more at https://docs.pmd-code.org/latest/index.html
* Spotless -- a Java library that helps to keep your Java code organized and formatted according to a set of rules. It's
  a code formatter that ensures consistency in code style, making it easier to read and maintain.
  See more at https://github.com/diffplug/spotless
* JUnit -- a popular open-source testing framework for Java that allows developers to write and run repeatable tests for
  their Java code, ensuring it meets the required functionality and behavior.
  See more at https://junit.org/junit5/docs/current/user-guide/

Operating Systems
-----------------

This project aims to be run on Linux (including WSL) and, probably, on macOS. It still can be run on Windows with some
limitations, though. For example, instead of using make commands, one will need to call gradlew.bat (see make commands
below).

Dependencies
------------

In your development environment, the following list of tools needs to be installed:

* Java 21+
* Docker
* Make

Clone Project
-------------

To start working with the project, it needs to be cloned on your local computer. To do so we need to execute the
following command in terminal.

git clone git@github.com:white43/DOT503.git

Make Commands
-------------

This project comes with a predefined list of make commands that simplify and streamline the development process, by
hiding underlying gradlew calls for those who is not familiar with Gradle. Windows users are encouraged to run Gradle
commands.

* make self-check (gradlew --version) -- ensures that the main dependencies (Java and Gradle) are installed correctly.
* make code-style-check (gradlew spotlessJavaCheck) -- runs Spotless code style checks. This command only validates code
    style but does not fix found issues.
* make code-style-fix (gradlew spotlessJavaApply) -- runs Spotless code style checks and fixes found issues.
* make static-analysis (gradlew pmdMain) -- runs PMD static analysis tool to detect code violations
* make unit-tests (gradlew test) -- runs JUint testing suite to ensure that code meets the requirements
* make build-jar (gradlew bootJar) -- creates a jar file that contains all the required code dependencies to be run in
    Docker
* make build-image (docker build -t dot503:latest .) -- creates a docker image (see Dockerfile) that can be uploaded to
    a docker registry and run in the production, stage, or development environments
* make run-image (docker run --rm -p 8088:8088 --name dot503 dot503:latest) -- starts a container from the docker image
* make clean (rm -rf ./build/*) -- deletes temporarily files to perform a clean build
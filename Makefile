is_running = $(shell docker ps | grep dot503 | wc -l)

configure-builder:
	ansible-playbook infrastructure/builder/install.yml

configure-jenkins:
	ansible-playbook infrastructure/builder/jenkins.yml

configure-runner:
	ansible-playbook infrastructure/runner/install.yml

self-check:
	./gradlew --version

code-style-check:
	./gradlew spotlessJavaCheck

code-style-fix:
	./gradlew spotlessJavaApply

static-analysis:
	./gradlew pmdMain

unit-tests:
	./gradlew test

build-jar:
	./gradlew bootJar

clean-build-jar: clean unit-tests
	./gradlew :bootJar

build-image:
	docker build -t invidia/dot503:latest .

run-image:
ifneq ($(is_running), 0)
	docker stop dot503
endif

	docker run --rm -p 8088:8088 --name dot503 invidia/dot503:latest

clean:
	rm -rf ./build/*

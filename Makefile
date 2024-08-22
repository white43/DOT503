is_running = $(shell docker ps | grep dot503 | wc -l)

ssh-keys:
	ssh-keygen -t ed25519 -f infrastructure/ssh/dot503 -N ""
	ansible-playbook infrastructure/ssh/upload_to_runner.yml
	ansible-playbook infrastructure/ssh/upload_to_builder.yml

configure-servers:
	ansible-playbook -i infrastructure/common/inventory.ini infrastructure/common/install.yml

configure-jenkins:
	ansible-playbook infrastructure/builder/jenkins.yml

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

push-image:
	docker push invidia/dot503:latest

run-image:
ifneq ($(is_running), 0)
	docker stop dot503
endif

	docker run --rm -p 8088:8088 --name dot503 invidia/dot503:latest

deploy:
	ssh ubuntu@dot503-runner 'docker pull invidia/dot503:latest && docker stop dot503 && docker rm dot503 && docker run -d -p 80:8088 --name dot503 --restart always invidia/dot503:latest'

clean:
	rm -rf ./build/*

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
	docker build -t dot503:latest .

run-image:
	docker run --rm -p 8088:8088 dot503:latest

clean:
	rm -rf ./build/*

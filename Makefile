CONTAINER_NAME = osx-ci-agent

run: clean boot provision

boot:
	docker run --privileged -v `pwd`:/itamae --name $(CONTAINER_NAME) -d -it misumirize/centos7_ruby /bin/bash

provision:
	docker exec $(CONTAINER_NAME) /itamae/bin/provision

test:
	docker exec $(CONTAINER_NAME) /itamae/bin/test

clean:
	-docker stop $(CONTAINER_NAME)
	-docker rm $(CONTAINER_NAME)

.PHONY: run boot provision test clean

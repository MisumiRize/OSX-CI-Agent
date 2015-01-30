CONTAINER_NAME = osx-ci-agent
IMAGE_NAME = misumirize/centos6_ruby

run: clean boot provision

boot:
	docker run -v `pwd`:/itamae --name $(CONTAINER_NAME) -d -it $(IMAGE_NAME) /bin/bash

provision:
	docker exec $(CONTAINER_NAME) /itamae/bin/provision

test:
	docker exec $(CONTAINER_NAME) /itamae/bin/test

clean-test: clean
	docker run -v `pwd`:/itamae --name $(CONTAINER_NAME) $(IMAGE_NAME) /itamae/bin/test-all
	-docker rm $(CONTAINER_NAME)

clean:
	-docker stop $(CONTAINER_NAME)
	-docker rm $(CONTAINER_NAME)

.PHONY: run boot provision test clean clean-test

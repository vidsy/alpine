BRANCH ?= "master"
REPONAME ?= "alpine"
VERSION ?= $(shell cat ./VERSION)

build-image:
	@docker build -t vidsyhq/${REPONAME} .

check-version:
	@echo "=> Checking if VERSION exists as Git tag..."
	(! git rev-list ${VERSION})

docker-hub-login:
	@echo "=> Logging into Docker Hub"
	@docker login -u ${DOCKER_USER} -p ${DOCKER_PASS}

push-tag:
	@echo "=> New tag version: ${VERSION}"
	git checkout ${BRANCH}
	git pull origin ${BRANCH}
	git tag ${VERSION}
	git push origin ${VERSION}

push-to-docker-hub: docker-hub-login
	@docker tag vidsyhq/${REPONAME}:latest vidsyhq/${REPONAME}:${CIRCLE_TAG}
	@docker push vidsyhq/${REPONAME}:${CIRCLE_TAG}
	@docker push vidsyhq/${REPONAME}

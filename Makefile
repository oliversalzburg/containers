infrastructure:
	cd contexts/infrastructure; podman build \
		--build-arg JOBS=24 \
		--build-arg VERSION_AWS_CLI=2.15.23 \
		--build-arg VERSION_PYTHON=3.12.2 \
		--build-arg VERSION_TERRAFORM=1.7.5 \
		.

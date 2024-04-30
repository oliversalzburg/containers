infrastructure:
	cd contexts/infrastructure; podman build \
		--build-arg VERSION_AWS_CLI=2.15.23 \
		--build-arg VERSION_PYTHON=3.12.2 \
		--build-arg VERSION_TERRAFORM=1.8.0 \
		.

lidarr:
	cd contexts/lidarr; podman build \
		--build-arg VERSION_LIDARR=2.1.7.4030 \
		--tag lidarr \
		.
prowlarr:
	cd contexts/prowlarr; podman build \
		--build-arg VERSION_PROWLARR=1.13.3.4273 \
		--tag prowlarr \
		.
radarr:
	cd contexts/radarr; podman build \
		--build-arg VERSION_RADARR=5.3.6.8612 \
		--tag radarr \
		.
sonarr:
	cd contexts/sonarr; podman build \
		--build-arg VERSION_SONARR=4.0.2.1183 \
		--tag sonarr \
		.

ytdl-sub:
	cd contexts/ytdl-sub; podman build \
		--build-arg VERSION_YTDLSUB=2024.4.3 \
		--tag ytdl-sub \
		.

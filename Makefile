infrastructure:
	cd contexts/infrastructure; podman build \
		--build-arg AWS_CLI_VERSION=2.15.23 \
		--build-arg PYTHON_VERSION=3.12.2 \
		--build-arg TERRAFORM_VERSION=1.8.0 \
		.

lidarr:
	cd contexts/lidarr; podman build \
		--build-arg LIDARR_VERSION=2.1.7.4030 \
		--tag lidarr \
		.
prowlarr:
	cd contexts/prowlarr; podman build \
		--build-arg PROWLARR_VERSION=1.13.3.4273 \
		--tag prowlarr \
		.
qbittorrent:
	cd contexts/qbittorrent; podman build \
		--build-arg QBITTORRENT_VERSION=4.6.4 \
		--tag qbittorrent \
		.
run-qbittorrent:
	podman run --interactive --rm --tty --entrypoint bash --volume /tmp:/config \
		qbittorrent
radarr:
	cd contexts/radarr; podman build \
		--build-arg RADARR_VERSION=5.3.6.8612 \
		--tag radarr \
		.
sonarr:
	cd contexts/sonarr; podman build \
		--build-arg SONARR_VERSION=4.0.2.1183 \
		--tag sonarr \
		.

ytdl-sub:
	cd contexts/ytdl-sub; podman build \
		--build-arg YTDLSUB_VERSION=2024.4.3 \
		--tag ytdl-sub \
		.

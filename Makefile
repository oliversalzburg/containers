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
		--build-arg QBITTORRENT_VERSION=5.1.0 \
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

run-whisparr:
	podman run --interactive --rm --tty --entrypoint bash --volume /tmp:/config \
		whisparr
whisparr:
	cd contexts/whisparr; podman build \
		--build-arg WHISPARR_VERSION=2.0.0.1250 \
		--tag whisparr \
		.

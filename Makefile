lidarr:
	cd contexts/lidarr; podman build \
		--build-arg LIDARR_VERSION=3.1.0.4875 \
		--tag lidarr \
		.
nzbget:
	cd contexts/nzbget; podman build \
		--build-arg NZBGET_VERSION=26.1 \
		--tag nzbget \
		.
run-nzbget:
	podman run --interactive --rm --tty --entrypoint bash \
		nzbget
prowlarr:
	cd contexts/prowlarr; podman build \
		--build-arg PROWLARR_VERSION=2.3.5.5327 \
		--tag prowlarr \
		.
qbittorrent:
	cd contexts/qbittorrent; podman build \
		--build-arg QBITTORRENT_VERSION=5.1.4 \
		--tag qbittorrent \
		.
run-qbittorrent:
	podman run --interactive --rm --tty --entrypoint bash --volume /tmp:/config \
		qbittorrent
radarr:
	cd contexts/radarr; podman build \
		--build-arg RADARR_VERSION=6.1.1.10360 \
		--tag radarr \
		.
sonarr:
	cd contexts/sonarr; podman build \
		--build-arg SONARR_VERSION=4.0.17.2952 \
		--tag sonarr \
		.

run-whisparr:
	podman run --interactive --rm --tty --entrypoint bash --volume /tmp:/config \
		whisparr
whisparr:
	cd contexts/whisparr; podman build \
		--build-arg WHISPARR_VERSION=2.2.0-develop.115 \
		--tag whisparr \
		.

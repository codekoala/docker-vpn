USER := $(shell whoami)

image:
	docker build -t codekoala/vpn .

run:
	docker run -d --name vpn --privileged -v $(VPN):/etc/openvpn/vpn.ovpn:ro -v $(HOME):/home/$(USER) codekoala/vpn
	docker exec -it vpn groupadd -f -g `id -g` $(USER)
	docker exec -it vpn useradd -d /home/$(USER) -g `id -g` -Mu `id -u` -s /bin/bash $(USER)

start:
	docker start vpn

logs:
	docker logs -f --tail=50 vpn

stop:
	docker kill vpn

clean: stop
	docker rm vpn

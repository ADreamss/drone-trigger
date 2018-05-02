# Docker image for the dron trigger plugin
#
#     docker build --rm -t plugins/drone-trigger .

FROM alpine:3.5

WORKDIR /root

RUN apk update && apk add curl && apk add bash \
 	&& curl -L https://github.com/drone/drone-cli/releases/download/v0.7.0/drone_linux_amd64.tar.gz | tar zx \
	&& cp drone /usr/local/bin

COPY wrapper.sh /root/wrapper.sh

RUN chmod +x /root/wrapper.sh

ENTRYPOINT ["/root/wrapper.sh"] 	
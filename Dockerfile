FROM helpsystems/goanywhere-gateway:2.8.4@sha256:7c7dfdfa99eae48f72c574c3092694da57469d1812594200ba9b7e1818958697 as gettheinstaller
FROM centos:8.4.2105@sha256:a27fd8080b517143cbbbab9dfb7c8571c40d67d534bbdee55bd6c473f432b177 as build
RUN \
  useradd -u 1000 gateway && \
  yum install -y dejavu-lgc-sans-fonts && \
  ln -s /usr/share/fonts/dejavu /usr/share/fonts/dejavu-lgc

COPY --from=gettheinstaller --chmod=0755 /gagateway_linux_x64.sh ./installer.sh

RUN ./installer.sh -q \
  -Vgagateway.controllerAddress=0.0.0.0 \
  -Vgagateway.dataAddress=0.0.0.0 \
  -Vgagateway.proxyAddress=0.0.0.0 \
  -Vgagateway.passiveProxyAddress=0.0.0.0 \
  -Vgagateway.activeProxyAddress=0.0.0.0 \
  -Vgagateway.internalUdpAddress=0.0.0.0 \
  -Vgagateway.externalUdpAddress=0.0.0.0 && \
  chown -R gateway /usr/local/HelpSystems/GoAnywhere_Gateway

WORKDIR /usr/local/HelpSystems/GoAnywhere_Gateway
COPY config/* config/

USER gateway

CMD ["./bin/gagatewayd", "start-launchd"]

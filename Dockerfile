FROM helpsystems/goanywhere-gateway:2.8.3 as gettheinstaller 
FROM centos:8.4.2105 as build
RUN \
  useradd -u 1000 gateway && \
  yum install -y dejavu-lgc-sans-fonts && \
  ln -s /usr/share/fonts/dejavu /usr/share/fonts/dejavu-lgc

COPY --from=gettheinstaller --chmod=0755 gagateway_linux_x64.sh ./installer.sh

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

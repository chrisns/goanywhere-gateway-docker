FROM centos:8.4.2105 as build
RUN \
  yum install -y dejavu-lgc-sans-fonts && \
  ln -s /usr/share/fonts/dejavu /usr/share/fonts/dejavu-lgc
COPY  --chmod=0755 installer.sh /
RUN ./installer.sh -q \
  -Vgagateway.controllerAddress=0.0.0.0 \
  -Vgagateway.dataAddress=0.0.0.0 \
  -Vgagateway.proxyAddress=0.0.0.0 \
  -Vgagateway.passiveProxyAddress=0.0.0.0 \
  -Vgagateway.activeProxyAddress=0.0.0.0 \
  -Vgagateway.internalUdpAddress=0.0.0.0 \
  -Vgagateway.externalUdpAddress=0.0.0.0

WORKDIR /usr/local/HelpSystems/GoAnywhere_Gateway
COPY config/* config/

CMD ["./bin/gagatewayd", "start-launchd"]

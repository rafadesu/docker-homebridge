FROM oznu/s6-node:8.9.4

RUN apk add --no-cache git python make g++ avahi-compat-libdns_sd avahi-dev dbus \
  && chmod 4755 /bin/ping \
  && mkdir /homebridge

ENV HOMEBRIDGE_VERSION=0.4.38
RUN npm install -g --unsafe-perm homebridge@${HOMEBRIDGE_VERSION}

ENV CONFIG_UI_VERSION=2.6.2
RUN npm install -g --unsafe-perm homebridge-config-ui-x@${CONFIG_UI_VERSION}

WORKDIR /homebridge
VOLUME /homebridge

COPY root /

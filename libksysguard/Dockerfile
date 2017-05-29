FROM afiestas/centos-tier2

COPY build-framework.sh /usr/bin/build-framework

RUN source /env.sh && build-framework libksysguard && rm -rf /kf5

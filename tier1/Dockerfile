FROM afiestas/centos-qt

COPY list /list
COPY deps /deps
COPY env.sh /
COPY build-framework.sh /usr/bin/build-framework

RUN cat /env.sh >> /root/.bashrc

RUN yum -y install $(cat /deps)

RUN source /env.sh && build-framework extra-cmake-modules && rm -rf /kf5
RUN source /env.sh && build-framework attica && rm -rf /kf5
RUN source /env.sh && build-framework bluez-qt && rm -rf /kf5
RUN source /env.sh && build-framework breeze-icons && rm -rf /kf5
RUN source /env.sh && build-framework kapidox && rm -rf /kf5
RUN source /env.sh && build-framework karchive && rm -rf /kf5
RUN source /env.sh && build-framework kcodecs && rm -rf /kf5
RUN source /env.sh && build-framework kconfig && rm -rf /kf5
RUN source /env.sh && build-framework kcoreaddons && rm -rf /kf5
RUN source /env.sh && build-framework kdbusaddons && rm -rf /kf5
RUN source /env.sh && build-framework kdnssd && rm -rf /kf5
RUN source /env.sh && build-framework kguiaddons && rm -rf /kf5
RUN source /env.sh && build-framework ki18n && rm -rf /kf5
RUN source /env.sh && build-framework kidletime && rm -rf /kf5
RUN source /env.sh && build-framework kitemmodels && rm -rf /kf5
RUN source /env.sh && build-framework kitemviews && rm -rf /kf5
RUN source /env.sh && build-framework kplotting && rm -rf /kf5
RUN source /env.sh && build-framework syntax-highlighting && rm -rf /kf5
RUN source /env.sh && build-framework kwidgetsaddons && rm -rf /kf5
RUN source /env.sh && build-framework kwindowsystem && rm -rf /kf5
RUN source /env.sh && build-framework prison && rm -rf /kf5
RUN source /env.sh && build-framework solid && rm -rf /kf5
RUN source /env.sh && build-framework sonnet && rm -rf /kf5
RUN source /env.sh && build-framework threadweaver && rm -rf /kf5

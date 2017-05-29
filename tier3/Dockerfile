FROM afiestas/centos-tier2

COPY deps /deps
COPY env.sh /
COPY build-framework.sh /usr/bin/build-framework

RUN cat /env.sh >> /root/.bashrc

RUN yum -y install $(cat /deps)

RUN source /env.sh && build-framework gpgmepp && rm -rf /kf5
RUN source /env.sh && build-framework kconfigwidgets && rm -rf /kf5
RUN source /env.sh && build-framework kiconthemes && rm -rf /kf5
RUN source /env.sh && build-framework kservice && rm -rf /kf5
RUN source /env.sh && build-framework kdesu && rm -rf /kf5
RUN source /env.sh && build-framework kemoticons && rm -rf /kf5
RUN source /env.sh && build-framework ktextwidgets && rm -rf /kf5
RUN source /env.sh && build-framework kwallet && rm -rf /kf5
RUN source /env.sh && build-framework kglobalaccel && rm -rf /kf5
RUN source /env.sh && build-framework ktextwidgets && rm -rf /kf5
RUN source /env.sh && build-framework kxmlgui && rm -rf /kf5
RUN source /env.sh && build-framework kbookmarks && rm -rf /kf5
RUN source /env.sh && build-framework kio && rm -rf /kf5
RUN source /env.sh && build-framework kinit && rm -rf /kf5
RUN source /env.sh && build-framework kded && rm -rf /kf5
RUN source /env.sh && build-framework kxmlrpcclient && rm -rf /kf5
RUN source /env.sh && build-framework knotifyconfig && rm -rf /kf5
RUN source /env.sh && build-framework knewstuff && rm -rf /kf5
RUN source /env.sh && build-framework kdeclarative && rm -rf /kf5
RUN source /env.sh && build-framework kcmutils && rm -rf /kf5
RUN source /env.sh && build-framework baloo && rm -rf /kf5
RUN source /env.sh && build-framework kparts && rm -rf /kf5
RUN source /env.sh && build-framework kdewebkit && rm -rf /kf5
RUN source /env.sh && build-framework ktexteditor && rm -rf /kf5
RUN source /env.sh && build-framework libksysguard && rm -rf /kf5

FROM afiestas/centos-tier1

COPY list /list
COPY deps /deps
COPY env.sh /
COPY build-framework.sh /usr/bin/build-framework

RUN cat /env.sh >> /root/.bashrc

RUN yum -y install $(cat /deps)

RUN source /env.sh && build-framework kpty && rm -rf /kf5
RUN source /env.sh && build-framework kunitconversion && rm -rf /kf5
RUN source /env.sh && build-framework kpackage && rm -rf /kf5
RUN source /env.sh && build-framework knotifications && rm -rf /kf5
RUN source /env.sh && build-framework kjobwidgets && rm -rf /kf5
RUN source /env.sh && build-framework kimageformats && rm -rf /kf5
RUN source /env.sh && build-framework kfilemetadata && rm -rf /kf5
RUN source /env.sh && build-framework kdoctools && rm -rf /kf5
RUN source /env.sh && build-framework kcrash && rm -rf /kf5
RUN source /env.sh && build-framework kcompletion && rm -rf /kf5
RUN source /env.sh && build-framework kauth && rm -rf /kf5


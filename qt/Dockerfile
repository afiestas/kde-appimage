FROM centos:6.8

#Mostly dependencies to build Qt
RUN yum -y update && yum -y install wget && yum -y install centos-release-scl epel-release && yum -y update && yum -y install devtoolset-4-gcc devtoolset-4-gcc-c++ devtoolset-4-binutils wget tar bzip2 git libtool which fuse fuse-devel libpng-devel automake cppunit-devel cmake glibc-headers libstdc++-devel gcc-c++ freetype-devel fontconfig-devel libxml2-devel libstdc++-devel libXrender-devel patch xcb-util-keysyms-devel libXi-devel libudev-devel.x86_64 openssl-devel sqlite-devel.x86_64 gperftools.x86_64 gperf.x86_64 libicu-devel.x86_64 boost-devel.x86_64 libxslt-devel.x86_64 docbook-style-xsl.noarch python27.x86_64 cmake3.x86_64 ruby bison flex bison-devel ruby-devel flex-devel xz pcre-devel pcre2-devel pcre pcre2 mesa-libEGL-devel mesa-libGL-devel glib-devel gettext perl-URI.noarch bzip2-devel.x86_64 subversion-devel.x86_64 subversion.x86_64 sqlite2-devel.x86_64 vim sudo

#Building Qt
RUN echo ". /opt/rh/devtoolset-4/enable && chmod +x /opt/rh/python27/enable && . /opt/rh/python27/enable" >> /root/.bashrc

ENV LC_ALL=en_US.UTF-8 LANG=en_us.UTF-8 QTVERSION=5.7.1 QVERSION_SHORT=5.7 LLVM_ROOT=/opt/llvm/ QTV=5.7.1 LD_LIBRARY_PATH=$QTDIR/lib/
ENV QTDIR=/usr/local/Qt-${QTVERSION}/

RUN mkdir -p /qt && cd /qt && \
    wget http://download.qt.io/archive/qt/${QVERSION_SHORT}/${QTVERSION}/single/qt-everywhere-opensource-src-${QTVERSION}.tar.xz && \
    tar xvf qt-everywhere-opensource-src-${QTVERSION}.tar.xz && \
    ln -sf /opt/rh/devtoolset-4/root/usr/bin/g++ /usr/bin/g++ && \
    ln -sf /opt/rh/devtoolset-4/root/usr/bin/c++ /usr/bin/c++ && \
    cd /qt/qt-everywhere-opensource-src-$QTV && \
    ./configure -v -skip qtgamepad -platform linux-g++ -qt-pcre -qt-xcb -qt-xkbcommon -xkb-config-root /usr/share/X11/xkb -no-pch -qt-sql-sqlite -qt-sql-sqlite2 -confirm-license -opensource && \
    make -j 8 || make -j 1 install; make -j8 install && \
    rm -Rf /qt

RUN ln -sf /usr/local/Qt-$QTV/bin/qmake /usr/bin/qmake-qt5 && \
    mkdir -p /qtwk && cd /qtwk && \
    wget http://download.qt.io/community_releases/${QVERSION_SHORT}/${QTV}/qtwebkit-opensource-src-${QTV}.tar.xz && \
    tar xvf qtwebkit-opensource-src-${QTV}.tar.xz && \
    cd /qtwk/qtwebkit-opensource-src-${QTV} && \
    $QTDIR/bin/qmake && make -j8 || make -j8 && make -j8 install && \
    rm -Rf /qtwk

CMD /bin/bash

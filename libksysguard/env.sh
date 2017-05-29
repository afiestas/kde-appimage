export QTVERSION=5.7.1
export QVERSION_SHORT=5.7
export QTDIR=/usr/local/Qt-${QTVERSION}/

export LC_ALL=en_US.UTF-8
export LANG=en_us.UTF-8

export CMAKE_PREFIX_PATH=$QTDIR:/frameworks/share/

export LD_LIBRARY_PATH=/usr/lib64/:/usr/lib:/frameworks/lib64:$QTDIR/lib/:$LD_LIBRARY_PATH

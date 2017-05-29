#Taken from kdevelop/appimage, it should be GPL 2 or greater

# start building the deps
function frameowkr_failed
{
    echo "$1 -- $2" >> /failed
    
    exit 1
}

function build_framework
{ (
    SRC=/kf5
    BUILD=/kf5/build
    PREFIX=/frameworks/
    EXTRA_CMAKE_OPTIONS=""

    # framework
    FRAMEWORK=$1

    # clone if not there
    mkdir -p $SRC
    cd $SRC
    if ( test -d $FRAMEWORK )
    then
        echo "$FRAMEWORK already cloned"
        cd $FRAMEWORK 
        git stash
        git reset --hard
        git checkout master
        git pull --rebase
        git fetch --tags
        cd ..
    else
        if [ "$FRAMEWORK" = "libksysguard" ]; then
            git clone --depth 1 --branch plasma-optional https://github.com/afiestas/libksysguard.git
            EXTRA_CMAKE_OPTIONS="$EXTRA_CMAKE_OPTIONS -DCMAKE_CXX_FLAGS=-lrt"
        else
            git clone git://anongit.kde.org/$FRAMEWORK
        fi
    fi

    cd $FRAMEWORK
    git checkout $KF5_VERSION || git checkout $KDE_APPLICATION_VERSION
    git stash pop || true
    cd ..
    if [ "$FRAMEWORK" = "kwallet" ]; then
        EXTRA_CMAKE_OPTIONS="$EXTRA_CMAKE_OPTIONS -DBUILD_KWALLETD=Off"
    fi

    if [ "$FRAMEWORK" = "knotifications" ]; then
    cd $FRAMEWORK
        echo "patching knotifications"
    git reset --hard
    cat > no_phonon.patch << EOF
diff --git a/CMakeLists.txt b/CMakeLists.txt
index b97425f..8f15f08 100644
--- a/CMakeLists.txt
+++ b/CMakeLists.txt
@@ -59,10 +59,10 @@ find_package(KF5Config ${KF5_DEP_VERSION} REQUIRED)
 find_package(KF5Codecs ${KF5_DEP_VERSION} REQUIRED)
 find_package(KF5CoreAddons ${KF5_DEP_VERSION} REQUIRED)
 
-find_package(Phonon4Qt5 4.6.60 REQUIRED NO_MODULE)
+find_package(Phonon4Qt5 4.6.60 NO_MODULE)
 set_package_properties(Phonon4Qt5 PROPERTIES
    DESCRIPTION "Qt-based audio library"
-   TYPE REQUIRED
+   TYPE OPTIONAL
    PURPOSE "Required to build audio notification support")
 if (Phonon4Qt5_FOUND)
   add_definitions(-DHAVE_PHONON4QT5)
EOF
    cat no_phonon.patch |patch -p1
    cd ..
    fi

    # create build dir
    mkdir -p $BUILD/$FRAMEWORK

    # go there
    cd $BUILD/$FRAMEWORK

    # cmake it
    cmake3 $SRC/$FRAMEWORK -DBUILD_TESTING=OFF -DCMAKE_INSTALL_PREFIX:PATH=$PREFIX $EXTRA_CMAKE_OPTIONS $2 || frameowkr_failed $FRAMEWORK cmake
    

    # make
    make -j$(nproc) || frameowkr_failed $FRAMEWORK make

    # install
    make install || frameowkr_failed $FRAMEWORK make_install
) }

build_framework $1


#!/bin/sh

CWD=`pwd`
PACKAGES_RELATIVE_PATH="packages"
PACKAGES_DIR="$CWD/$PACKAGES_RELATIVE_PATH"
FVM=''

cleanAll() {
    $FVM flutter clean

    for d in $(ls $PACKAGES_DIR)
    do
        PACKAGE_DIR="$PACKAGES_DIR/$d"
        echo "Entering $PACKAGES_RELATIVE_PATH/$d"
        cd $PACKAGE_DIR && $FVM flutter clean
    done
}

case $1 in
    --useFvm)
        FVM='fvm'
        getAll
        ;;
    *)
        getAll
        ;;
esac
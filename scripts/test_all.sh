#!/bin/sh

CWD=`pwd`
PACKAGES_RELATIVE_PATH="packages"
PACKAGES_DIR="$CWD/$PACKAGES_RELATIVE_PATH"
FVM=''

testAll() {
    $FVM flutter test || exit 1

    for d in $(ls $PACKAGES_DIR); do
        PACKAGE_DIR="$PACKAGES_DIR/$d"
        echo "Entering $PACKAGES_RELATIVE_PATH/$d"
        cd $PACKAGE_DIR
        if [ -d "test" ]; then
            $FVM flutter test || exit 1
        fi
    done
}

case $1 in
    --useFvm)
        FVM='fvm'
        testAll
        ;;
    *)
        testAll
        ;;
esac
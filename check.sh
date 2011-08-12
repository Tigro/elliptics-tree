#!/bin/sh

LAST_VERSION=`find /repo/yandex-lucid/ -name "elliptics_*.changes" -exec basename {} \; | awk -F_ '{ print $1"_"$2 }' | sort -uVr | head -n1`
CURRENT_VERSION=`cat /home/ashejn/elliptics-tree/elliptics-version`

if [ "$LAST_VERSION" != "$CURRENT_VERSION" ]; then
    cd /home/ashejn/elliptics-tree
    echo $LAST_VERSION > elliptics-version
    git commit elliptics-version -m "update version to $LAST_VERSION"
    git push
fi

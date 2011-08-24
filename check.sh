#!/bin/sh

LAST_VERSION=`find /repo/yandex-lucid/ -name "elliptics-2.10_*.changes" -exec basename {} \; | awk -F_ '{ print $1"_"$2 }' | sort -uVr | head -n1`
CURRENT_VERSION=`cat /home/ashejn/elliptics-tree/elliptics-version`

if [ "$LAST_VERSION" != "$CURRENT_VERSION" ]; then
    cd /home/ashejn/elliptics-tree
    echo $LAST_VERSION > elliptics-version
    git commit elliptics-version -m "update version to $LAST_VERSION"
    git push
fi

LAST_VERSION=`find /repo/yandex-lucid/ -name "eblob_*.changes" -exec basename {} \; | awk -F_ '{ print $1"_"$2 }' | sort -uVr | head -n1`
CURRENT_VERSION=`cat /home/ashejn/elliptics-tree/eblob-version`

if [ "$LAST_VERSION" != "$CURRENT_VERSION" ]; then
    cd /home/ashejn/elliptics-tree
    echo $LAST_VERSION > eblob-version
    git commit eblob-version -m "update version to $LAST_VERSION"
    git push
fi

LAST_VERSION=`find /repo/yandex-lucid/ -name "elliptics-fastcgi_*.changes" -exec basename {} \; | awk -F_ '{ print $1"_"$2 }' | sort -uVr | head -n1`
CURRENT_VERSION=`cat /home/ashejn/elliptics-tree/elliptics-fastcgi-version`

if [ "$LAST_VERSION" != "$CURRENT_VERSION" ]; then
    cd /home/ashejn/elliptics-tree
    echo $LAST_VERSION > elliptics-fastcgi-version
    git commit elliptics-fastcgi-version -m "update version to $LAST_VERSION"
    git push
fi

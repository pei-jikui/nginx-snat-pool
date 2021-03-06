#!/bin/bash
#tgtdir=/Users/`whoami`/nginx
tgtdir=/usr/local/nginx
cdir=`cd $(dirname $0); pwd`
(
    #cd $cdir/nginx-1.16.1
    cd $cdir
    set -e
    for option; do
        case $option in
            conf*)
                # ./configure --prefix=$tgtdir
                #./configure --with-debug --with-stream --with-stream_ssl_module --with-cc=/usr/bin/cc --with-cc-opt='-O0 -g' --prefix=$tgtdir 
                ./configure --with-debug --with-http_ssl_module --with-stream --add-module=../njs/nginx --with-cc=/usr/bin/cc --with-cc-opt='-O0 -g' --prefix=$tgtdir 
                ;;
            make)
                #bear make
                make
                ;;
            install)
                make install
                ;;
            clean)
                make clean
                ;;
            *)
                echo "$0 [conf[igure]|make|install|clean]"
                ;;
        esac
    done
    set +e
)

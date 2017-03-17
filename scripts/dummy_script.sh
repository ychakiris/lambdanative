#!/bin/sh

. ./package.sh
. ./assert.sh

evallog="temp.log"
SYS_AR=ar
SYS_PREFIX="."

package_make_fake_static_lib "test_lib"
asserterror $? "could not create fake library"

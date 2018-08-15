#!/usr/bin/env /bin/bash

#
# pre-reqs: successfull build of eosio/eos$ ./eosio_build.sh
# $ cd deveos/libraries
# $ git clone https://github.com/EOSIO/fc.git
#
# config, build and run tests:
# $ cd deveos
# $ EOSIO_EOS_SRC_DIR=/home/infinidi/src/github.com/infinidi/eos BOOST_ROOT_DIR=/home/infinidi/opt/boost ./build.sh
# $ cat Testing/Temporary/LastTest.log # quick check

#
# change here to run with ./build.sh only
#
EOSIO_EOS_SRC_DIR=${EOSIO_EOS_SRC_DIR-/home/infinidi/src/github.com/infinidi/eos}
BOOST_ROOT_DIR=${BOOST_ROOT_DIR-/home/infinidi/opt/boost}

echo EOSIO_EOS_SRC_DIR=${EOSIO_EOS_SRC_DIR}
echo BOOST_ROOT_DIR=${BOOST_ROOT_DIR}

##
## CMAKE
##
rm ./CMakeCache.txt;
cmake -DCMAKE_MODULE_PATH=${EOSIO_EOS_SRC_DIR}/libraries/fc/CMakeModules -DBOOST_ROOT=${BOOST_ROOT_DIR} .

##
## BUILD
##
make

##
## TEST
##
## default is error: https://www.boost.org/doc/libs/1_60_0/libs/test/doc/html/boost_test/utf_reference/rt_param_reference/log_level.html
BOOST_TEST_LOG_SINK=./deveosTest.log BOOST_TEST_LOG_LEVEL=message make test
cat ./deveosTest.log

##
## CLEAN
##
#make clean

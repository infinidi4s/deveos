# deveos - build and test outside eosio/eos tree
#### for eosio/eos development outside the main source tree

## prerequisites
```
eos$ ./eosio_build.sh 
eos$ cd ..
$ git clone https://github.com/infinidi/deveos.git 
$ cd deveos/libraries
libraries$ git clone https://github.com/EOSIO/fc.git
```

## config, build and run tests
```
# example, change vars for env
deveos$ EOSIO_EOS_SRC_DIR=/home/infinidi/src/github.com/infinidi/eos BOOST_ROOT_DIR=/home/infinidi/opt/boost ./build.sh
deveos$ cat Testing/Temporary/LastTest.log # quick check test output 
```

## further customization
* edit ```deveos/build.sh```

#### *branch*: deveos:dev-eosio-fc-submodule (example)
#### submodule of the eosio/fc
```
$ git clone https://github.com/infinidi/deveos.git
$ cd deveos
deveos$ git branch -v -a
deveos$ git checkout -b dev-eosio-fc-submodule remotes/origin/dev-eosio-fc-submodule
deveos$ git submodule update --init --recursive
deveos$ EOSIO_EOS_SRC_DIR=/home/infinidi/src/github.com/infinidi/eos BOOST_ROOT_DIR=/home/infinidi/opt/boost ./build.sh
```

#### *branch*: deveos:dev-infnidi-fc-submodule, fc:dev-custom-prefix (example)
#### submodule and fc branch that have a custom runner
see ```libraries/fc/test/crypto/test_deveos_cypher_suite.cpp and CMakeLists.txt files```
```
$ git clone https://github.com/infinidi/deveos.git
$ cd deveos
deveos$ git branch -v -a
deveos$ git checkout -b dev-infinidi-fc-submodule remotes/origin/dev-infinidi-fc-submodule
deveos$ git submodule update --init --recursive
deveos$ cd libraries/fc
fc$ git checkout remotes/origin/dev-custom-prefix
fc$ cd ../../
deveos$ EOSIO_EOS_SRC_DIR=/home/infinidi/src/github.com/infinidi/eos BOOST_ROOT_DIR=/home/infinidi/opt/boost ./build.sh
```
#### I'll be linking more libraries besides fc as well as custom test runners, please feel free to open issues and contribute!

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

#### I'll be linking more libraries besides fc as well as custom test runners, please feel free to open issues and contribute!

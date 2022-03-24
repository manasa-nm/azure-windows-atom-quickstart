All the files under atom/test are used to run the automated testing that is needed when requesting that an offering becomes
public.  To run the testing do the following (the tests will take a long time to run):

$ docker run -v ${HOME}:/root -it azuresdk/azure-cli-python:0.2.8

#these are run within the docker container
$ az login
$ cd <azuremkpl-git-dir>/atom/tests
$ ./runTests.sh

#these are run on your host machine because you need the zip command (not docker)
$ cd <azuremkpl-git-dir>/atom/tests
$ cd logs
$ zip ../logs.zip *

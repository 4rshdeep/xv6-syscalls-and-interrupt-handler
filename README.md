# Operating Systems Course
* Contains modification on the xv6 operating system, with the following additions to it.
* Several system calls added for listing current processes etc.
* Added Inter Process communication models, both unicast and multicast.
* Added system calls for registering signal handlers for the user programs and signaling between processes, used in multicast model for IPC.
* Futher details can be found [here](https://github.com/4rshdeep/xv6-syscalls-and-interrupt-handler/blob/master/report.pdf)

## Testing
* Several user programs have been added for the purpose of testing. Run following for running all the tests on the modified xv6. 
```cd tests 
bash ./tests/master_test.sh``` 


# Unit test
For test target libraries are compiled using lipo including targets 
arm64SIM and x86_64SIM
It's quite enough to run tests localy on this architectures, plus
run test on GithubActions

#Distributing library
Universal library should produce the *.xcframework file which 
will include 
* ios-arm64 with arm64_device OpenSSL libs
* ios-arm64-simulator with arm64_sim/x86_sim OpenSSL libs
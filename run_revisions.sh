#!/bin/sh

./run_ekstazi.sh -u "https://github.com/JodaOrg/joda-time.git" -p "joda" -r "8612f9e,9a62b06,8612f9e,d0514b4,f36072e"


./run_ekstazi.sh -u "http://svn.apache.org/repos/asf/commons/proper/math/trunk/" -p "commons-math" -r "r1604648,r1604651,r1604648,r1613723,r1615790"

./run_ekstazi.sh -u "http://svn.apache.org/repos/asf/commons/proper/lang/trunk" -p "commons-lang" -r "r1620574,r1620579,r1620574,r1632874,r1633907"

./run_ekstazi.sh -u "http://svn.apache.org/repos/asf/gora/trunk/" -p "gora" -s "2.15" -r "r1558595,r1559591,r1558595,r1588039,r1588717"

patch run_ekstazi.sh < patch_jgit.txt
./run_ekstazi.sh -u "https://git.eclipse.org/r/p/jgit/jgit.git" -p "jgit" -v "4.2.0" -s "2.18" -r "6189a68,543c523,6189a68,0e8f3a6,bf33a6e"
patch -R run_ekstazi.sh < patch_jgit.txt

./run_ekstazi.sh -u "http://svn.apache.org/repos/asf/commons/proper/configuration/trunk" -p "commons-config" -r "r1629051,r1629231,r1629051,r1636041,r1636042"


./run_ekstazi.sh -u "http://svn.apache.org/repos/asf/commons/proper/pool/trunk" -p "pool" -r "r1622088,r1622089,r1622088,r1629510,r1629515"

./run_ekstazi.sh -u "http://svn.apache.org/repos/asf/commons/proper/collections/trunk" -p "commons-col" -r "r1635348,r1635351,r1586477,r1592882,r1592893"

./run_ekstazi.sh -u "https://github.com/zxing/zxing.git"  -p "zxing" -s "2.18" -r "e061224,d40c755,e061224,02a6347,0d81afb"

patch run_ekstazi.sh < patch_log4j.txt
./run_ekstazi.sh -u "http://svn.apache.org/repos/asf/logging/log4j/trunk/" -p "log4j" -v "4.2.0" -s "2.15" -r "r1344103,r1344108,r1344103,r1567107,r1567108"
patch -R run_ekstazi.sh < patch_log4j.txt

./run_ekstazi.sh -u "https://github.com/google/closure-compiler.git" -p "closure" -d "1" -r "6a1f2d7,0fc234b,f4f8708,6a1f2d7,0fc234b"

./run_ekstazi.sh -u "http://svn.apache.org/repos/asf/chukwa/trunk/" -p "chukwa" -s "2.13" -r "r1611855,r1611856,r1616998,r1631229,r1631276"


./run_ekstazi.sh -u "https://github.com/cucumber/cucumber-jvm.git" -p "cucumber" -v "4.2.0" -r "5df09f85,950814fb,77a93d1f,3739de85,b67c24c6"


./run_ekstazi.sh -u "https://code.google.com/p/guava-libraries/" -p "guava" -m "guava-tests" -r "af2232f5,0d41d891,e0fe72fe,a3d831ce,a4d5ada2"

./run_ekstazi.sh -u "https://github.com/netty/netty/" -p "netty" -s "2.15" -d "1" -r "c40b0d2e07a44e35cc9ee2453c1f2ef8ff87cd23,d6c3b3063fc367791dbddb76220110d864e5c5f8,9465db25bac6758a4c32aec73080c5937faddf9f,3868645d7d3e8494a21a4f3348a5ad2d3dcccb2a,c8a1d077b50952e0c8b4dde67ddc7fc8b98308b1"

./run_ekstazi.sh -u "https://github.com/apache/phoenix"  -p "phoenix" -r "83b5bb4fa4b41510510e5be45142670ed01ec71b,d448417d99d0ed93d285652b2bdb4c144de5bc56,300edd0b523638461e1dd09f191d666136ec715e,5363c989a0f5b9876d3153355664760f164776a4,fbbb43bf799cb08fba3117766a989c28e21c03f9"


./run_ekstazi.sh -u "https://github.com/apache/tika" -p "tika" -s "2.15" -r "5b94935904ab4983a2d31dace797a910a38c803e,8ae1ff211e51d158b229b3d0949541e60196eef6,0088bb89812750fe5fc2763aa30ff78162f70b57,b480dd9027715ab4ae7543e008cd3092f1151c14,805d5b0526b80936930b1bfe65e3a0ac2407c268"


patch run_ekstazi.sh < patch_gs.txt
./run_ekstazi.sh -u "https://github.com/goldmansachs/gs-collections.git" -p "gsachs" -s "2.15" -v "3.4.2" -r "8e9aaf68b2c6f9fc5a1c998b3a1dbef9a8ea4291,78388e44a347493fce6102a09c63e0366a02c063,bd63936dcfc1c0e937ad92bc09f36b74dffe798c,526bddbb35ab4db38c4536bc7778a9828bb01683,75094c0fac9886eeb5a9bfc127f867f761ed7ef4"
patch -R run_ekstazi.sh < patch_gs.txt

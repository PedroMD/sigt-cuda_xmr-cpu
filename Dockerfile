FROM pdiogo/eth-cuda-xmr-cpu:v0.21-monero-barb

RUN apt-get update && apt-get upgrade -y

RUN apt-get install gcc autoconf automake -y

# forked ccminer with signatum support for Tesla K80 GPU only
RUN git clone https://github.com/PedroMD/ccminer.git \
	&& cd ccminer \
	&& chmod +x autogen.sh configure.sh build.sh \
	&& sh autogen.sh && sh configure.sh && sh build.sh \ 
	&& cp ccminer /usr/bin/ccminer

COPY sigt-cuda-and-xmr-cpu_miners.sh /sigt-cuda-and-xmr-cpu_miners.sh 

COPY Dockerfile /Dockerfile

RUN chmod +x /sigt-cuda-and-xmr-cpu_miners.sh

ENTRYPOINT ["/sigt-cuda-and-xmr-cpu_miners.sh"]

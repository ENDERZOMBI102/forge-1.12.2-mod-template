FROM gitpod/workspace-full-vnc:latest
ARG DEBIAN_FRONTEND=noninteractive
USER root

RUN brew install gradle
# set system java wrapper for openjdk
RUN sudo ln -sfn /home/linuxbrew/.linuxbrew/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
# add the jdk to the path
RUN echo 'export PATH="/home/linuxbrew/.linuxbrew/opt/openjdk/bin:$PATH"' >> ~/.bash_profile
# for c/c++ compilers (because yes)
RUN export CPPFLAGS="-I/home/linuxbrew/.linuxbrew/opt/openjdk/include"
# remove all apt tmp and list files
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/*
# if there's already a shell, clear it
RUN clear


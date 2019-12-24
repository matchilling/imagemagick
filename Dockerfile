FROM centos:centos7

MAINTAINER Mathias Schilling <m@matchilling.com>

ENV IMAGEMAGICK_VERSION="7.0.9-10"
ENV IMAGEMAGICK_LIB_RPM_URL="https://imagemagick.org/download/linux/CentOS/x86_64/ImageMagick-libs-${IMAGEMAGICK_VERSION}.x86_64.rpm"
ENV IMAGEMAGICK_RPM_URL="https://imagemagick.org/download/linux/CentOS/x86_64/ImageMagick-${IMAGEMAGICK_VERSION}.x86_64.rpm"

RUN curl -s -S "https://download-ib01.fedoraproject.org/pub/epel/7/x86_64/Packages/l/libraqm-0.7.0-1.el7.x86_64.rpm" -o libraqm.rpm && \
    curl -s -S $IMAGEMAGICK_LIB_RPM_URL -o imagemagick-lib.rpm && \
    curl -s -S $IMAGEMAGICK_RPM_URL -o imagemagick.rpm

RUN yum -y update && \
    yum localinstall -y libraqm.rpm imagemagick*.rpm && \
    rm -f imagemagick*.rpm && \
    yum clean all

#!/bin/echo docker build . -f
# -*- coding: utf-8 -*-
#{ 
# Copyright 2018-present Samsung Electronics Co., Ltd. and other contributors
# 
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
# 
#      http://www.apache.org/licenses/LICENSE-2.0
# 
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#}

FROM ubuntu:18.04
MAINTAINER Philippe Coval (rzr@users.sf.net)

ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL en_US.UTF-8
ENV LANG ${LC_ALL}

RUN echo "#log: Configuring locales" \
  && set -x \
  && apt-get update -y \
  && apt-get install -y locales \
  && echo "${LC_ALL} UTF-8" | tee /etc/locale.gen \
  && locale-gen ${LC_ALL} \
  && dpkg-reconfigure locales \
  && sync

ENV project iotjs-async

RUN echo "#log: ${project}: Setup system" \
  && set -x \
  && apt-get update -y \
  && apt-get install -y iotjs git \
  && apt-get install -y npm \
  && apt-get clean \
  && sync

ADD . /usr/local/opt/${project}/src/${project}
WORKDIR /usr/local/opt/${project}/src/${project}
RUN echo "#log: ${project}: Preparing sources" \
  && set -x \
  && npm test \
  && make test \
  && sync

WORKDIR /usr/local/opt/${project}/src/${project}
ENTRYPOINT [ "/usr/bin/env", "make" ]
CMD [ "test" ]

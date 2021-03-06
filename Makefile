#!/bin/make -f
# -*- makefile -*-
# SPDX-License-Identifier: Apache-2.0
#{
# Copyright 2018-present Samsung Electronics France
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#}

default: all
	@echo "log: $@: $^"

project?=iotjs-async
tmp_dir ?= tmp
runtime ?= iotjs
export runtime
eslint ?= node_modules/eslint/bin/eslint.js
srcs_dir ?= .
srcs ?= $(wildcard *.js */*.js | sort | uniq)
main_src ?= example/index.js
test_src ?= ${main_src}

iotjs_modules_dir ?= iotjs_modules
iotjs_modules_dirs ?= ${iotjs_modules_dir}/.
deploy_modules_dir ?= ${CURDIR}/deploy/iotjs_modules/
deploy_module_dir ?= ${deploy_modules_dir}/${project}
deploy_dir ?= ${deploy_module_dir}

deploy_srcs += ${deploy_dir}/iotjs/async/index.js
deploy_srcs += ${deploy_dir}/index.js



help:
	@echo "## Usage: "

all: build
	@echo "log: $@: $^"

node_modules: package.json
	npm install
	-@mkdir -p $@

package-lock.json: package.json
	rm -fv "$@"
	npm install
	ls "$@"

node/modules: node_modules
	@echo "log: $@: $^"

modules: ${runtime}/modules
	@echo "log: $@: $^"

setup/node: node_modules
	@echo "NODE_PATH=$${NODE_PATH}"
	node --version
	npm --version

setup: setup/${runtime}
	@echo "log: $@: $^"

build/%: setup
	@echo "log: $@: $^"

build/node: setup node_modules lint
	@echo "log: $@: $^"

build: build/${runtime}
	@echo "log: $@: $^"

clean:
	rm -rf ${tmp_dir}

cleanall: clean
	rm -f *~

distclean: cleanall
	rm -rf node_modules

run/%: ${main_src} modules
	${@F} $< ${run_args}

run/npm: ${main_src} setup
	npm start

run: run/${runtime}
	@echo "log: $@: $^"

node/run: ${main_src}
	node $<

npm/test: package.json
	npm test

${runtime}/test: ${test_src} ${runtime}/modules
	${@D} $<

test: ${runtime}/test
	@echo "log: $@: $^"

start: run
	@echo "log: $@: $^"

check/%: ${srcs}
	${MAKE} setup
	@echo "log: SHELL=$${SHELL}"
	status=0 ; \
 for src in $^; do \
 echo "log: check: $${src}: ($@)" ; \
 ${@F} $${src} \
 && echo "log: check: $${src}: OK" \
 || status=1 ; \
 done ; \
	exit $${status}

check/npm:
	npm run lint

check: check/${runtime}
	@echo "log: $@: $^"

eslint/setup: node_modules
	ls ${eslint} || npm install eslint-plugin-node eslint
	${eslint} --version

${eslint}:
	ls $@ || make eslint/setup
	touch $@

.eslintrc.js: ${eslint}
	ls $@ || $< --init

eslint: ${eslint}
	$< --fix . ||:
	$< --fix .

lint/%: eslint
	@echo "log: $@: $^"

lint: lint/${runtime}
	@echo "log: $@: $^"

${iotjs_modules_dirs}: Makefile
	mkdir -p $@
	ls $@

${iotjs_modules_dir}: ${iotjs_modules_dirs}
	mkdir -p $@
	ls $@

setup/iotjs: ${iotjs_modules_dir}
	${@F} -h ||:

iotjs/modules: ${iotjs_modules_dirs}
	@mkdir -p $<

${deploy_dir}/%: %
	@echo "TODO: minify"
	install -d ${deploy_dir}/${<D}
	install $< $@

deploy: ${deploy_srcs}
	ls $<

# IOTJS-ASYNC #

Lightweight implementation of async's for IoT.js

So far only waterfall function is implemented.

* URL: https://github.com/rzr/iotjs-async

[![GitHub forks](https://img.shields.io/github/forks/rzr/iotjs-async.svg?style=social&label=Fork&maxAge=2592000)](https://GitHub.com/rzr/iotjs-async/network/)

[![NPM](https://nodei.co/npm/iotjs-async.png)](https://npmjs.org/package/iotjs-async)

[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2Frzr%2Fiotjs-async.svg?type=shield)](https://app.fossa.io/projects/git%2Bgithub.com%2Frzr%2Fiotjs-async?ref=badge_shield)

[![Build Status](https://api.travis-ci.org/rzr/iotjs-async.svg?branch=master)](https://travis-ci.org/rzr/iotjs-async)

[![dependencies Status](https://david-dm.org/rzr/generic-sensor-lite/status.svg)](https://david-dm.org/rzr/generic-sensor-lite)


## USAGE: ##


### USING NODEJS: ###

Running from sources tree is straightforward, but each step will be detailed.

```
npm test
[ 4, 2 ]
or 
nodejs example
```


### USING IOTJS: ###

It's very similar to nodejs
(just the path should be fully specified for iotjs-1.0)

```
iotjs example/index.js
[4,2]
```

Using module in your own project can be done easily by adding a git submodule
(because IoT.js does not provide its own packaging tool):

```
git submodule add https://github.com/rzr/iotjs-async iotjs-modules/iotjs-async
git commit -sam 'Import iotjs-async dependency'
git submodule update --init
```

Or rely on IoT.js community repo to track supported versions
(If you don't want the whole repo, extra post install cleanup scripts might be needed):

```
git submodule add https://github.com/samsung/iotjs-modules
git commit -sam 'Import iotjs-modules dependency'
git submodule update --init
```

Alternatively, code can be imported using node's npm package manager tool:

```
npm install iotjs-async
IOTJS_EXTRA_MODULE_PATH=./node_modules/ iotjs node_modules/iotjs-async/example

```

Client side, path can be adjusted or prefixed to support both runtime:

```
cat example.js

var async;
if (process.iotjs) {
  async = require('iotjs-async');
} else {
  async = require('async');
}

IOTJS_EXTRA_MODULE_PATH=.../iotjs-async/../ iotjs example.js
NODE_PATH=.../iotjs-async/../ node example.js
```

If we want to avoid to change client's source, then use environment variables:

```
cat example.js

var async = require('async');

NODE_PATH=.../iotjs-async/iotjs node example.js
IOTJS_EXTRA_MODULE_PATH=.../iotjs-async/iotjs  iotjs example.js
```


## RESOURCES: ##

* https://github.com/rzr/iotjs-async
* https://www.npmjs.com/package/iotjs-async
* http://iotjs.net
* https://github.com/Samsung/iotjs-modules
* https://github.com/Samsung/iotjs-modules/pull/14
* https://www.npmjs.com/package/async
* https://www.npmjs.com/package/async-lite
* https://github.com/SamDelgado/async-lite/pull/1
* https://github.com/tizenteam/async-lite


## LICENSE: ##

[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2Frzr%2Fiotjs-async.svg?type=large)](https://app.fossa.io/projects/git%2Bgithub.com%2Frzr%2Fiotjs-async?ref=badge_large)

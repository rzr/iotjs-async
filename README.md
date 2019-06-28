# IOTJS-ASYNC #

[![GitHub forks](https://img.shields.io/github/forks/rzr/iotjs-async.svg?style=social&label=Fork&maxAge=2592000)](https://GitHub.com/rzr/iotjs-async/network/)
[![License](https://img.shields.io/badge/licence-Apache%202.0-brightgreen.svg?style=flat)](LICENSE)
[![NPM](https://img.shields.io/npm/v/iotjs-async.svg)](https://www.npmjs.com/package/iotjs-async)
[![Build Status](https://api.travis-ci.org/rzr/iotjs-async.svg?branch=master)](https://travis-ci.org/rzr/iotjs-async)
[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2Frzr%2Fiotjs-async.svg?type=shield)](https://app.fossa.io/projects/git%2Bgithub.com%2Frzr%2Fiotjs-async?ref=badge_shield)
[![dependencies Status](https://david-dm.org/rzr/iotjs-async/status.svg)](https://david-dm.org/rzr/iotjs-async)

[![NPM](https://nodei.co/npm/iotjs-async.png)](https://npmjs.org/package/iotjs-async)


## INTRODUCTION: ##

Lightweight implementation of async's for IoT.js

So far only waterfall function is implemented.

* URL: <https://github.com/rzr/iotjs-async#>


## USAGE: ##


### USING NODEJS: ###

Running from sources tree is straightforward, but each step will be detailed.

```
npm start
#| node example
#| [ 4, 2 ]
```


### USING IOTJS: ###

It's very similar to nodejs
(just the path should be fully specified for iotjs-1.0)

```
make start
#| iotjs example/index.js
#| [4,2]

```

Using module in your own project can be done easily by adding a git submodule
(because IoT.js does not provide its own packaging tool):

```
git submodule add https://github.com/rzr/iotjs-async iotjs_modules/iotjs-async
git commit -sam 'Import iotjs_async dependency'
git submodule update --init
```

Note, ff you want to preseve path of NPM async module (require 'async'),
just clone is directory of samename (to align node_modules/async)

```sh
git submodule add https://github.com/rzr/iotjs-async iotjs_modules/async
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

[![iotjs_modules](https://image.slidesharecdn.com/webthing-iotjs-tizenrt-cdl2018-20181117rzr-181118110813/95/webthingiotjstizenrtcdl201820181117rzr-24-638.jpg)](https://www.slideshare.net/rzrfreefr/webthingiotjstizenrtcdl201820181117rzr/24 "iotjs_modules")


## RESOURCES: ##

* <https://github.com/rzr/iotjs-async#>
* <https://www.npmjs.com/package/iotjs-async#>
* <https://libraries.io/npm/iotjs-async#>
* <http://iotjs.net/#>
* <https://github.com/Samsung/iotjs-modules#>
* <https://github.com/Samsung/iotjs-modules/pull/14#>
* <https://github.com/rzr/webthing-iotjs/wiki/IotJs#>
* <https://www.npmjs.com/package/async#>
* <https://www.npmjs.com/package/async-lite#>
* <https://github.com/SamDelgado/async-lite/pull/1#>
* <https://github.com/tizenteam/async-lite#>
* <https://github.com/TizenTeam/bmp085-sensor#>


## LICENSE: ##

[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2Frzr%2Fiotjs-async.svg?type=large)](https://app.fossa.io/projects/git%2Bgithub.com%2Frzr%2Fiotjs-async?ref=badge_large)

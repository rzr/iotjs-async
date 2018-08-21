# IOTJS-ASYNC #

Lightweight implementation of async's for IoT.js

So far only waterfall function is implemented.


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

Note that code can be imported using node npm package manager tool:

```
npm install iotjs-async
IOTJS_EXTRA_MODULE_PATH=./node_modules/ iotjs node_modules/iotjs-async/example

```

Alternatively gitmodule can be used to track master branch.


Client side: path can be adjusted or prefixed:

```
var async;
try {
  async = require('async');
} catch (err) {
  async = require('iotjs/async/index.js');
}
IOTJS_EXTRA_MODULE_PATH=.../iotjs-async/iotjs iotjs ${example}
NODE_PATH=.../iotjs-async node ${example}
```


## RESOURCES: ##

* https://github.com/rzr/iotjs-async
* http://iotjs.net
* https://github.com/Samsung/iotjs-modules
* https://github.com/Samsung/iotjs-modules/pull/14
* https://www.npmjs.com/package/async
* https://www.npmjs.com/package/async-lite
* https://github.com/SamDelgado/async-lite/pull/1


## LICENSE: ##

[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2Frzr%2Fiotjs-async.svg?type=large)](https://app.fossa.io/projects/git%2Bgithub.com%2Frzr%2Fiotjs-async?ref=badge_large)

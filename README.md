# ASYNC-WATERFALL #

Lightweight implementation of async's waterfall function

[![License](https://img.shields.io/badge/licence-Apache%202.0-brightgreen.svg?style=flat)](LICENSE)

[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2Frzr%2Fasync-waterfall.svg?type=shield)](https://app.fossa.io/projects/git%2Bgithub.com%2Frzr%2Fasync-waterfall?ref=badge_shield)

[![NPM](https://nodei.co/npm/async-waterfall.png)](https://npmjs.org/package/async-waterfall)

[![dependencies Status](https://david-dm.org/rzr/async-waterfall/status.svg)](https://david-dm.org/rzr/async-waterfall)

[![Build Status](https://api.travis-ci.org/rzr/async-waterfall.svg?branch=master)](https://travis-ci.org/rzr/async-waterfall)


## USAGE: ##


### USING NODEJS: ###

Running from sources tree is straightforward, but each step will be detailed.

```
npm test
[ 4, 2 ]
```


### USING IOTJS: ###

It's very similar to nodejs, just the PATH environment variable is changed:

```
iotjs example
[4,2]
```

Code can be imported using node npm package manager tool:

```
npm install async-waterfall
IOTJS_EXTRA_MODULE_PATH=./node_modules/ iotjs node_modules/async-waterfall/example

```

Alternatively gitmodule can be used to track master branch.


## RESOURCES: ##

* https://github.com/rzr/async-waterfall
* https://www.npmjs.com/package/async-waterfall
* https://travis-ci.org/rzr/async-waterfall
* http://iotjs.net
* https://www.npmjs.com/package/async
* https://www.npmjs.com/package/async-lite
* https://github.com/SamDelgado/async-lite/pull/1

## LICENSE: ##

[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2Frzr%2Fasync-waterfall.svg?type=large)](https://app.fossa.io/projects/git%2Bgithub.com%2Frzr%2Fasync-waterfall?ref=badge_large)

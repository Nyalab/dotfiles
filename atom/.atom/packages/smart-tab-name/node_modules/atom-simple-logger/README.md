# atom-simple-logger

a simple logger for atom packages. With colors and namespaces and stuff..

![atom-simple-logger](https://cloud.githubusercontent.com/assets/1881921/8181891/0c83fbae-142a-11e5-9436-6148fe26d6c2.png)

## Install

```sh
npm install --save atom-simple-logger
```

## Usage

returns a `Function({pkg,nsp})`


| options   | Type    | Usage                                   |
| --------: | ------- | :-------------------------------------- |
| pkg       | string  | name of your package |
| nsp    | string | (optional) shortcut for setting the namespace |

if `atom.inDevMode()` returns a `Function(nsp)` unless nsp was already provided, in which case this function will be called with the provided nsp

returns a `Function(string,lvl)`

| options   | Type    | Usage                                   |
| --------: | ------- | :-------------------------------------- |
| string       | string  | string to log |
| lvl    | integer | (optional) debug level of this message |

will issue a console.log of the format `#{pkg}.#{nsp}: #{string}`
whereas the prefix will be colored
It will try to get the debug level by `atom.config.get("#{pkg}.debug")`
if a debug level is optained and it is lower than `lvl`, the output will be suppressed

Unless `atom.inDevMode()` all returned functions will be empty and return null.

## Example
```coffee
# in your package declaration
config:
  debug:
    type: "integer"
    default: 0
    minimum: 0

# some other place
log = require("atom-simple-logger")(pkg:"name-of-you-package",nsp:"main")
log "activating"
# if in dev mode and debug for your package is set
# will output name-of-you-package.main: activating
log "doing verbose stuff",2
# will only output if debug is set to 2 or higher
```



## Release History
 - *v0.0.1*: First release

## License
Copyright (c) 2015 Paul Pflugradt
Licensed under the MIT license.

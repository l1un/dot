###### notes-unit-tesing
##### async node testing: 
`npm install node-fetch --save`

```javascript
// ++ option a:
import fetch from 'node-fetch'
```
```javascript
// ++ option b:
const fetch = require('node-fetch')
```
##### fix test deprecation notice (babel): 
```shell
# change
--compilers js:babel-core/register
```
```
# to
--require babel-core/register`
```
<small> link: [mocha github](https://github.com/mochajs/mocha/wiki/compilers-deprecation)</small>

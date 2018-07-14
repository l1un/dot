#### node-npm-etc 
###### npm warn notes
***fix:*** "*SKIPPING OPTIONAL DEPENDENCY: fsevents@1.1.3...*" - `npm install --no-optional`

###### standard style js / lint
***fix:*** warnings in .js files using mocha, chai, etc.

- option a: add `/* global describe it <etc...> */` to top of file 

- option b: add to package.json:
```{
  "name": "my-package",
  "version": "1.0.0",
  "standard": {
    "globals": [
      "describe",
      "context",
      "before",
      "beforeEach",
      "after",
      "afterEach",
      "it",
      "expect"
    ]
  }
}
```


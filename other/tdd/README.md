# tdd

## jest

### config

Vim, Coc, tss-server, Intellisense, auto-completion, suggestions,
documentation, etc. (updated: 2020.02.13 / 08:59)

```json
// package.json

  {
    "scripts": {
      "test": "jest"
    },
    "devDependencies": {
      "@types/jest": "^25.1.2",
      "jest": "^25.1.0"
    }
  }
```

```javascript
// eslintrc.js

  env: {
    jest: true,
  },
  extends: [
    'plugin:jest/recommended',
  ],
  plugins: [
    'jest',
  ]
```

```json
// jsconfig.json

{
  "typeAcquisition": {
    "include": [
      "jest"
    ]
  }
}
```

- files / directories:

```sh
  ├── __tests__
  │   └── component.spec.js # test
  │   └── anything # test
  ├── package.json # not test
  ├── foo.test.js # test
  ├── bar.spec.jsx # test
  └── component.js # not test
```

- commands:
  - test: `npm run test`
  - watch: `npm run test -- --watch`


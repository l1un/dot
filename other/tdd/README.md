# tdd

## jest

### config

#### Vim, Coc, tss-server, Intellisense, auto-completion, documentation, etc

2020.02.13 / 15:56

- `package.json`

  ```json
    {
      "scripts": {
        "test": "jest"
      },
     "jest": {
      "collectCoverage": true,
      "coverageReporters": ["HTML"]
    },
     "devDependencies": {
        "@types/jest": "^25.1.2",
        "jest": "^25.1.0"
      }
    }
  ```

- `.eslintrc.js`

  ```javascript
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

- `jsconfig.json`

```json
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
  - test: `npm run test` or `npm test`
  - watch: `npm run test -- --watch` or `npm test -- --watch`
  - coverage: `npm run test -- --coverage` or `npm test -- --coverage`

- links:

  - [https://github.com/neoclide/coc-tsserver/issues/8](https://github.com/neoclide/coc-tsserver/issues/8)

    > You should use latest version of typescript for better feature support.
    >
    > You should install @types/node in your project for tsserver intellisense.
    >
    > The filetype of jsx should be javascript.jsx or javascriptreact for jsx files.
    >
    > You may need to create a jsconfig.json for tsserver to understand your project

  - [https://github.com/jest-community/vscode-jest/issues/78](https://github.com/jest-community/vscode-jest/issues/78)

    ```json
    {
      typeAcquisition": {
        "include": [
          "jest"
        ]
      }
    }
    ```

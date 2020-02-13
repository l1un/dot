# tdd notes

## jest

### config

- `package.json`:

```json
  {
    "scripts": {
      "test": "jest"
    }
  }
```

- `.eslintrc.js`:

```javascript
  env: {
    jest: true,
    ...
  },
  extends: [
    'plugin:jest/recommended',
    ...
  ],
  plugins: [
    'jest',
    ...
  ]
```

- commands:
  - test: `npm run test`
  - watch: `npm run test -- --watch`

- files / directories:

```shell
  ├── __tests__
  │   └── component.spec.js # test
  │   └── anything # test
  ├── package.json # not test
  ├── foo.test.js # test
  ├── bar.spec.jsx # test
  └── component.js # not test
```

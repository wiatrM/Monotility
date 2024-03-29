module.exports = {
  parser: 'babel-eslint',
  ignorePatterns: ['.eslintrc.js'],
  parserOptions: {
    "sourceType": "module",
    "allowImportExportEverywhere": false,
    "codeFrame": true
  },
  settings: {
    'import/core-modules': ['rxjs/operators'],
  },
  plugins: [
    '@typescript-eslint/eslint-plugin',
    '@typescript-eslint',
    'prettier',
    'unused-imports',
  ],
  extends: [
    'airbnb-base',
    'eslint:recommended',
    'plugin:@typescript-eslint/eslint-recommended',
    'plugin:@typescript-eslint/recommended',
    'plugin:import/typescript',
    'plugin:prettier/recommended',
    'react-app',
    'prettier',
  ],
  root: true,
  env: {
    node: true,
    jest: true,
  },
  rules: {
    'prettier/prettier': [
      'error',
      {
        "printWidth": 120,
        "tabWidth": 2,
        "singleQuote": true,
        "trailingComma": "all",
        "proseWrap": "always",
        "endOfLine": "auto",
        "bracketSpacing": true
      },
    ],
    'import/order': [
      'error',
      {
        groups: [
          ['external', 'builtin'],
          ['parent', 'internal'],
          ['index', 'sibling'],
        ],
        'newlines-between': 'always',
      },
    ],

    // TS off
    '@typescript-eslint/interface-name-prefix': 'off',

    // TS errors
    '@typescript-eslint/no-explicit-any': 'error',
    '@typescript-eslint/no-misused-new': 'error',
    '@typescript-eslint/explicit-module-boundary-types': 'error',
    '@typescript-eslint/no-non-null-assertion': 'error',

    // Eslint off
    'import/extensions': 'off',
    'import/prefer-default-export': 'off',
    'class-methods-use-this': 'off',
    'no-useless-constructor': 'off',
    'import/no-unresolved': 'off',
    'no-control-regex': 'off',
    'no-shadow': 'off',
    'import/no-cycle': 'off',
    'consistent-return': 'off',
    'no-underscore-dangle': 'off',
    'no-await-in-loop': 'off',
    'no-unused-vars': 'off',
    'unused-imports/no-unused-imports': 'error',
    'unused-imports/no-unused-vars': [
      'warn',
      { 'vars': 'all', 'varsIgnorePattern': '^_', 'args': 'after-used', 'argsIgnorePattern': '^_' }
    ],

    // Eslint errors
    'no-restricted-syntax': [
      'error',
      {
        selector: 'LabeledStatement',
        message: 'Labels are a form of GOTO; using them makes code confusing and hard to maintain and understand.',
      },
      {
        selector: 'WithStatement',
        message: '`with` is disallowed in strict mode because it makes code impossible to predict and optimize.',
      },
      {
        selector: "MethodDefinition[kind='set']",
        message: 'Property setters are not allowed',
      },
    ],

    'import/no-extraneous-dependencies': ['error', { devDependencies: true }],
  },
};

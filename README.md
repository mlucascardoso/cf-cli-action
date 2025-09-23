# Cloud Foundry CLI Action

[![Test](https://github.com/mlucascardoso/cf-cli-action/actions/workflows/test.yml/badge.svg)](https://github.com/mlucascardoso/cf-cli-action/actions/workflows/test.yml)

This GitHub Action provides a wrapper around the Cloud Foundry CLI (v8) with optional multiapps plugin support. It's designed to work with modern GitHub Actions runners and includes robust error handling.

## Features

- 🚀 **CF CLI v8** - Latest stable version
- 🔌 **Multiapps Plugin Support** - Optional MTA deployment support
- 🛡️ **Robust Error Handling** - Better debugging and error messages
- 🏗️ **Modern Base Image** - Ubuntu 22.04 LTS
- ✅ **Tested** - Automated testing with GitHub Actions

## Inputs

| Input | Description | Required | Default |
|-------|-------------|----------|---------|
| `command` | Command to run using CF CLI | Yes | - |
| `use_multi_apps_plugin` | Install and use multiapps plugin | No | `false` |

## Example Usage

### Basic CF Commands

```yaml
- name: Login to Cloud Foundry
  uses: mlucascardoso/cf-cli-action@master
  with:
    command: login -a ${{ secrets.CF_API }} -u ${{ secrets.CF_USERNAME }} -p ${{ secrets.CF_PASSWORD }} -o ${{ secrets.CF_ORGANIZATION }} -s ${{ secrets.CF_SPACE }}

- name: Push application
  uses: mlucascardoso/cf-cli-action@master
  with:
    command: push my-app

- name: Check application status
  uses: mlucascardoso/cf-cli-action@master
  with:
    command: apps
```

### Using Multiapps Plugin

```yaml
- name: Deploy MTA
  uses: mlucascardoso/cf-cli-action@master
  with:
    use_multi_apps_plugin: true
    command: deploy mta_archives/my-app_1.0.0.mtar

- name: Check MTA status
  uses: mlucascardoso/cf-cli-action@master
  with:
    use_multi_apps_plugin: true
    command: mtas
```

### Complete Workflow Example

```yaml
name: Deploy to Cloud Foundry

on:
  push:
    branches: [ main ]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v4
        
      - name: Login to Cloud Foundry
        uses: mlucascardoso/cf-cli-action@master
        with:
          command: login -a ${{ secrets.CF_API }} -u ${{ secrets.CF_USERNAME }} -p ${{ secrets.CF_PASSWORD }} -o ${{ secrets.CF_ORGANIZATION }} -s ${{ secrets.CF_SPACE }}
          
      - name: Deploy application
        uses: mlucascardoso/cf-cli-action@master
        with:
          command: push my-app --strategy rolling
```

## Recent Updates (2025)

- ✅ **Fixed installation issues** - Updated to use modern CF CLI installation method
- ✅ **Updated base image** - Migrated from Ubuntu 18.04 to Ubuntu 22.04 LTS
- ✅ **Improved error handling** - Better debugging output and error messages
- ✅ **Enhanced multiapps support** - More robust plugin installation with fallbacks
- ✅ **Added automated testing** - GitHub Actions workflow for continuous testing

## License
[MIT](LICENSE)
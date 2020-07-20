# Cloud Foundry Action - cli

This action is simply a wrapper around the cf CLI. Every parameter passed to the action in the command section will be executed with `cf $*`. Alternatively you can use multiapps plugin to deploy your app by providing `use_multi_apps_plugin: true` option (examples below).

## Example usage
```
...
- name: Login to cloudfoundry
  uses: mlucascardoso/cf-cli-action@master
  with:
    command: login -a ${{ secrets.CF_API }} -u ${{ secrets.CF_USERNAME }} -p ${{ secrets.CF_PASSWORD }} -o ${{ secrets.CF_ORGANIZATION }} -s ${{ secrets.CF_SPACE }}
- name: Deploy to cloudfoundry
  uses: mlucascardoso/cf-cli-action@master
  with:
    use_multi_apps_plugin: true // this allow you to use multiapps plugin commands
    command: deploy mta_archives/vsPunchoutApp_0.0.1.mtar
...
```

## License
[MIT](LICENSE)
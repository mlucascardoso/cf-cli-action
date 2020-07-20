#!/bin/sh
set -e

echo $use_multi_apps_plugin

if [ $use_multi_apps_plugin = "true" ] 
then
    sh -c "cf add-plugin-repo CF-Community https://plugins.cloudfoundry.org"
    sh -c "cf install-plugin -r CF-Community 'multiapps' -f"
fi

sh -c "cf $*"
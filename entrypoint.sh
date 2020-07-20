#!/bin/sh
set -e

# if [ $INPUT_USE_MULTI_APPS_PLUGIN = "true" ] 
# then
    sh -c "cf add-plugin-repo CF-Community https://plugins.cloudfoundry.org"
    sh -c "cf install-plugin -r CF-Community 'multiapps' -f"
# fi

sh -c "cf $*"
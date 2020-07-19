#!/bin/sh
set -e

sh -c "cf add-plugin-repo CF-Community https://plugins.cloudfoundry.org"
sh -c "cf install-plugin -r CF-Community 'multiapps' -f"

sh -c "cf $*"
#!/bin/bash
set -e

# Verify CF CLI is available
if ! command -v cf &> /dev/null; then
    echo "Error: CF CLI not found"
    exit 1
fi

# Show CF CLI version for debugging
echo "Using CF CLI version:"
cf version

# Install multiapps plugin if requested
if [ "${INPUT_USE_MULTI_APPS_PLUGIN}" = "true" ]; then
    echo "Installing multiapps plugin..."
    cf add-plugin-repo CF-Community https://plugins.cloudfoundry.org || true
    cf install-plugin -r CF-Community 'multiapps' -f || {
        echo "Warning: Failed to install multiapps plugin from CF-Community repo"
        echo "Trying direct installation..."
        cf install-plugin multiapps -f || echo "Warning: Could not install multiapps plugin"
    }
fi

# Execute the CF command
echo "Executing: cf $INPUT_COMMAND"
exec sh -c "cf $INPUT_COMMAND"
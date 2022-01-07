# Snowdrift CiviCRM Dependency Configuration

## Automatic updates

This repo has Dependabot configured for weekly automatic updates. Simply merge the generated PR and Chef will deploy the update on the next run.

## Manual updates

Update `composer.json`, then update the lockfile with the following Docker container:

```sh
# Build container
docker build -t snowdrift-civicrm .

# Run container
docker run -it --rm -v $(pwd):/w -w /w -u $(id -u):$(id -g) snowdrift-civicrm composer update
```

Afterwards, commit the updates to `composer.json` and `composer.lock`. Chef should update everything on the next run.

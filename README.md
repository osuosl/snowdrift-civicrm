Update `composer.json`, then update the lockfile in Docker with the following:

```sh
# Build container
docker build -t snowdrift-civicrm .

# Run container
docker run -it --rm -v $(pwd):/w -w /w -u $(id -u):$(id -g) snowdrift-civicrm composer update
```

Afterwards, commit the updates to `composer.json` and `composer.lock`. Chef should update everything on the next run.

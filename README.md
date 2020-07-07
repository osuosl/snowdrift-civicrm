First update the composer.json file to what you want and then do the following. You will need a Gitlab.com token in
order to pull in some of the deps unfortunately. It should be in the form of "username:token".

```
# Build container
docker build -t snowdrift-civicrm .

# Run container
docker run -it --rm -v $(pwd):/w -w /w snowdrift-civicrm

# Inside the container
composer config --global --auth gitlab-token.gitlab.com <GITLAB_TOKEN>
composer update
```

Afterwards, commit the updates to composer.json and compose.lock. Chef should update everything on the next run.

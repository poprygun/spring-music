Concourse CI
============

Sample showing the definition of a simple concourse pipeline defining maven build and deployment to CF Pez environment.

Often, concourse environment does not have access to docker-hub.  Here, we demonstrate the technique of loading docker image to S3 repository.  See `docker-resource-pipeline.yml`.

**Concourse version > 3.8 required to run this example.**

##To setup a local concourse instance using vagrant.

```bash
bosh create-env concourse-lite.yml --state concourse-lite-state.json
```

##To configure and run pipeline to load maven docker image to S3.

```bash
fly -t spring-music-target login -c http://192.168.100.4:8080
fly -t spring-music-target set-pipeline -c ci/docker-resources-pipeline.yml -p docker-resources-pipeline -l ci/credentials.yml
fly -t spring-music-target unpause-pipeline -p docker-resources-pipeline
```

##To configure and depoy a pipeline to execute build steps.

```bash
fly -t spring-music-target set-pipeline -c ci/spring-music.yml -p spring-music-pipeline -l ci/credentials.yml
fly -t spring-music-target unpause-pipeline -p spring-music-pipeline
```

Contents of credentials.yml file should containg a replacement tokens for placeholders defined in pipeline definition - spring-music.yml and formatted as
~~~
api-username: (my username)
api-password: (my password)
~~~
Pipeline will be available in [UI of local concourse installation](http://192.168.100.4:8080/pipelines/spring-music-pipeline)

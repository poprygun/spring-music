Concourse CI
============

Sample showing the definition of a simple concourse pipeline defining maven build and deployment to CF Pez environment.

##To setup a local concourse instance using vagrant
~~~
$ vagrant init concourse/lite
$ vagrant up
~~~

##To configure and depoy a pipeline
~~~
$ fly -t spring-music-target login -c http://192.168.100.4:8080
$ fly -t spring-music-target set-pipeline -c ci/spring-music.yml -p spring-music-pipeline -l ci/credentials.yml
$ fly -t spring-music-target unpause-pipeline -p spring-music-pipeline

~~~
Contents of credentials.yml file should containg a replacement tokens for placeholders defined in pipeline definition - spring-music.yml and formatted as
~~~
api-username: (my username)
api-password: (my password)
~~~
Pipeline will be available in [UI of local concourse installation](http://192.168.100.4:8080/pipelines/spring-music-pipeline)

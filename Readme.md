# Jenkins container with Docker client

__Has only been tested on Mac and Linux__

I use this Docker container to run Jenkins __locally__ but I like to use piplines that run steps inside Docker containers (using containers within a container).

To do this the Jenkins container needs the Docker client installed and then the host machine Docker socket needs to be mounted inside of the Jenkins container.

## Usage

```
docker run -v /var/run/docker.sock:/var/run/docker.sock -v jenkins_home:/var/run/docker.sock -p 8080:8080 jenkins-with-docker
```

For some more info on the subject read this [blog post](https://jpetazzo.github.io/2015/09/03/do-not-use-docker-in-docker-for-ci/) by the guy who created the functionality to do this.

See the [official docs](https://hub.docker.com/r/jenkins/jenkins/) for more info on using the Jenkins container.
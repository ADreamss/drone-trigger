# drone-trigger

Drone plugin to trigger builds for a list of dowstream repositories.

## Docker

Build the Docker image with the following commands:

```
docker build --rm -t plugins/drone-trigger .
```

## Usage

Execute from the working directory:

```
docker run --rm \
    -e PLUGIN_REPOSITORY=octocat/hello-world \
    -e PLUGIN_BRANCH=development \
    -e PLUGIN_SERVER=http://drone.example.com \
    -e PLUGIN_TOKEN=WFuLWZlcm5hbmRleiIsInR5cGUiOiJ1c2VyIn0.9ngLeFKFDULBsaTgYtv0k-ZQGibOFwOxSh21h_B8O7w \
    -e PLUGIN_FORK=false \ 
    -v $(pwd):$(pwd) \
    -w $(pwd) \
    --privileged \
    plugins/drone-trigger
```
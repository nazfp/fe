This is a sample of using Github Actions inspired by my previous [project](https://github.com/noellimx/project-6-backend/tree/main/.github/workflows).

The yamls run drivers (initial steps) which can be extended for CICD.

1. [build-in-place.yaml](.github/workflows/build-in-place.yaml)
   spins a container inside runner and execute `npm run build`

2. [connection-ec2.yaml](.github/workflows/connection-ec2.yaml) ssh into remote server and logs current commit hash

# Capstone Project 6

## Authoritative References

[Planning] https://noellimx.atlassian.net/wiki/spaces/FPCAPSTONE/overview

## Requirement

Docker + Internet.

## Development

`./run.sh dev` Spins up a container with vite+react-hmr.

### - configuration file

`container.dev.env`

#### flags

`DEVELOPMENT_PORT` ingress port. To keep consistency, this value will be propagated downstream for vite development server

## Build Stage - Local

`./run_dev.sh build` Build to `/dist`.

## Build Stage - Github Action

A build stage from Github Actions is triggered by [build-in-place.yaml](./.github/workflows/build-in-place.yaml). 

Driver script should be `./run_dev.sh build` (see [local build stage](#build-stage---local))
`

## Glossary

"capstone-6" and "vms" is used interchangably.

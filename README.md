# elixir-pokedex
Elixir fun Pokedex in the form of REST API, with OpenTelemetry Monitoring and observability demo

[![CI](https://github.com/lucazulian/elixir-pokedex/actions/workflows/elixir-pokedex-ci.yml/badge.svg)](https://github.com/lucazulian/elixir-pokedex/actions/workflows/elixir-pokedex-ci.yml)


## About the Application

elixir-pokedex is a Elixir Phoenix API application that returns Pokemon information.

The API has two main endpoints:
- basic Pokemon information
- basic Pokemon information with a "fun" translation of the Pokemon description

[![Run in Livebook](https://livebook.dev/badge/v1/blue.svg)](https://livebook.dev/run?url=https%3A%2F%2Fgithub.com%2Flucazulian%2Felixir-pokedex%2Fblob%2Fmain%2Fnotebooks%2Fpokedex.livemd)


## Requirements
  
  - docker **20+**
  - docker-compose **1.29+**
  - GNU make **4+**

The application requires Loki Docker plugin that can be installed using:

``` bash
docker plugin install grafana/loki-docker-driver:latest --alias loki --grant-all-permissions
```


## Repository conventions

  * [Conventional Commits][1]

  [1]: https://www.conventionalcommits.org/en/v1.0.0/


## Getting started

#### make commands

```bash
help                           Get help information about make available commands

build                          Build all services containers
delete                         Delete all containers, images and volumes
halt                           Shoutdown all services containers
shell                          Enter into elixir_pokedex service
start                          Start application
up                             Start all services
```


## How to use
TODO


## Improvements / Missing parts / Bugs 
TODO

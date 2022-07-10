# README

## How to use

- Create a `config.txt` file by following the gminer documentation
- Install and configure your `nvidia-docker` runtime
- Run docker

```
nvidia-docker run --rm -it -v /path/to/config.txt:/gminer/config.txt gminer
```

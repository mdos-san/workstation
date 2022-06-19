## Usage

### Installation

```shell
docker pull @mdos-san/workstation
```

### Run

```shell
docker run -it --rm --net host -v ~/.ssh:~/.ssh -v ~/workstation:/root/workstation --name workstation workstation
```

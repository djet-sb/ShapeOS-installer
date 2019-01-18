# ShapeOS-installer


### Build
```
docker build -t shape-os-installer .

```

###
Get ISO image

```
docker run -v `pwd`:/upload shape-os-installer
```
OR use Docker HUB

```
docker run -v `pwd`:/upload bres/shape-os-installer
```

QuMine - Integrations - BlueMap
---

[QuMine-Server (Java)](https://github.com/qumine/qumine-server-java) Integration for [BlueMap-Minecraft/BlueMap](https://github.com/BlueMap-Minecraft/BlueMap)

# Development

## Perfrom a Snapshot release locally

```
docker run -it --rm \
  -v ${PWD}:/build -w /build \
  -v /var/run/docker.sock:/var/run/docker.sock \
  goreleaser/goreleaser \
  release --snapshot --rm-dist
```
<h1 align="center">alpine</h1>

<p align="center">
  (Infra) Alpine image used by all vidsy containers and CI jobs so we can control the version we use.
</p>

## Usage

If you'd like to use an alpine container for any reason, then you should base your `Dockerfile` from `vidsyhq/alpine`.

## Releases

After merge to **master**; remember to tag your merge commit:

```bash
make push-tag
```


# Crossplane Helm Chart
When we use Crossplane we tend to repeat once and over again the same resources, this chart contains the typical crossplane
resources you'll need in your daily work.

The idea is to add here more resources as they are needed for more projects, for example in the v1.0.0 there aren't any
resource related to Google Storage Buckets or Databases, but instead of add the Crossplane template/resource in your
project we propose to you to add the template here allowing to parametrize all you'll need for your project and use 
this as a subchart in your definition.

## Test

You can test that your template renders correctly executing the command:

```shell
helm template my-example-release --namespace my-example-namespace . -f values.yaml -f values.test.yaml
```

## Deploy

Once you are done with your changed and they are approved via PR you'll need to upload this to our public charts repository.

```shell
make publish
```

### Dependencies
- You'll need permissions to write to the helm repository
- `yq` as dependency
- make
- helm
- helm push plugin

## Usage

Remember to add this as a subchart to your project chart:

```yaml
dependencies:
- name: crossplane-softonic-factory
  version: 1.1.0
  repository: https://charts.softonic.io
  apiVersion: v2
```

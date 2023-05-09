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
You can test the creation of Load Balancer executing the next command:

```shell
helm template my-example-release --namespace my-example-namespace . -f values.yaml -f values.test-lb.yaml
# To check if all was created you can verify(in GCP) with the next urls:
# globalAddress=https://console.cloud.google.com/networking/addresses/list?project=kubertonic-st
# managedSslCertificate=https://console.cloud.google.com/security/ccm/list/lbCertificates?project=kubertonic-st
# healthChecks=https://console.cloud.google.com/compute/healthChecks?referrer=search&project=kubertonic-st
# BackendService=https://console.cloud.google.com/net-services/loadbalancing/list/backends?project=kubertonic-st
# URLMap=https://console.cloud.google.com/net-services/loadbalancing/list/loadBalancers?project=kubertonic-st
# TargetHTTPSProxy(Column=In use by)=https://console.cloud.google.com/security/ccm/list/lbCertificates?project=kubertonic-st
# globalForwardingRule=https://console.cloud.google.com/net-services/loadbalancing/list/frontends?project=kubertonic-st

```

## Deploy

Once you are done with your changes and they are approved via PR you'll need to upload this to our public charts repository.

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
  version: 1.2.0
  repository: https://charts.softonic.io
```

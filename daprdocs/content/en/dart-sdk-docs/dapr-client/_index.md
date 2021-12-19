---
type: docs
title: "Getting started with the Dapr client Dart SDK"
linkTitle: "Client"
weight: 20000
description: How to use dapr_client package to access various dapr building blocks.
no_list: true
---

The **dapr_client** package allows you to interact with other Dapr applications from a dart or flutter application.
A dapr sidecar exposes its services through **http** and **grpc** protocol.

Using **dapr_client** package, both dart & flutter applications can access the sidecar through a unified api surface.
> Note: Grpc support for dart web or flutter web is not tested, yet!.

## Prerequisites

- [Dapr CLI]({{< ref install-dapr-cli.md >}}) installed
- Initialized [Dapr environment]({{< ref install-dapr-selfhost.md >}})
- [Dart installed](https://dart.dev/get-dart) or [Flutter installed](https://docs.flutter.dev/get-started/install)

## Install dapr_client dependency
Install the `dapr_client` package as a dependency in your `pubspec.yaml` directly or using `pub add` command.

{{< tabs "In pubspec.yaml" Dart Flutter>}}

{{% codetab %}}
```yaml
dependencies:
  dapr_client: any
```
{{% /codetab %}}

{{% codetab %}}
```bash
dart pub add dapr_client
```
{{% /codetab %}}

{{% codetab %}}
```bash
flutter pub add dapr_client
```
{{% /codetab %}}

{{< /tabs >}}


## Import the client package 
```dart
import 'pacakge:dapr_client/dapr_client.dart'
```

## Create a `DaprClient` instance
In order to access all the [dapr bulding blocks]({{< ref building-blocks >}}), a `DaprClient` instance is required. 
`DaprClient` object accepts three optional paramenters namely, 

1. `protocol` - The protocol to be used to communicate with sidecar.
    * Accepts either `CommunicationProtocol.http`(_default_) or `CommunicationProtocol.grpc`.

2. `daprHost` - The hostname or the ip address of the dapr sidecar process.
    * Defaults to **127.0.0.1**.

3. `daprPort` - The port to access the dapr sidecar process.        
    * If not provided, uses environment variables `DAPR_HTTP_PORT`, `DAPR_GRPC_PORT` respectively for http and grpc protocols.
    * If no environment variables set, defaults to **3500** for http and **50001** for grpc protocol


{{< tabs "Http Client" "Grpc Client" >}}

{{% codetab %}}
```dart
/// Default client
final daprClient = DaprClient();

/// Explicitly specifying the parameters
final customClient = DaprClient(
    daprHost: "my.domain.com",
    daprPort: 3600,
    communicationProtocol: CommunicationProtocol.http,
);
```
{{% /codetab %}}

{{% codetab %}}
```dart
/// Default client
final daprClient = DaprClient(
    communicatonProtocol: CommunicationProtocol.grpc,
);

/// Explicitly specifying the parameters
final customClient = DaprClient(
    daprHost: "my.domain.com",
    daprPort: 3600,
    communicationProtocol: CommunicationProtocol.grpc,
);
```
{{% /codetab %}}

{{< /tabs >}}

## Building blocks
The `DaprClient` instance allows a client to interact with various building blocks. 
Inspired from the js-sdk for dapr, dart-sdk also groups the functionalities for each building block under respecting implementations.
Following table provides an overview of the accesor variables for each of these building blocks.

|Accessor variable|Building block|Purpose|
|---|---|---|
|`daprClient.invoker`|Service Invocation| Provides method to invoke an external service|
|`daprClient.pubsub`|Publish| Provides methods to publish a message to a topic|
|`daprClient.binding` |Output Binding| Provides a method to send data to an output binding|
|`daprClient.secrets`|Secrets| Provides methods to get one or more secrets.|
|`daprClient.state`|State Store| Provides methods to perform CRUD operations on a state store.|

### Service Invocation

Service invokation allows clients to invoke a service deployed in another application. 
Dart sdk's `dapr_client` package provides a single method to perform service invocation.

Service invocation allows different http operations to performed.
This is possible by setting the correct `httpMethod` argument as shown below.
Additionally a json encodable `data` object can be passed.

{{< tabs Get Post Put Delete >}}

{{% codetab %}}
```dart
await daprClient.invoker.invoke(
    appId: 'dapr-app-id',    
    methodName: 'method-name',
    httpMethod: HttpMethod.get,
);
```
{{% /codetab %}}

{{% codetab %}}
```dart
await daprClient.invoker.invoke(
    appId: 'dapr-app-id',    
    methodName: 'method-name',
    data: {'key': 'value'},
    httpMethod: HttpMethod.post,
);
```
{{% /codetab %}}

{{% codetab %}}
```dart
await daprClient.invoker.invoke(
    appId: 'dapr-app-id',    
    methodName: 'method-name',
    data: {'key': 'value'},
    httpMethod: HttpMethod.put,
);
```
{{% /codetab %}}

{{% codetab %}}
```dart
await daprClient.invoker.invoke(
    appId: 'dapr-app-id',    
    methodName: 'method-name',
    data: {'key': 'value'},
    httpMethod: HttpMethod.delete,
);
```
{{% /codetab %}}

{{< /tabs >}}


> Some times it is required to pass query paramaters to the http service being invoked. This is currently not possible in the dapr_client api.

- For a full guide on service invocation visit [How-To: Invoke a service]({{< ref howto-invoke-discover-services.md >}}).

### State Management


### Publish Messages
To publish data onto a topic, the Dapr dart client provides a simple method:

```dart
// Data to be published. The data should be json encodable.
final _publishedData = {'hello': 'world'};


// publish the message to a topic defined in pub sub compoent registered under pubsubName.
await daprClient.pubSub.publish(
    pubSubName: 'pubsub-component-name',
    topicName: 'topic-name',
    data: _publishedData,
);
```

- For a full list of state operations visit [How-To: Publish & subscribe]({{< ref howto-publish-subscribe.md >}}).

### Output Bindings
The Dapr Go client SDK provides two methods to invoke an operation on a Dapr-defined binding. Dapr supports input, output, and bidirectional bindings.

For simple, output only biding:
```go
in := &dapr.InvokeBindingRequest{ Name: "binding-name", Operation: "operation-name" }
err = client.InvokeOutputBinding(ctx, in)
```
To invoke method with content and metadata:
```go
in := &dapr.InvokeBindingRequest{
    Name:      "binding-name",
    Operation: "operation-name",
    Data: []byte("hello"),
    Metadata: map[string]string{"k1": "v1", "k2": "v2"},
}

out, err := client.InvokeBinding(ctx, in)
```


- For a full guide on output bindings visit [How-To: Use bindings]({{< ref howto-bindings.md >}}).

### Secret Management

The Dapr client also provides access to the runtime secrets that can be backed by any number of secrete stores (e.g. Kubernetes Secrets, HashiCorp Vault, or Azure KeyVault):

```go
opt := map[string]string{
    "version": "2",
}

secret, err := client.GetSecret(ctx, "store-name", "secret-name", opt)
```

### Authentication

By default, Dapr relies on the network boundary to limit access to its API. If however the target Dapr API is configured with token-based authentication, users can configure the Go Dapr client with that token in two ways:

**Environment Variable**

If the DAPR_API_TOKEN environment variable is defined, Dapr will automatically use it to augment its Dapr API invocations to ensure authentication.

**Explicit Method**

In addition, users can also set the API token explicitly on any Dapr client instance. This approach is helpful in cases when the user code needs to create multiple clients for different Dapr API endpoints.

```go
func main() {
    client, err := dapr.NewClient()
    if err != nil {
        panic(err)
    }
    defer client.Close()
    client.WithAuthToken("your-Dapr-API-token-here")
}
```


- For a full guide on secrets visit [How-To: Retrieve secrets]({{< ref howto-secrets.md >}}).

## Related links
- [Go SDK Examples](https://github.com/dapr/go-sdk/tree/main/examples)
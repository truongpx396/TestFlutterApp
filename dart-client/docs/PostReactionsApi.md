# swagger.api.PostReactionsApi

## Load the API package
```dart
import 'package:swagger/api.dart';
```

All URIs are relative to *https://qatechshare.o2f-it.com/api/blog*

Method | HTTP request | Description
------------- | ------------- | -------------
[**postReactionsPost**](PostReactionsApi.md#postReactionsPost) | **POST** /PostReactions | PostReactionsPost
[**postReactionsPut**](PostReactionsApi.md#postReactionsPut) | **PUT** /PostReactions/{id} | PostReactionsPut


# **postReactionsPost**
> ReadReaction postReactionsPost(body)

PostReactionsPost



### Example 
```dart
import 'package:swagger/api.dart';
// TODO Configure OAuth2 access token for authorization: auth
//swagger.api.Configuration.accessToken = 'YOUR_ACCESS_TOKEN';

var api_instance = new PostReactionsApi();
var body = new CreatePostReaction(); // CreatePostReaction | 

try { 
    var result = api_instance.postReactionsPost(body);
    print(result);
} catch (e) {
    print("Exception when calling PostReactionsApi->postReactionsPost: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**CreatePostReaction**](CreatePostReaction.md)|  | [optional] 

### Return type

[**ReadReaction**](ReadReaction.md)

### Authorization

[auth](../README.md#auth)

### HTTP request headers

 - **Content-Type**: application/json-patch+json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **postReactionsPut**
> ReadReaction postReactionsPut(id, body)

PostReactionsPut



### Example 
```dart
import 'package:swagger/api.dart';
// TODO Configure OAuth2 access token for authorization: auth
//swagger.api.Configuration.accessToken = 'YOUR_ACCESS_TOKEN';

var api_instance = new PostReactionsApi();
var id = id_example; // String | 
var body = new UpdatePostReaction(); // UpdatePostReaction | 

try { 
    var result = api_instance.postReactionsPut(id, body);
    print(result);
} catch (e) {
    print("Exception when calling PostReactionsApi->postReactionsPut: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 
 **body** | [**UpdatePostReaction**](UpdatePostReaction.md)|  | [optional] 

### Return type

[**ReadReaction**](ReadReaction.md)

### Authorization

[auth](../README.md#auth)

### HTTP request headers

 - **Content-Type**: application/json-patch+json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


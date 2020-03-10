# swagger.api.PostsApi

## Load the API package
```dart
import 'package:swagger/api.dart';
```

All URIs are relative to *https://qatechshare.o2f-it.com/api/blog*

Method | HTTP request | Description
------------- | ------------- | -------------
[**postsDelete**](PostsApi.md#postsDelete) | **DELETE** /Posts/{id} | PostsDelete
[**postsGet**](PostsApi.md#postsGet) | **GET** /Posts | PostsGet
[**postsGetById**](PostsApi.md#postsGetById) | **GET** /Posts/{id} | PostsGetById
[**postsPost**](PostsApi.md#postsPost) | **POST** /Posts | PostsPost
[**postsPut**](PostsApi.md#postsPut) | **PUT** /Posts/{id} | PostsPut


# **postsDelete**
> postsDelete(id)

PostsDelete



### Example 
```dart
import 'package:swagger/api.dart';
// TODO Configure OAuth2 access token for authorization: auth
//swagger.api.Configuration.accessToken = 'YOUR_ACCESS_TOKEN';

var api_instance = new PostsApi();
var id = id_example; // String | 

try { 
    api_instance.postsDelete(id);
} catch (e) {
    print("Exception when calling PostsApi->postsDelete: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

void (empty response body)

### Authorization

[auth](../README.md#auth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **postsGet**
> List<ReadPost> postsGet()

PostsGet



### Example 
```dart
import 'package:swagger/api.dart';
// TODO Configure OAuth2 access token for authorization: auth
//swagger.api.Configuration.accessToken = 'YOUR_ACCESS_TOKEN';

var api_instance = new PostsApi();

try { 
    var result = api_instance.postsGet();
    print(result);
} catch (e) {
    print("Exception when calling PostsApi->postsGet: $e\n");
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<ReadPost>**](ReadPost.md)

### Authorization

[auth](../README.md#auth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **postsGetById**
> ReadPost postsGetById(id)

PostsGetById



### Example 
```dart
import 'package:swagger/api.dart';
// TODO Configure OAuth2 access token for authorization: auth
//swagger.api.Configuration.accessToken = 'YOUR_ACCESS_TOKEN';

var api_instance = new PostsApi();
var id = id_example; // String | 

try { 
    var result = api_instance.postsGetById(id);
    print(result);
} catch (e) {
    print("Exception when calling PostsApi->postsGetById: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**ReadPost**](ReadPost.md)

### Authorization

[auth](../README.md#auth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **postsPost**
> ReadPost postsPost(body)

PostsPost



### Example 
```dart
import 'package:swagger/api.dart';
// TODO Configure OAuth2 access token for authorization: auth
//swagger.api.Configuration.accessToken = 'YOUR_ACCESS_TOKEN';

var api_instance = new PostsApi();
var body = new CreatePost(); // CreatePost | 

try { 
    var result = api_instance.postsPost(body);
    print(result);
} catch (e) {
    print("Exception when calling PostsApi->postsPost: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**CreatePost**](CreatePost.md)|  | [optional] 

### Return type

[**ReadPost**](ReadPost.md)

### Authorization

[auth](../README.md#auth)

### HTTP request headers

 - **Content-Type**: application/json-patch+json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **postsPut**
> ReadPost postsPut(id, body)

PostsPut



### Example 
```dart
import 'package:swagger/api.dart';
// TODO Configure OAuth2 access token for authorization: auth
//swagger.api.Configuration.accessToken = 'YOUR_ACCESS_TOKEN';

var api_instance = new PostsApi();
var id = id_example; // String | 
var body = new UpdatePost(); // UpdatePost | 

try { 
    var result = api_instance.postsPut(id, body);
    print(result);
} catch (e) {
    print("Exception when calling PostsApi->postsPut: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 
 **body** | [**UpdatePost**](UpdatePost.md)|  | [optional] 

### Return type

[**ReadPost**](ReadPost.md)

### Authorization

[auth](../README.md#auth)

### HTTP request headers

 - **Content-Type**: application/json-patch+json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


# swagger.api.CommentsApi

## Load the API package
```dart
import 'package:swagger/api.dart';
```

All URIs are relative to *https://qatechshare.o2f-it.com/api/blog*

Method | HTTP request | Description
------------- | ------------- | -------------
[**commentsDelete**](CommentsApi.md#commentsDelete) | **DELETE** /Comments/{id} | CommentsDelete
[**commentsGet**](CommentsApi.md#commentsGet) | **GET** /Comments/{id} | CommentsGet
[**commentsGetComments**](CommentsApi.md#commentsGetComments) | **GET** /Comments/Post/{postId} | CommentsGetComments
[**commentsPost**](CommentsApi.md#commentsPost) | **POST** /Comments | CommentsPost
[**commentsPut**](CommentsApi.md#commentsPut) | **PUT** /Comments/{id} | CommentsPut


# **commentsDelete**
> commentsDelete(id)

CommentsDelete



### Example 
```dart
import 'package:swagger/api.dart';
// TODO Configure OAuth2 access token for authorization: auth
//swagger.api.Configuration.accessToken = 'YOUR_ACCESS_TOKEN';

var api_instance = new CommentsApi();
var id = id_example; // String | 

try { 
    api_instance.commentsDelete(id);
} catch (e) {
    print("Exception when calling CommentsApi->commentsDelete: $e\n");
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

# **commentsGet**
> ReadComment commentsGet(id)

CommentsGet



### Example 
```dart
import 'package:swagger/api.dart';
// TODO Configure OAuth2 access token for authorization: auth
//swagger.api.Configuration.accessToken = 'YOUR_ACCESS_TOKEN';

var api_instance = new CommentsApi();
var id = id_example; // String | 

try { 
    var result = api_instance.commentsGet(id);
    print(result);
} catch (e) {
    print("Exception when calling CommentsApi->commentsGet: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**ReadComment**](ReadComment.md)

### Authorization

[auth](../README.md#auth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **commentsGetComments**
> List<ReadComment> commentsGetComments(postId)

CommentsGetComments



### Example 
```dart
import 'package:swagger/api.dart';
// TODO Configure OAuth2 access token for authorization: auth
//swagger.api.Configuration.accessToken = 'YOUR_ACCESS_TOKEN';

var api_instance = new CommentsApi();
var postId = postId_example; // String | 

try { 
    var result = api_instance.commentsGetComments(postId);
    print(result);
} catch (e) {
    print("Exception when calling CommentsApi->commentsGetComments: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **postId** | **String**|  | 

### Return type

[**List<ReadComment>**](ReadComment.md)

### Authorization

[auth](../README.md#auth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **commentsPost**
> ReadComment commentsPost(body)

CommentsPost



### Example 
```dart
import 'package:swagger/api.dart';
// TODO Configure OAuth2 access token for authorization: auth
//swagger.api.Configuration.accessToken = 'YOUR_ACCESS_TOKEN';

var api_instance = new CommentsApi();
var body = new CreateComment(); // CreateComment | 

try { 
    var result = api_instance.commentsPost(body);
    print(result);
} catch (e) {
    print("Exception when calling CommentsApi->commentsPost: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**CreateComment**](CreateComment.md)|  | [optional] 

### Return type

[**ReadComment**](ReadComment.md)

### Authorization

[auth](../README.md#auth)

### HTTP request headers

 - **Content-Type**: application/json-patch+json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **commentsPut**
> ReadComment commentsPut(id, body)

CommentsPut



### Example 
```dart
import 'package:swagger/api.dart';
// TODO Configure OAuth2 access token for authorization: auth
//swagger.api.Configuration.accessToken = 'YOUR_ACCESS_TOKEN';

var api_instance = new CommentsApi();
var id = id_example; // String | 
var body = new UpdateComment(); // UpdateComment | 

try { 
    var result = api_instance.commentsPut(id, body);
    print(result);
} catch (e) {
    print("Exception when calling CommentsApi->commentsPut: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 
 **body** | [**UpdateComment**](UpdateComment.md)|  | [optional] 

### Return type

[**ReadComment**](ReadComment.md)

### Authorization

[auth](../README.md#auth)

### HTTP request headers

 - **Content-Type**: application/json-patch+json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


# swagger.api.CommentReactionsApi

## Load the API package
```dart
import 'package:swagger/api.dart';
```

All URIs are relative to *https://qatechshare.o2f-it.com/api/blog*

Method | HTTP request | Description
------------- | ------------- | -------------
[**commentReactionsPost**](CommentReactionsApi.md#commentReactionsPost) | **POST** /CommentReactions | CommentReactionsPost
[**commentReactionsPut**](CommentReactionsApi.md#commentReactionsPut) | **PUT** /CommentReactions/{id} | CommentReactionsPut


# **commentReactionsPost**
> ReadReaction commentReactionsPost(body)

CommentReactionsPost



### Example 
```dart
import 'package:swagger/api.dart';
// TODO Configure OAuth2 access token for authorization: auth
//swagger.api.Configuration.accessToken = 'YOUR_ACCESS_TOKEN';

var api_instance = new CommentReactionsApi();
var body = new CreateCommentReaction(); // CreateCommentReaction | 

try { 
    var result = api_instance.commentReactionsPost(body);
    print(result);
} catch (e) {
    print("Exception when calling CommentReactionsApi->commentReactionsPost: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**CreateCommentReaction**](CreateCommentReaction.md)|  | [optional] 

### Return type

[**ReadReaction**](ReadReaction.md)

### Authorization

[auth](../README.md#auth)

### HTTP request headers

 - **Content-Type**: application/json-patch+json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **commentReactionsPut**
> ReadReaction commentReactionsPut(id, body)

CommentReactionsPut



### Example 
```dart
import 'package:swagger/api.dart';
// TODO Configure OAuth2 access token for authorization: auth
//swagger.api.Configuration.accessToken = 'YOUR_ACCESS_TOKEN';

var api_instance = new CommentReactionsApi();
var id = id_example; // String | 
var body = new UpdateCommentReaction(); // UpdateCommentReaction | 

try { 
    var result = api_instance.commentReactionsPut(id, body);
    print(result);
} catch (e) {
    print("Exception when calling CommentReactionsApi->commentReactionsPut: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 
 **body** | [**UpdateCommentReaction**](UpdateCommentReaction.md)|  | [optional] 

### Return type

[**ReadReaction**](ReadReaction.md)

### Authorization

[auth](../README.md#auth)

### HTTP request headers

 - **Content-Type**: application/json-patch+json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


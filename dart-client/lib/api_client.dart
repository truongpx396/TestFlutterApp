part of swagger.api;

class QueryParam {
  String name;
  String value;

  QueryParam(this.name, this.value);
}

class ApiClient {
  String basePath;
  //var client = new BrowserClient();
  var client = Client();

  Map<String, String> _defaultHeaderMap = {};
  Map<String, Authentication> _authentications = {};

  final _RegList = new RegExp(r'^List<(.*)>$');
  final _RegMap = new RegExp(r'^Map<String,(.*)>$');

  ApiClient({this.basePath: "https://qatechshare.o2f-it.com/api/blog"}) {
    // Setup authentications (key: authentication name, value: authentication).
    _authentications['auth'] = new OAuth();
  }

  void addDefaultHeader(String key, String value) {
    _defaultHeaderMap[key] = value;
  }

  dynamic _deserialize(dynamic value, String targetType) {
    try {
      switch (targetType) {
        case 'String':
          return '$value';
        case 'int':
          return value is int ? value : int.parse('$value');
        case 'bool':
          return value is bool ? value : '$value'.toLowerCase() == 'true';
        case 'double':
          return value is double ? value : double.parse('$value');
        case 'CreateComment':
          return new CreateComment.fromJson(value);
        case 'CreateCommentReaction':
          return new CreateCommentReaction.fromJson(value);
        case 'CreatePost':
          return new CreatePost.fromJson(value);
        case 'CreatePostReaction':
          return new CreatePostReaction.fromJson(value);
        case 'ReadComment':
          return new ReadComment.fromJson(value);
        case 'ReadPost':
          return new ReadPost.fromJson(value);
        case 'ReadReaction':
          return new ReadReaction.fromJson(value);
        case 'UpdateComment':
          return new UpdateComment.fromJson(value);
        case 'UpdateCommentReaction':
          return new UpdateCommentReaction.fromJson(value);
        case 'UpdatePost':
          return new UpdatePost.fromJson(value);
        case 'UpdatePostReaction':
          return new UpdatePostReaction.fromJson(value);
        default:
          {
            Match match;
            if (value is List &&
                (match = _RegList.firstMatch(targetType)) != null) {
              var newTargetType = match[1];
              var tmp = value.map((v) => _deserialize(v, newTargetType));
              return tmp.toList();
            } else if (value is Map &&
                (match = _RegMap.firstMatch(targetType)) != null) {
              var newTargetType = match[1];
              return new Map.fromIterables(value.keys,
                  value.values.map((v) => _deserialize(v, newTargetType)));
            }
          }
      }
    } catch (e, stack) {
      throw new ApiException.withInner(
          500, 'Exception during deserialization.', e, stack);
    }
    throw new ApiException(
        500, 'Could not find a suitable class for deserialization');
  }

  dynamic deserialize(String jsonVal, String targetType) {
    // Remove all spaces.  Necessary for reg expressions as well.
    targetType = targetType.replaceAll(' ', '');

    if (targetType == 'String') return jsonVal;

    var decodedJson = json.decode(jsonVal);
    return _deserialize(decodedJson, targetType);
  }

  String serialize(Object obj) {
    String serialized = '';
    if (obj == null) {
      serialized = '';
    } else {
      serialized = json.encode(obj);
    }
    return serialized;
  }

  // We don't use a Map<String, String> for queryParams.
  // If collectionFormat is 'multi' a key might appear multiple times.
  Future<Response> invokeAPI(
      String path,
      String method,
      Iterable<QueryParam> queryParams,
      Object body,
      Map<String, String> headerParams,
      Map<String, String> formParams,
      String contentType,
      List<String> authNames) async {
    _updateParamsForAuth(authNames, queryParams, headerParams);

    var ps = queryParams
        .where((p) => p.value != null)
        .map((p) => '${p.name}=${p.value}');
    String queryString = ps.isNotEmpty ? '?' + ps.join('&') : '';

    String url = basePath + path + queryString;

    headerParams.addAll(_defaultHeaderMap);
    headerParams['Content-Type'] = contentType;
    //headerParams['Authorization'] = "Bearer " +
    //  "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6Ik5VUXhNMFF6UkRrNE56VXpOVGcxUXpGRlJERXdRelEzUlRaQk1FUXpRamd5TVRreVFURXdPUSJ9.eyJnaXZlbl9uYW1lIjoiWHVhbiBUcnVvbmciLCJmYW1pbHlfbmFtZSI6IlBIVU5HIiwibmlja25hbWUiOiJ4cGh1bmdAYW1hcmlzLmNvbSIsIm5hbWUiOiJQSFVORyBYdWFuIFRydW9uZyIsInBpY3R1cmUiOiJkYXRhOmltYWdlL2JtcDtiYXNlNjQsLzlqLzRBQVFTa1pKUmdBQkFRRUFZQUJnQUFELzJ3QkRBQWdHQmdjR0JRZ0hCd2NKQ1FnS0RCUU5EQXNMREJrU0V3OFVIUm9mSGgwYUhCd2dKQzRuSUNJc0l4d2NLRGNwTERBeE5EUTBIeWM1UFRneVBDNHpOREwvMndCREFRa0pDUXdMREJnTkRSZ3lJUndoTWpJeU1qSXlNakl5TWpJeU1qSXlNakl5TWpJeU1qSXlNakl5TWpJeU1qSXlNakl5TWpJeU1qSXlNakl5TWpJeU1qTC93QUFSQ0FCQUFFQURBU0lBQWhFQkF4RUIvOFFBSHdBQUFRVUJBUUVCQVFFQUFBQUFBQUFBQUFFQ0F3UUZCZ2NJQ1FvTC84UUF0UkFBQWdFREF3SUVBd1VGQkFRQUFBRjlBUUlEQUFRUkJSSWhNVUVHRTFGaEJ5SnhGREtCa2FFSUkwS3h3UlZTMGZBa00ySnlnZ2tLRmhjWUdSb2xKaWNvS1NvME5UWTNPRGs2UTBSRlJrZElTVXBUVkZWV1YxaFpXbU5rWldabmFHbHFjM1IxZG5kNGVYcURoSVdHaDRpSmlwS1RsSldXbDVpWm1xS2pwS1dtcDZpcHFyS3p0TFcydDdpNXVzTER4TVhHeDhqSnl0TFQxTlhXMTlqWjJ1SGk0K1RsNXVmbzZlcng4dlAwOWZiMytQbjYvOFFBSHdFQUF3RUJBUUVCQVFFQkFRQUFBQUFBQUFFQ0F3UUZCZ2NJQ1FvTC84UUF0UkVBQWdFQ0JBUURCQWNGQkFRQUFRSjNBQUVDQXhFRUJTRXhCaEpCVVFkaGNSTWlNb0VJRkVLUm9iSEJDU016VXZBVlluTFJDaFlrTk9FbDhSY1lHUm9tSnlncEtqVTJOemc1T2tORVJVWkhTRWxLVTFSVlZsZFlXVnBqWkdWbVoyaHBhbk4wZFhaM2VIbDZnb09FaFlhSGlJbUtrcE9VbFphWG1KbWFvcU9rcGFhbnFLbXFzck8wdGJhM3VMbTZ3c1BFeGNiSHlNbkswdFBVMWRiWDJObmE0dVBrNWVibjZPbnE4dlAwOWZiMytQbjYvOW9BREFNQkFBSVJBeEVBUHdEM2svZVhudDBvRGNjOGRxWXhPVGowSDhxNWJ4QjRrTU1yV05rKzExNGxtL3UrdzkvZXM2bFJVMWRtbE9tNmpzamIxSFhOTzBsRDlwdUZWaHlVSExZL3ArTmM0L3hIMDlueERDU3VlSkpTUXY1Z0VmclhpdmlYeGZQY1gwbHZwOFljbzMrc2s1QVA5N0hkajc5UHpySWowblU3dFB0V29YMXl6dHlFRG5QNURwWE5LcFBlVXJlaDFRcFEyakcvbS84QWdIMHJhK0tSUEdKUElTUkQwYUdUSS9sV25iNjNZenJ6TUltOUpmbC9YcFh6bHBUYXJvY2FQRGN1eDZzcnRuUCtOZFhGNDQwdTVzSmJmVzFNS01oVnlRU0NQWTlRZnJUalhkKzRwNFpKSHVXYUFlYThlOEwrTjU5QnZWMHpVcDN1ZExiSGxUdnk4U2taVSs2NEl5TzNhdlhJNUZmWXlNR1ZzRldCeUNEM3JxakpTMk9TVVhGbWRxazhxUnh3d0hGeGNGWW96L2R5T1cvQVpOZVArT3J0ZkQ4bXBXNFpzdEpzaUJQekZkbzUvbitkZXZSRHovRWE1NUZ2YmJoL3ZNY2Z5QnJ4ZjR6V0R4ZU9iS1IwL2MzTVlkVDZrY0VmNTlhNTVKU2JtK21uOWZNNkl2bFNndXV2OWZJNVhTZE5WM1Y1TUZzN21KN3NlVFhXMjFtai9kZENSNzVybUV0NFVDK2NrOTFJZm1FTVp3b0h2LzhBWHJkc25XM0VaVzI4aFR4NVlQU3VLcHJxZW5UVnRMRDd3UjJ2eWVUTGNTTjBXTWRQeHJJdjdLUy9zcFkzczVJR1laUXNBZWUzU3QyL3Q1THBDa0V6UUhQM2w2MHlEVG5oaUorMHpTbkhJa2JOUXBKSzViZzJ6bE5Kdld1N0ZJcEIrOHRSNUp6MXdPbitINFY3TDhNZGZhNnNwTkl1SHpKYTRhRW5xWXllbjRIOURYbHVuNmRFcmF1QXFpWlo5MmU1QlhJL3JXNzRIdW10UEdPbkVINVpYTUxlNFlmNDRyMEtWUk42SGwxNlRpdFQzS3lpaTNTVGhCNXpCVlp1NUFIQS9VMTVEOGE3V2Q5VHNMbnoyZU9HSVNMRjJUNXNNUjlSajhxOVkwK2ZFN1JIK0pRUjljVmdlUFBDYzNpSzFobXRDR3VJQVY4cGpnU0tlb3oyTmJWSSs3b1lVWkxuWE1lVTZVaXl3Z0RCSkhXbHZtVzNuQ2xaR1VET1ZHY24wcDh1azNYaGpWRzB1NkkzSWlzcEJ5Q3BIR0Q3Y2o4S3A2cE5Nc3lNditxUEROMUsvaFhsU2kxS3pQYnB5VTRwbzBmdFhtZVcwY1RMeHl6SEJINGQ2MDFrVjREd0NleEhRMXpoS1BiNGdlNE1qQWJXSkNnSHZ3T3RhdHFIZ3NvMGxjdStQbVp1cHFKUlNacTdwR2RJMEZxMTIrN004cHlGSTQ2WXF6NFB0MW44VVdXN09JNUEvQjlEV1ZlU0NTNVpoMEhGZGg4UGRQTFhiM2pya2ZkU3V1TVdvcExkdGYxOXg1bFNmTkozMlYvNis4Nzd6V1NWWFU0WUFFZmxYUTJsMGwxQ0hYaGg5NWZRMXl6TnlQOEFkSDhxZkRjU1c4Z2tqWWhoK3Rla2VZVVBpYm8wZDNwY0dveC9MZVc3N0Zic3lIcXAvSHBYa2tHcFF6TnRrTzA5MWF2YXZFTjIycWFFOXVrUjg4T3JiUjBPUFN2RkwzU0pvN2lkWmJXVkNzamJkMFpHUm11SEZRMTVqME1ITjI1VFd0NTdDSlBNMnJuMXhVRTk4Ynh4SEFDRXo4ei9BT0ZKcGVoTk1GTDJrckJobGV1UHlybzdMd3JQTEtIbUt3UkRqQjYxd3IzbmFPclBRbEt5dk4yUnplbjZUUHFWK0xlRkRqUHpNT3dyMVhTYlNDeHM0NEV3aXg4WkhCSnFLeXNZdE10OXRyR0R1NnNSeWF0RHlwWkk0ODc1Y2pKSFkxNmRHbEplOVBmOGp4NjFXTDkyRzM1bi85az0iLCJ1cGRhdGVkX2F0IjoiMjAyMC0wMy0wOVQwOToxMDozMi40ODdaIiwiZW1haWwiOiJ4cGh1bmdAYW1hcmlzLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJpc3MiOiJodHRwczovL2F1dGgubWFudHUuY29tLyIsInN1YiI6ImFkfG8yZml0LWFkfDgyODdkYjc5LWEwNDYtNDI3Ny1iOTRiLWNiOTE4YWZlNGM3NiIsImF1ZCI6IkRzdWZ2d3c0V1JGOVhPVTRQTnZBZGpzcHBORGh2QmZMIiwiaWF0IjoxNTgzODM1NDUzLCJleHAiOjE1ODM4NzE0NTMsIm5vbmNlIjoiSFJsV1VXN01DYkNuNG9Ra3NsaV94ZyJ9.OFr1sfgl9VYrSMd_Q-AzAOsePQxqhkaacTBxFd12egLBBSty6pj9p79h_EgFBE4NPzdrpRL9L1NieL_JSmgI9jTI_WfcQZSZ09ZHXCZ7oQWRqaEF94ZMRgtoBD2eo9Q4l7GIVtmyrZ6blHDIk-PSVyrrOpJd_gupksMIiOfUCKDVkYg_hSL2jobvQ_x27006nJC_lS7bqvl7vEQo9f3u1pq608-FePN2nGxL-h25yJCneHcuVjdRvI94fUyR5EkuciTKCMtWHWpWxY3sieFLAdSIU3DQG5EomV-k3ruzpJ_Qn9RjxR4Q_mxOTtRrmxpCTGXWSVWX9j2GMUD6GG_Uog";

    headerParams['Authorization'] = "Bearer " + Configuration.IdAccessToken;

    if (body is MultipartRequest) {
      var request = new MultipartRequest(method, Uri.parse(url));
      request.fields.addAll(body.fields);
      request.files.addAll(body.files);
      request.headers.addAll(body.headers);
      request.headers.addAll(headerParams);
      var response = await client.send(request);
      return Response.fromStream(response);
    } else {
      var msgBody = contentType == "application/x-www-form-urlencoded"
          ? formParams
          : serialize(body);
      switch (method) {
        case "POST":
          return client.post(url, headers: headerParams, body: msgBody);
        case "PUT":
          return client.put(url, headers: headerParams, body: msgBody);
        case "DELETE":
          return client.delete(url, headers: headerParams);
        case "PATCH":
          return client.patch(url, headers: headerParams, body: msgBody);
        default:
          return client.get(url, headers: headerParams);
      }
    }
  }

  /// Update query and header parameters based on authentication settings.
  /// @param authNames The authentications to apply
  void _updateParamsForAuth(List<String> authNames,
      List<QueryParam> queryParams, Map<String, String> headerParams) {
    authNames.forEach((authName) {
      Authentication auth = _authentications[authName];
      if (auth == null)
        throw new ArgumentError("Authentication undefined: " + authName);
      auth.applyToParams(queryParams, headerParams);
    });
  }

  void setAccessToken(String accessToken) {
    _authentications.forEach((key, auth) {
      if (auth is OAuth) {
        auth.setAccessToken(accessToken);
      }
    });
  }
}

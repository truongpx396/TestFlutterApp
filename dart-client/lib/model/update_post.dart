part of swagger.api;

class UpdatePost {
  
  String postId = null;
  

  String title = null;
  

  String content = null;
  

  String updatedByLogin = null;
  

  DateTime updatedDate = null;
  

  String createdByLogin = null;
  
  UpdatePost();

  @override
  String toString() {
    return 'UpdatePost[postId=$postId, title=$title, content=$content, updatedByLogin=$updatedByLogin, updatedDate=$updatedDate, createdByLogin=$createdByLogin, ]';
  }

  UpdatePost.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    postId =
        json['PostId']
    ;
    title =
        json['Title']
    ;
    content =
        json['Content']
    ;
    updatedByLogin =
        json['UpdatedByLogin']
    ;
    updatedDate = json['UpdatedDate'] == null ? null : DateTime.parse(json['UpdatedDate']);
    createdByLogin =
        json['CreatedByLogin']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'PostId': postId,
      'Title': title,
      'Content': content,
      'UpdatedByLogin': updatedByLogin,
      'UpdatedDate': updatedDate == null ? '' : updatedDate.toUtc().toIso8601String(),
      'CreatedByLogin': createdByLogin
     };
  }

  static List<UpdatePost> listFromJson(List<dynamic> json) {
    return json == null ? new List<UpdatePost>() : json.map((value) => new UpdatePost.fromJson(value)).toList();
  }

  static Map<String, UpdatePost> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, UpdatePost>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new UpdatePost.fromJson(value));
    }
    return map;
  }
}


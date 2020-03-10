part of swagger.api;

class CreateComment {
  
  String postId = null;
  

  String content = null;
  

  String createdByLogin = null;
  

  DateTime createdDate = null;
  

  String createdByPicture = null;
  
  CreateComment();

  @override
  String toString() {
    return 'CreateComment[postId=$postId, content=$content, createdByLogin=$createdByLogin, createdDate=$createdDate, createdByPicture=$createdByPicture, ]';
  }

  CreateComment.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    postId =
        json['PostId']
    ;
    content =
        json['Content']
    ;
    createdByLogin =
        json['CreatedByLogin']
    ;
    createdDate = json['CreatedDate'] == null ? null : DateTime.parse(json['CreatedDate']);
    createdByPicture =
        json['CreatedByPicture']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'PostId': postId,
      'Content': content,
      'CreatedByLogin': createdByLogin,
      'CreatedDate': createdDate == null ? '' : createdDate.toUtc().toIso8601String(),
      'CreatedByPicture': createdByPicture
     };
  }

  static List<CreateComment> listFromJson(List<dynamic> json) {
    return json == null ? new List<CreateComment>() : json.map((value) => new CreateComment.fromJson(value)).toList();
  }

  static Map<String, CreateComment> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, CreateComment>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new CreateComment.fromJson(value));
    }
    return map;
  }
}


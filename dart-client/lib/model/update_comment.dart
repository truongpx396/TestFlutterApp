part of swagger.api;

class UpdateComment {
  
  String commentId = null;
  

  String content = null;
  

  String updatedByLogin = null;
  

  DateTime updatedDate = null;
  
  UpdateComment();

  @override
  String toString() {
    return 'UpdateComment[commentId=$commentId, content=$content, updatedByLogin=$updatedByLogin, updatedDate=$updatedDate, ]';
  }

  UpdateComment.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    commentId =
        json['CommentId']
    ;
    content =
        json['Content']
    ;
    updatedByLogin =
        json['UpdatedByLogin']
    ;
    updatedDate = json['UpdatedDate'] == null ? null : DateTime.parse(json['UpdatedDate']);
  }

  Map<String, dynamic> toJson() {
    return {
      'CommentId': commentId,
      'Content': content,
      'UpdatedByLogin': updatedByLogin,
      'UpdatedDate': updatedDate == null ? '' : updatedDate.toUtc().toIso8601String()
     };
  }

  static List<UpdateComment> listFromJson(List<dynamic> json) {
    return json == null ? new List<UpdateComment>() : json.map((value) => new UpdateComment.fromJson(value)).toList();
  }

  static Map<String, UpdateComment> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, UpdateComment>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new UpdateComment.fromJson(value));
    }
    return map;
  }
}


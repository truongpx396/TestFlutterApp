part of swagger.api;

class ReadComment {
  
  String postId = null;
  

  String commentId = null;
  

  String content = null;
  

  String createdByLogin = null;
  

  String updatedByLogin = null;
  

  DateTime createdDate = null;
  

  DateTime updatedDate = null;
  

  String status = null;
  

  String createdByPicture = null;
  

  List<ReadReaction> reactions = [];
  
  ReadComment();

  @override
  String toString() {
    return 'ReadComment[postId=$postId, commentId=$commentId, content=$content, createdByLogin=$createdByLogin, updatedByLogin=$updatedByLogin, createdDate=$createdDate, updatedDate=$updatedDate, status=$status, createdByPicture=$createdByPicture, reactions=$reactions, ]';
  }

  ReadComment.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    postId =
        json['PostId']
    ;
    commentId =
        json['CommentId']
    ;
    content =
        json['Content']
    ;
    createdByLogin =
        json['CreatedByLogin']
    ;
    updatedByLogin =
        json['UpdatedByLogin']
    ;
    createdDate = json['CreatedDate'] == null ? null : DateTime.parse(json['CreatedDate']);
    updatedDate = json['UpdatedDate'] == null ? null : DateTime.parse(json['UpdatedDate']);
    status =
        json['Status']
    ;
    createdByPicture =
        json['CreatedByPicture']
    ;
    reactions =
      ReadReaction.listFromJson(json['Reactions'])
;
  }

  Map<String, dynamic> toJson() {
    return {
      'PostId': postId,
      'CommentId': commentId,
      'Content': content,
      'CreatedByLogin': createdByLogin,
      'UpdatedByLogin': updatedByLogin,
      'CreatedDate': createdDate == null ? '' : createdDate.toUtc().toIso8601String(),
      'UpdatedDate': updatedDate == null ? '' : updatedDate.toUtc().toIso8601String(),
      'Status': status,
      'CreatedByPicture': createdByPicture,
      'Reactions': reactions
     };
  }

  static List<ReadComment> listFromJson(List<dynamic> json) {
    return json == null ? new List<ReadComment>() : json.map((value) => new ReadComment.fromJson(value)).toList();
  }

  static Map<String, ReadComment> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, ReadComment>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new ReadComment.fromJson(value));
    }
    return map;
  }
}


part of swagger.api;

class CreateCommentReaction {
  
  String commentId = null;
  

  String type = null;
  
  CreateCommentReaction();

  @override
  String toString() {
    return 'CreateCommentReaction[commentId=$commentId, type=$type, ]';
  }

  CreateCommentReaction.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    commentId =
        json['CommentId']
    ;
    type =
        json['Type']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'CommentId': commentId,
      'Type': type
     };
  }

  static List<CreateCommentReaction> listFromJson(List<dynamic> json) {
    return json == null ? new List<CreateCommentReaction>() : json.map((value) => new CreateCommentReaction.fromJson(value)).toList();
  }

  static Map<String, CreateCommentReaction> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, CreateCommentReaction>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new CreateCommentReaction.fromJson(value));
    }
    return map;
  }
}


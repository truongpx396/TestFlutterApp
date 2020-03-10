part of swagger.api;

class UpdateCommentReaction {
  
  String reactionId = null;
  

  String commentId = null;
  

  String type = null;
  
  UpdateCommentReaction();

  @override
  String toString() {
    return 'UpdateCommentReaction[reactionId=$reactionId, commentId=$commentId, type=$type, ]';
  }

  UpdateCommentReaction.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    reactionId =
        json['ReactionId']
    ;
    commentId =
        json['CommentId']
    ;
    type =
        json['Type']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'ReactionId': reactionId,
      'CommentId': commentId,
      'Type': type
     };
  }

  static List<UpdateCommentReaction> listFromJson(List<dynamic> json) {
    return json == null ? new List<UpdateCommentReaction>() : json.map((value) => new UpdateCommentReaction.fromJson(value)).toList();
  }

  static Map<String, UpdateCommentReaction> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, UpdateCommentReaction>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new UpdateCommentReaction.fromJson(value));
    }
    return map;
  }
}


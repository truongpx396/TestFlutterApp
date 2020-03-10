part of swagger.api;

class UpdatePostReaction {
  
  String reactionId = null;
  

  String postId = null;
  

  String type = null;
  
  UpdatePostReaction();

  @override
  String toString() {
    return 'UpdatePostReaction[reactionId=$reactionId, postId=$postId, type=$type, ]';
  }

  UpdatePostReaction.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    reactionId =
        json['ReactionId']
    ;
    postId =
        json['PostId']
    ;
    type =
        json['Type']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'ReactionId': reactionId,
      'PostId': postId,
      'Type': type
     };
  }

  static List<UpdatePostReaction> listFromJson(List<dynamic> json) {
    return json == null ? new List<UpdatePostReaction>() : json.map((value) => new UpdatePostReaction.fromJson(value)).toList();
  }

  static Map<String, UpdatePostReaction> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, UpdatePostReaction>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new UpdatePostReaction.fromJson(value));
    }
    return map;
  }
}


part of swagger.api;

class ReadReaction {
  
  String postId = null;
  

  String reactionId = null;
  

  String type = null;
  
  ReadReaction();

  @override
  String toString() {
    return 'ReadReaction[postId=$postId, reactionId=$reactionId, type=$type, ]';
  }

  ReadReaction.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    postId =
        json['PostId']
    ;
    reactionId =
        json['ReactionId']
    ;
    type =
        json['Type']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'PostId': postId,
      'ReactionId': reactionId,
      'Type': type
     };
  }

  static List<ReadReaction> listFromJson(List<dynamic> json) {
    return json == null ? new List<ReadReaction>() : json.map((value) => new ReadReaction.fromJson(value)).toList();
  }

  static Map<String, ReadReaction> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, ReadReaction>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new ReadReaction.fromJson(value));
    }
    return map;
  }
}


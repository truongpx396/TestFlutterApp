part of swagger.api;

class CreatePostReaction {
  
  String postId = null;
  

  String type = null;
  
  CreatePostReaction();

  @override
  String toString() {
    return 'CreatePostReaction[postId=$postId, type=$type, ]';
  }

  CreatePostReaction.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    postId =
        json['PostId']
    ;
    type =
        json['Type']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'PostId': postId,
      'Type': type
     };
  }

  static List<CreatePostReaction> listFromJson(List<dynamic> json) {
    return json == null ? new List<CreatePostReaction>() : json.map((value) => new CreatePostReaction.fromJson(value)).toList();
  }

  static Map<String, CreatePostReaction> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, CreatePostReaction>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new CreatePostReaction.fromJson(value));
    }
    return map;
  }
}


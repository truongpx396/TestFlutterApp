part of swagger.api;

class CreatePost {
  
  String title = null;
  

  String content = null;
  

  String createdByLogin = null;
  

  DateTime createdDate = null;
  
  CreatePost();

  @override
  String toString() {
    return 'CreatePost[title=$title, content=$content, createdByLogin=$createdByLogin, createdDate=$createdDate, ]';
  }

  CreatePost.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    title =
        json['Title']
    ;
    content =
        json['Content']
    ;
    createdByLogin =
        json['CreatedByLogin']
    ;
    createdDate = json['CreatedDate'] == null ? null : DateTime.parse(json['CreatedDate']);
  }

  Map<String, dynamic> toJson() {
    return {
      'Title': title,
      'Content': content,
      'CreatedByLogin': createdByLogin,
      'CreatedDate': createdDate == null ? '' : createdDate.toUtc().toIso8601String()
     };
  }

  static List<CreatePost> listFromJson(List<dynamic> json) {
    return json == null ? new List<CreatePost>() : json.map((value) => new CreatePost.fromJson(value)).toList();
  }

  static Map<String, CreatePost> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, CreatePost>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new CreatePost.fromJson(value));
    }
    return map;
  }
}


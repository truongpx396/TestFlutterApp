part of swagger.api;

class ReadPost {
  String postId = null;

  String title = null;

  String content = null;

  String createdByLogin = null;

  String updatedByLogin = null;

  DateTime createdDate = null;

  DateTime updatedDate = null;

  String status = null;

  List<ReadComment> comments = [];

  int commentsCount = null;

  String createdDateString = null;

  ReadPost();

  @override
  String toString() {
    return 'ReadPost[postId=$postId, title=$title, content=$content, createdByLogin=$createdByLogin, updatedByLogin=$updatedByLogin, createdDate=$createdDate, updatedDate=$updatedDate, status=$status, comments=$comments, commentsCount=$commentsCount, createdDateString=$createdDateString, ]';
  }

  ReadPost.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    postId = json['postId'];
    title = json['title'];
    content = json['content'];
    createdByLogin = json['createdByLogin'];
    updatedByLogin = json['updatedByLogin'];
    createdDate = json['createdDate'] == null
        ? null
        : DateTime.parse(json['createdDate']);
    updatedDate = json['updatedDate'] == null
        ? null
        : DateTime.parse(json['updatedDate']);
    status = json['status'];
    comments = ReadComment.listFromJson(json['comments']);
    commentsCount = json['commentsCount'];
    createdDateString = json['createdDateString'];
  }

  Map<String, dynamic> toJson() {
    return {
      'PostId': postId,
      'Title': title,
      'Content': content,
      'CreatedByLogin': createdByLogin,
      'UpdatedByLogin': updatedByLogin,
      'CreatedDate':
          createdDate == null ? '' : createdDate.toUtc().toIso8601String(),
      'UpdatedDate':
          updatedDate == null ? '' : updatedDate.toUtc().toIso8601String(),
      'Status': status,
      'Comments': comments,
      'CommentsCount': commentsCount,
      'CreatedDateString': createdDateString
    };
  }

  static List<ReadPost> listFromJson(List<dynamic> json) {
    return json == null
        ? new List<ReadPost>()
        : json.map((value) => new ReadPost.fromJson(value)).toList();
  }

  static Map<String, ReadPost> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, ReadPost>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = new ReadPost.fromJson(value));
    }
    return map;
  }
}

class News {
  int id;
  String title;
  int points;
  String user;
  int time;
  String timeAgo;
  int commentsCount;
  String type;
  String url;
  String domain;

  News(
      {this.id,
      this.title,
      this.time,
      this.timeAgo,
      this.points,
      this.commentsCount,
      this.domain,
      this.url,
      this.type,
      this.user});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
        id: json['id'],
        title: json['title'],
        time: json['time'],
        timeAgo: json['time_ago'],
        points: json['points'],
        commentsCount: json['comments_count'],
        domain: json['domain'],
        url: json['url'],
        type: json['type'],
        user: json['user']);
  }
}

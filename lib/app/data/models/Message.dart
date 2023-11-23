class Message {
  final String role;
  final String content;

  Message({required this.role, required this.content});

  Message.fromJson(Map<String, dynamic> json)
      : role = json['role'],
        content = json['content'];

  String get getContent => content;

  List<String> get getRankingList {
    List<String> list = [];
    content.split('\n').forEach((element) {
      if (element.isNotEmpty) {
        list.add(element);
      }
    });
    return list;
  }
}

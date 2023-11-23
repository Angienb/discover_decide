import 'Message.dart';

class Choice {
  final int index;
  final Message message;

  Choice({required this.index, required this.message});

  Choice.fromJson(Map<String, dynamic> json)
      : index = json['index'],
        message = Message.fromJson(json['message']);

  List<String> get getRankingList {
    // message content is like 1. One /n 2. Two /n 3. Three
    List<String> rankingList = message.content.split('\n');
    // remove empty elements
    rankingList.removeWhere((element) => element.isEmpty);
    // remove index number, just keep the text
    return rankingList.map((e) => e.split('. ')[1]).toList();
  }
}

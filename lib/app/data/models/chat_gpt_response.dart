import 'choice.dart';

class ChatGPTResponse {
  String id;
  String object;
  int created;
  String model;
  List<Choice> choices;

  ChatGPTResponse(
      {required this.id,
      required this.object,
      required this.created,
      required this.model,
      required this.choices});

  ChatGPTResponse.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        object = json['object'],
        created = json['created'],
        model = json['model'],
        choices = json['choices'] != null
            ? (json['choices'] as List).map((e) => Choice.fromJson(e)).toList()
            : [];

  Choice get getChoice => choices[0];
}

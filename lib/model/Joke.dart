import 'dart:convert' show json;

class Joke {
  String content;
  String updatetime;
  Joke(this.content,this.updatetime);
  Joke.fromJson(Map<String,dynamic> json):
        content = json['content'],
        updatetime = json['updatetime'];
  Map<String,dynamic> toJson() =>{
    'content':content,
    'updatetime':updatetime,
  };
}
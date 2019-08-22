import 'dart:convert' show json;

class Content {
  String content;
  String title;
  Content(this.content,this.title);
  Content.fromJson(Map<String,dynamic> json):
        content = json['content'],
        title = json['title'];
  Map<String,dynamic> toJson() =>{
    'content':content,
    'title':title,
  };
}
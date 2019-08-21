import 'dart:convert' show json;

class User {
  String content;
  String title;
  String e_id;
  User(this.content,this.title);
  User.fromJson(Map<String,dynamic> json):
        content = json['content'],
        e_id = json['e_id'],
        title = json['title'];
  Map<String,dynamic> toJson() =>{
    'content':content,
    'e_id':e_id,
    'title':title,
  };

}
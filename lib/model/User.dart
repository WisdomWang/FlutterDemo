import 'dart:convert' show json;

class User {
  String date;
  String title;
  String e_id;
  User(this.date,this.title,this.e_id);
  User.fromJson(Map<String,dynamic> json):
        date = json['date'],
        e_id = json['e_id'],
        title = json['title'];
  Map<String,dynamic> toJson() =>{
    'date':date,
    'e_id':e_id,
    'title':title,
  };
}
import 'dart:convert' show json;

class Media {
  String cnname;
  String poster;
  String channel_cn;
  Media(this.cnname,this.poster,this.channel_cn);
  Media.fromJson(Map<String,dynamic> json):
        cnname = json['cnname'],
        channel_cn = json['channel_cn'],
        poster = json['poster'];
  Map<String,dynamic> toJson() =>{
    'cnname':cnname,
    'poster':poster,
    'channel_cn':channel_cn,
  };
}
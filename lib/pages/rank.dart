import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert' show json;
import 'package:ca_flutter_app1/model/Media.dart';

class RankPage extends StatefulWidget {
  @override
  _RankPageState createState() => _RankPageState();
}

class _RankPageState extends State<RankPage> with AutomaticKeepAliveClientMixin {

  List<Media> listA = [];

  @override
  void initState() {
    super.initState();
    getHttp();
  }
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      title: '影剧推荐',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('影剧推荐'),
        ),
        body: new Center(
          child: VideoGridView(resources:listA),
        ),
      ),
    );
  }

  void getHttp() async {
    try {

      Response response = await Dio().get("http://ios.zmzapi.com/index.php?accesskey=519f9cab85c8059d17544947k361a827&client=1&g=api/v3&m=index&a=hot&limit=30");
      print(response);
      List map = json.decode(response.toString())['data']['month_list'];
      List<Media> list = [];
      list = map.map((v) => Media.fromJson(v)).toList();
      setState(() {
        listA = list;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  bool get wantKeepAlive => true;

}

class VideoGridView extends StatelessWidget {

  final List<Media> resources;
  const VideoGridView({Key key, this.resources}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(8.0),
      child: GridView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: resources.length,
        itemBuilder: (context, index) {
          return VideoGridItem(resource: resources[index],);
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 9 / 18,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0),
      ),
    );
  }
}

class VideoGridItem extends StatelessWidget {
  final Media resource;

  const VideoGridItem({Key key, this.resource}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      },
      child: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Card(
                elevation: 8.0,
                child: AspectRatio(
                    aspectRatio: 4 / 3,
                    child: Hero(
                      tag: resource.poster,
                      child: FadeInImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(resource.poster),
                        placeholder:AssetImage('images/placeholder.png'),
                      ),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                resource.cnname,
                //maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

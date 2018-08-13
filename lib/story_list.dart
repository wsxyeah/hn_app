import 'package:built_collection/built_collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:hn_app/data/entities.dart';

class StoryList extends StatelessWidget {
  final List<Story> stories;

  const StoryList({Key key, this.stories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: AlwaysScrollableScrollPhysics(),
      children: ListTile.divideTiles(
        context: context,
        tiles: stories.map((story) => StoryRow(story: story)),
      ).toList(),
    );
  }
}

class StoryRow extends StatelessWidget {
  final Story story;

  const StoryRow({Key key, this.story}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(story.title, softWrap: true),
        subtitle: Text(story.by),
        contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        onTap: () async {
          var url = story.url;
          if (await canLaunch(url)) {
            await launch(url);
          } else {
            print('Could not launch $url');
          }
        });
  }
}

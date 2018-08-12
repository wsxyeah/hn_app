import 'package:built_collection/built_collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
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
        tiles: stories.map((story) => _buildRow(story)),
      ).toList(),
    );
  }

  Widget _buildRow(Story story) {
    return StoreConnector<AppState, void Function(Object)>(
      builder: (context, toggleFavorite) {
        return ListTile(
            title: Text(story.title),
            subtitle: Text(story.by),
            contentPadding:
                EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            onTap: () => toggleFavorite(null));
      },
      converter: (store) => (Object wordPair) => store.dispatch(null),
    );
  }
}

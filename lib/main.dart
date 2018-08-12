import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hn_app/data/actions.dart';
import 'package:hn_app/data/entities.dart';
import 'package:hn_app/data/store.dart';
import 'package:hn_app/story_list.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';

void main() {
  var store = configureStore();
  runApp(MyApp(store: store));

  store.dispatch(FetchStoriesAction(true, null, null));
}

class FakeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hi"),
        ),
        body: Center(
          child: Text("How are you"),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  final DevToolsStore<AppState> store;

  const MyApp({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
        store: store,
        child: MaterialApp(
          home: ConnectedTopStories(),
          theme: ThemeData(
              primaryColor: CupertinoColors.activeBlue,
              platform: TargetPlatform.iOS),
        ));
  }
}

class TopStoriesViewModel {
  final List<Story> stories;
  final bool isLoading;

  final VoidCallback refresh;

  TopStoriesViewModel(this.stories, this.isLoading, this.refresh);
}

class ConnectedTopStories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, TopStoriesViewModel>(
      builder: (context, vm) => TopStories(vm: vm),
      converter: (store) => TopStoriesViewModel(
          store.state.itemIds.map((id) => store.state.items[id]).toList(),
          store.state.isLoading,
          () => store.dispatch(FetchStoriesAction(true, null, null))),
    );
  }
}

class TopStories extends StatelessWidget {
  final TopStoriesViewModel vm;

  const TopStories({Key key, this.vm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        textTheme: Theme.of(context).textTheme,
        title: vm.isLoading
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text("Hacker News"),
                  Container(
                    margin: EdgeInsets.only(left: 8.0),
                    child: CupertinoActivityIndicator(),
                  )
                ],
              )
            : Text("Hacker News"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.inbox),
            tooltip: "Inbox",
            onPressed: () {},
          )
        ],
      ),
      body: _buildList(),
    );
  }

  Widget _buildList() {
    return new CustomScrollView(
      slivers: <Widget>[
        CupertinoSliverRefreshControl(
          onRefresh: () {
            vm.refresh();
            return Future.value(null);
          },
        ),
        StoryList(
          stories: vm.stories,
        )
      ],
    );
  }
}

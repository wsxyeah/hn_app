import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';

part 'entities.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  bool get isLoading;

  BuiltMap<int, Story> get items;

  BuiltList<int> get itemIds;

  AppState._();

  factory AppState([updates(AppStateBuilder b)]) = _$AppState;

  factory AppState.initial() => AppState((b) => b
    ..isLoading = false
    ..itemIds = ListBuilder()
    ..items = MapBuilder());
}

abstract class Story implements Built<Story, StoryBuilder> {
  String get by;

  int get descendants;

  int get id;

  BuiltList<int> get kids;

  int get score;

  String get title;

  String get type;

  String get url;

  static Serializer<Story> get serializer => _$storySerializer;

  Story._();

  factory Story([updates(StoryBuilder b)]) = _$Story;
}

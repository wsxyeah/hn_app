// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entities.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_catches_without_on_clauses
// ignore_for_file: avoid_returning_this
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: omit_local_variable_types
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: sort_constructors_first

Serializer<Story> _$storySerializer = new _$StorySerializer();

class _$StorySerializer implements StructuredSerializer<Story> {
  @override
  final Iterable<Type> types = const [Story, _$Story];
  @override
  final String wireName = 'Story';

  @override
  Iterable serialize(Serializers serializers, Story object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'by',
      serializers.serialize(object.by, specifiedType: const FullType(String)),
      'descendants',
      serializers.serialize(object.descendants,
          specifiedType: const FullType(int)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'kids',
      serializers.serialize(object.kids,
          specifiedType:
              const FullType(BuiltList, const [const FullType(int)])),
      'score',
      serializers.serialize(object.score, specifiedType: const FullType(int)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Story deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StoryBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'by':
          result.by = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'descendants':
          result.descendants = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'kids':
          result.kids.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))
              as BuiltList);
          break;
        case 'score':
          result.score = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$AppState extends AppState {
  @override
  final bool isLoading;
  @override
  final BuiltMap<int, Story> items;
  @override
  final BuiltList<int> itemIds;

  factory _$AppState([void updates(AppStateBuilder b)]) =>
      (new AppStateBuilder()..update(updates)).build();

  _$AppState._({this.isLoading, this.items, this.itemIds}) : super._() {
    if (isLoading == null)
      throw new BuiltValueNullFieldError('AppState', 'isLoading');
    if (items == null) throw new BuiltValueNullFieldError('AppState', 'items');
    if (itemIds == null)
      throw new BuiltValueNullFieldError('AppState', 'itemIds');
  }

  @override
  AppState rebuild(void updates(AppStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  AppStateBuilder toBuilder() => new AppStateBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! AppState) return false;
    return isLoading == other.isLoading &&
        items == other.items &&
        itemIds == other.itemIds;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, isLoading.hashCode), items.hashCode), itemIds.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppState')
          ..add('isLoading', isLoading)
          ..add('items', items)
          ..add('itemIds', itemIds))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState _$v;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  MapBuilder<int, Story> _items;
  MapBuilder<int, Story> get items =>
      _$this._items ??= new MapBuilder<int, Story>();
  set items(MapBuilder<int, Story> items) => _$this._items = items;

  ListBuilder<int> _itemIds;
  ListBuilder<int> get itemIds => _$this._itemIds ??= new ListBuilder<int>();
  set itemIds(ListBuilder<int> itemIds) => _$this._itemIds = itemIds;

  AppStateBuilder();

  AppStateBuilder get _$this {
    if (_$v != null) {
      _isLoading = _$v.isLoading;
      _items = _$v.items?.toBuilder();
      _itemIds = _$v.itemIds?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppState other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$AppState;
  }

  @override
  void update(void updates(AppStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$AppState build() {
    _$AppState _$result;
    try {
      _$result = _$v ??
          new _$AppState._(
              isLoading: isLoading,
              items: items.build(),
              itemIds: itemIds.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
        _$failedField = 'itemIds';
        itemIds.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AppState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Story extends Story {
  @override
  final String by;
  @override
  final int descendants;
  @override
  final int id;
  @override
  final BuiltList<int> kids;
  @override
  final int score;
  @override
  final String title;
  @override
  final String type;
  @override
  final String url;

  factory _$Story([void updates(StoryBuilder b)]) =>
      (new StoryBuilder()..update(updates)).build();

  _$Story._(
      {this.by,
      this.descendants,
      this.id,
      this.kids,
      this.score,
      this.title,
      this.type,
      this.url})
      : super._() {
    if (by == null) throw new BuiltValueNullFieldError('Story', 'by');
    if (descendants == null)
      throw new BuiltValueNullFieldError('Story', 'descendants');
    if (id == null) throw new BuiltValueNullFieldError('Story', 'id');
    if (kids == null) throw new BuiltValueNullFieldError('Story', 'kids');
    if (score == null) throw new BuiltValueNullFieldError('Story', 'score');
    if (title == null) throw new BuiltValueNullFieldError('Story', 'title');
    if (type == null) throw new BuiltValueNullFieldError('Story', 'type');
    if (url == null) throw new BuiltValueNullFieldError('Story', 'url');
  }

  @override
  Story rebuild(void updates(StoryBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  StoryBuilder toBuilder() => new StoryBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Story) return false;
    return by == other.by &&
        descendants == other.descendants &&
        id == other.id &&
        kids == other.kids &&
        score == other.score &&
        title == other.title &&
        type == other.type &&
        url == other.url;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, by.hashCode), descendants.hashCode),
                            id.hashCode),
                        kids.hashCode),
                    score.hashCode),
                title.hashCode),
            type.hashCode),
        url.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Story')
          ..add('by', by)
          ..add('descendants', descendants)
          ..add('id', id)
          ..add('kids', kids)
          ..add('score', score)
          ..add('title', title)
          ..add('type', type)
          ..add('url', url))
        .toString();
  }
}

class StoryBuilder implements Builder<Story, StoryBuilder> {
  _$Story _$v;

  String _by;
  String get by => _$this._by;
  set by(String by) => _$this._by = by;

  int _descendants;
  int get descendants => _$this._descendants;
  set descendants(int descendants) => _$this._descendants = descendants;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  ListBuilder<int> _kids;
  ListBuilder<int> get kids => _$this._kids ??= new ListBuilder<int>();
  set kids(ListBuilder<int> kids) => _$this._kids = kids;

  int _score;
  int get score => _$this._score;
  set score(int score) => _$this._score = score;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  StoryBuilder();

  StoryBuilder get _$this {
    if (_$v != null) {
      _by = _$v.by;
      _descendants = _$v.descendants;
      _id = _$v.id;
      _kids = _$v.kids?.toBuilder();
      _score = _$v.score;
      _title = _$v.title;
      _type = _$v.type;
      _url = _$v.url;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Story other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$Story;
  }

  @override
  void update(void updates(StoryBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Story build() {
    _$Story _$result;
    try {
      _$result = _$v ??
          new _$Story._(
              by: by,
              descendants: descendants,
              id: id,
              kids: kids.build(),
              score: score,
              title: title,
              type: type,
              url: url);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'kids';
        kids.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Story', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}
